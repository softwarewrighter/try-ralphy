# Ralphy Parallel Execution Demo

This demo showcases Ralphy's parallel execution capability with 3 AI agents working simultaneously.

## What This Demo Shows

1. **Parallel Agents**: 3 Claude instances working on independent tasks at the same time
2. **Git Worktrees**: Each agent gets an isolated directory via `git worktree`
3. **Branch Per Agent**: Each agent commits to its own branch (`ralphy/agent-N-task-name`)
4. **Parallel Groups**: YAML configuration controls which tasks can run together
5. **Auto-Merge**: After completion, branches are merged back to main

## Architecture

```
parallel-demo/
├── setup.sh           # Creates/resets the demo environment
├── run-parallel.sh    # Runs Ralphy in parallel mode
├── README.md          # This file
└── subject-repo/      # The repo Ralphy will modify
    ├── package.json
    ├── tasks.yaml     # Task definitions with parallel_group
    └── src/
        ├── index.js   # Main entry (Group 2 - runs last)
        ├── users.js   # Agent 1 (Group 1 - parallel)
        ├── products.js # Agent 2 (Group 1 - parallel)
        └── orders.js  # Agent 3 (Group 1 - parallel)
```

## Key Insight: Explicit API Specifications

When multiple AI agents work in parallel, they can't coordinate with each other. To ensure their code integrates correctly, the PRD must specify **exact API contracts**.

**Bad (vague):**
```yaml
- title: "Implement users.js with User class"
```

**Good (explicit):**
```yaml
- title: |
    Implement src/users.js with this EXACT API:

    class User {
      constructor(name, email) - stores name, email, generates unique id
      static create(name, email) - creates and returns new User instance
      static findById(id) - returns User or null
      toJSON() - returns { id, name, email }
    }

    Export: export { User }
```

This ensures Agent 4 (integration) knows exactly what methods to call.

## How Parallel Groups Work

In `tasks.yaml`:
```yaml
tasks:
  # Group 1: These 3 tasks run IN PARALLEL (simultaneously)
  - title: |
      Implement src/users.js with EXACT API...
    parallel_group: 1

  - title: |
      Implement src/products.js with EXACT API...
    parallel_group: 1

  - title: |
      Implement src/orders.js with EXACT API...
    parallel_group: 1

  # Group 2: This task runs AFTER Group 1 completes
  - title: |
      Update src/index.js using EXACT calls...
    parallel_group: 2
```

## Running the Demo

### Prerequisites

```bash
# Required
brew install jq     # JSON parsing
brew install yq     # YAML parsing (for tasks.yaml)

# Claude Code CLI must be installed
claude --version
```

### Step 1: Setup

```bash
cd parallel-demo
./setup.sh
```

This creates a fresh `subject-repo/` with placeholder files.

### Step 2: Preview (Optional)

```bash
./run-parallel.sh --dry-run
```

See what Ralphy would do without executing.

### Step 3: Run

```bash
./run-parallel.sh
```

Watch as 3 agents spin up and work simultaneously:
- Agent 1 implements `users.js`
- Agent 2 implements `products.js`
- Agent 3 implements `orders.js`

After Group 1 completes, a single agent handles the `index.js` integration.

### Step 4: Verify

```bash
cd subject-repo
git log --oneline --graph --all  # See branches and merges
git branch -a                     # List all branches
node src/index.js                 # Run the completed app
```

## How Ralphy Handles Parallelism

```
                    ┌─────────────────────────────────────┐
                    │           Ralphy Script              │
                    └─────────────────────────────────────┘
                                     │
                                     │ Reads tasks.yaml
                                     │ Groups by parallel_group
                                     ▼
              ┌──────────────────────────────────────────────┐
              │              GROUP 1 (Parallel)               │
              └──────────────────────────────────────────────┘
                    │              │              │
          ┌─────────┴──┐   ┌──────┴──────┐   ┌──┴─────────┐
          │  Agent 1   │   │   Agent 2    │   │  Agent 3   │
          │            │   │              │   │            │
          │ worktree:  │   │  worktree:   │   │ worktree:  │
          │ /tmp/.../1 │   │  /tmp/.../2  │   │ /tmp/.../3 │
          │            │   │              │   │            │
          │ branch:    │   │  branch:     │   │ branch:    │
          │ ralphy/    │   │  ralphy/     │   │ ralphy/    │
          │ agent-1-   │   │  agent-2-    │   │ agent-3-   │
          │ users      │   │  products    │   │ orders     │
          └─────┬──────┘   └──────┬───────┘   └──────┬─────┘
                │                 │                  │
                └────────────────┬┴──────────────────┘
                                 │
                                 ▼ Auto-merge to main
              ┌──────────────────────────────────────────────┐
              │              GROUP 2 (Sequential)             │
              └──────────────────────────────────────────────┘
                                 │
                          ┌──────┴──────┐
                          │   Agent     │
                          │   index.js  │
                          │ integration │
                          └─────────────┘
```

## Resetting the Demo

To start fresh:

```bash
./setup.sh    # Removes and recreates subject-repo
```

## Command Reference

```bash
# Full command Ralphy runs:
../ralphy/ralphy.sh --yaml tasks.yaml --parallel --max-parallel 3 --verbose

# Key flags:
#   --yaml tasks.yaml    Use YAML task file (supports parallel_group)
#   --parallel           Enable parallel execution
#   --max-parallel 3     Run up to 3 agents simultaneously
#   --verbose            Show detailed output
#   --dry-run            Preview without executing
#   --create-pr          Create PRs instead of auto-merge
```

## Troubleshooting

**yq not found**: `brew install yq`

**Worktree errors**: Run `git worktree prune` in subject-repo

**Merge conflicts**: Ralphy attempts AI-powered conflict resolution. If it fails, resolve manually.
