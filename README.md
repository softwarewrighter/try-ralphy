# Try Ralphy

Demonstrations of [Ralphy](https://github.com/michaelshimeles/ralphy), an autonomous AI coding loop that orchestrates AI assistants to complete development tasks.

## About Ralphy

Ralphy is a bash script that enables AI assistants (Claude Code, OpenCode, Codex, Cursor) to autonomously work through a Product Requirements Document (PRD), completing tasks one by one with automatic git commits.

**Learn more:**
- [Ralphy GitHub Repository](https://github.com/michaelshimeles/ralphy)
- [Introduction Video](https://www.youtube.com/watch?v=J2thowAjPM0)

## Video Playlist

Check out the [Claude Ralph plugin and related tech](https://www.youtube.com/playlist?list=PLKjvVAEaR4itHPQIZ6ZjWdnrC-Zn6k0I9) YouTube playlist:

[![What If Your AI Never Gave Up?](images/thumbnail1.png)](https://www.youtube.com/watch?v=grTC-Zj0LC4)
**[What If Your AI Never Gave Up?](https://www.youtube.com/watch?v=grTC-Zj0LC4)**

[![Parallel AI Coding - with Git Worktrees](images/thumbnail2.png)](https://www.youtube.com/watch?v=OGV-ZilSGcw)
**[Parallel AI Coding - with Git Worktrees](https://www.youtube.com/watch?v=OGV-ZilSGcw)**

## Demos

This repository contains two demonstrations of Ralphy's capabilities:

### Demo 1: Sequential Execution (Basic)

A simple "Hello World" demo showing Ralphy completing 5 tasks sequentially.

**Location:** Root directory + [`demo/`](demo/)

**What it demonstrates:**
- Autonomous task completion from a PRD
- Automatic git commits after each task
- Basic Node.js project scaffolding

**Files:**
- [`PRD.md`](PRD.md) - Product Requirements Document with 5 tasks
- [`demo/simulate-ralphy.sh`](demo/simulate-ralphy.sh) - Script to simulate/record the demo
- [`demo/ralphy-demo.tape`](demo/ralphy-demo.tape) - VHS tape file for terminal recording

**Run it:**
```bash
# Install Ralphy first
git clone https://github.com/michaelshimeles/ralphy.git

# Run Ralphy on the PRD
./ralphy/ralphy.sh --prd PRD.md
```

### Demo 2: Parallel Execution (Advanced)

Demonstrates 3 AI agents working simultaneously on independent tasks using git worktrees.

**Location:** [`parallel-demo/`](parallel-demo/)

**What it demonstrates:**
- Multiple Claude instances working in parallel
- Git worktrees for isolated workspaces
- Branch-per-agent workflow with auto-merge
- **Critical insight:** Explicit API specifications in PRDs for parallel agent coordination

**Files:**
- [`parallel-demo/README.md`](parallel-demo/README.md) - Detailed documentation
- [`parallel-demo/setup.sh`](parallel-demo/setup.sh) - Creates fresh demo environment
- [`parallel-demo/run-parallel.sh`](parallel-demo/run-parallel.sh) - Runs parallel agents
- [`parallel-demo/subject-repo/tasks.yaml`](parallel-demo/subject-repo/tasks.yaml) - Task definitions with `parallel_group`

**Run it:**
```bash
cd parallel-demo
./setup.sh          # Create fresh demo environment
./run-parallel.sh   # Run 3 parallel agents + 1 sequential
cd subject-repo && node src/index.js  # Verify results
```

## Key Insight: Explicit API Specifications

When running multiple AI agents in parallel, they cannot coordinate with each other. The PRD must specify **exact API contracts** to ensure compatibility:

**Bad (vague):**
```yaml
- title: "Implement users.js with User class"
```

**Good (explicit):**
```yaml
- title: "Implement src/users.js: class User with constructor(name,email),
         static create(name,email), static findById(id),
         toJSON() returning {id,name,email}. Use 'export { User }'"
```

## Prerequisites

```bash
# Required tools
brew install jq      # JSON parsing
brew install yq      # YAML parsing (for parallel demo)

# Claude Code CLI must be installed
claude --version

# Clone Ralphy
git clone https://github.com/michaelshimeles/ralphy.git
```

## Project Structure

```
try-ralphy/
├── README.md              # This file
├── LICENSE                # MIT License
├── PRD.md                 # Demo 1: PRD for sequential execution
├── demo/                  # Demo 1: Recording scripts and assets
│   ├── simulate-ralphy.sh
│   ├── ralphy-demo.tape
│   └── stills/
├── parallel-demo/         # Demo 2: Parallel execution
│   ├── README.md          # Detailed parallel demo docs
│   ├── setup.sh           # Environment setup script
│   ├── run-parallel.sh    # Parallel execution script
│   └── subject-repo/      # Target repository for agents
│       └── tasks.yaml     # Parallel task definitions
├── index.js               # Demo 1 output: greeting function
├── utils.js               # Demo 1 output: date formatting
├── main.js                # Demo 1 output: main entry point
└── *.test.js              # Demo 1 output: test files
```

## License

[MIT](LICENSE) - Copyright (c) 2026 Michael A. Wright

## Acknowledgments

- [Michael Shimeles](https://github.com/michaelshimeles) for creating Ralphy
- [Anthropic](https://anthropic.com) for Claude Code
