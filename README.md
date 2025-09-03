# rendergit

> Just show me the code.

Tired of clicking around complex file hierarchies of GitHub repos? Do you just want to see all of the code on a single page? Enter `rendergit`. Flatten any GitHub repository into a single, static HTML page with syntax highlighting, markdown rendering, and a clean sidebar navigation. Perfect for code review, exploration, and an instant Ctrl+F experience.

## Basic usage

Install and use easily with [uv](https://docs.astral.sh/uv/):

```bash
uv tool install git+https://github.com/karpathy/rendergit
rendergit https://github.com/karpathy/nanogpt
```

Alternatively, more manual pip install example:

```bash
git clone https://github.com/karpathy/rendergit
cd rendergit
pip install -e .
rendergit https://github.com/karpathy/nanoGPT
```

The code will:
1. Clone the repo to a temporary directory
2. Render its source code into a single static temporary HTML file
3. Automatically open the file in your browser

Once open, you can toggle between two views:
- **👤 Human View**: Browse with syntax highlighting, sidebar navigation, visual goodies
- **🤖 LLM View**: Copy the entire codebase as CXML text to paste into Claude, ChatGPT, etc.

There's a few other smaller options, see the code.

## Docker Usage

If you prefer using Docker, you can build and run `rendergit` in a containerized environment:

### Using Docker Compose (Recommended)

```bash
# Clone this repository
git clone https://github.com/karpathy/rendergit
cd rendergit

# Build the Docker image
docker-compose build

# Run rendergit with any GitHub repository
docker-compose run --rm rendergit https://github.com/karpathy/nanogpt
```

The generated HTML file will be saved in the current directory, and will automatically open in your default browser.

### Using Docker directly

```bash
# Build the image
docker build -t rendergit .

# Run with a volume mount to save the output
docker run --rm -v "$(pwd):/output" rendergit https://github.com/karpathy/nanogpt
```

### Docker Benefits

- **No local dependencies**: Python, git, and all required packages are included
- **Consistent environment**: Works the same across different operating systems
- **Easy cleanup**: No need to manage Python virtual environments
- **Volume mounting**: Generated HTML files are saved to your local directory

## Features

- **Dual view modes** - toggle between Human and LLM views
  - **👤 Human View**: Pretty interface with syntax highlighting and navigation
  - **🤖 LLM View**: Raw CXML text format - perfect for copying to Claude/ChatGPT for code analysis
- **Syntax highlighting** for code files via Pygments
- **Markdown rendering** for README files and docs
- **Smart filtering** - skips binaries and oversized files
- **Directory tree** overview at the top
- **Sidebar navigation** with file links and sizes
- **Responsive design** that works on mobile
- **Search-friendly** - use Ctrl+F to find anything across all files

## Contributing

I vibe coded this utility a few months ago but I keep using it very often so I figured I'd just share it. I don't super intend to maintain or support it though.

## License

BSD0 go nuts
