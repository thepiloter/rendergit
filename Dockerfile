# Use Python 3.11 slim image as base
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install git (required for cloning repositories)
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pyproject.toml uv.lock ./
COPY rendergit.py ./

# Install uv for fast dependency management
RUN pip install uv

# Install dependencies using uv
RUN uv pip install --system -r pyproject.toml

# Install the package in development mode
RUN pip install -e .

# Create a directory for output files
RUN mkdir -p /output

# Set the entrypoint to rendergit command
ENTRYPOINT ["rendergit"]

# Default command (can be overridden)
CMD ["--help"]
