#!/bin/bash
# =============================================================================
# Ralphy Parallel Demo - Run Script
# =============================================================================
# This script runs Ralphy in parallel mode with 3 agents.
#
# How Ralphy parallel mode works:
# 1. Each agent gets its own git worktree (isolated directory)
# 2. Each agent gets its own branch (ralphy/agent-N-task-name)
# 3. Agents work independently and simultaneously
# 4. After completion, branches are auto-merged back to main
#
# YAML parallel_group controls execution order:
# - Group 1 tasks run in parallel first
# - Group 2 tasks run after Group 1 completes
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RALPHY_SCRIPT="$SCRIPT_DIR/../ralphy/ralphy.sh"
SUBJECT_REPO="$SCRIPT_DIR/subject-repo"

echo "=== Ralphy Parallel Demo ==="
echo ""

# Check that subject-repo exists
if [ ! -d "$SUBJECT_REPO" ]; then
    echo "ERROR: subject-repo not found. Run ./setup.sh first."
    exit 1
fi

# Check that ralphy.sh exists
if [ ! -f "$RALPHY_SCRIPT" ]; then
    echo "ERROR: ralphy.sh not found at $RALPHY_SCRIPT"
    exit 1
fi

cd "$SUBJECT_REPO"

echo "Working directory: $(pwd)"
echo "Using YAML tasks with parallel groups"
echo ""
echo "Task structure:"
echo "  Group 1 (parallel): users.js, products.js, orders.js"
echo "  Group 2 (sequential): index.js integration"
echo ""

# Show current tasks
echo "Tasks from tasks.yaml:"
yq -o=json '.tasks[]' tasks.yaml | jq -r '"  Group \(.parallel_group): \(.title | split(" ") | .[0:6] | join(" "))..."'
echo ""

# Default: run with verbose output so you can see what's happening
# Add --dry-run flag to preview without executing
DRY_RUN="${1:-}"

if [ "$DRY_RUN" == "--dry-run" ]; then
    echo "=== DRY RUN MODE ==="
    "$RALPHY_SCRIPT" --yaml tasks.yaml --parallel --max-parallel 3 --verbose --dry-run
else
    echo "Starting Ralphy with 3 parallel agents..."
    echo "Press Ctrl+C to stop"
    echo ""
    "$RALPHY_SCRIPT" --yaml tasks.yaml --parallel --max-parallel 3 --verbose
fi

echo ""
echo "=== Execution Complete ==="
echo ""
echo "Check the results:"
echo "  git log --oneline --graph --all"
echo "  git branch -a"
echo "  node src/index.js"
