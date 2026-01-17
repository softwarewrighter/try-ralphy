#!/bin/bash
# Simulate Ralphy parallel execution for demo recording
# Shows the key moments of parallel agent execution

echo "$ ./run-parallel.sh"
sleep 0.5
echo ""
echo "=== Ralphy Parallel Demo ==="
echo ""
echo "Working directory: /parallel-demo/subject-repo"
echo "Using YAML tasks with parallel groups"
echo ""
echo "Task structure:"
echo "  Group 1 (parallel): users.js, products.js, orders.js"
echo "  Group 2 (sequential): index.js integration"
echo ""
sleep 2

echo "Tasks from tasks.yaml:"
echo "  Group 1: Implement src/users.js: class User..."
echo "  Group 1: Implement src/products.js: class Product..."
echo "  Group 1: Implement src/orders.js: class Order..."
echo "  Group 2: Update src/index.js: import and integrate..."
echo ""
sleep 2

echo "Starting Ralphy with 3 parallel agents..."
echo ""
sleep 1

echo "============================================"
echo "Ralphy - Running until PRD is complete"
echo "Engine: Claude Code"
echo "Mode: parallel (max: 3)"
echo "============================================"
echo ""
sleep 1

# Group 1 - Parallel execution
echo ">>> GROUP 1 - Starting 3 parallel agents..."
echo ""
sleep 0.5

echo "  [Agent 1] Branch: ralphy/agent-1-users"
echo "  [Agent 2] Branch: ralphy/agent-2-products"
echo "  [Agent 3] Branch: ralphy/agent-3-orders"
echo ""
sleep 1

echo "  [Agent 1] Worktree: /tmp/ralphy-worktree-1"
echo "  [Agent 2] Worktree: /tmp/ralphy-worktree-2"
echo "  [Agent 3] Worktree: /tmp/ralphy-worktree-3"
echo ""
sleep 2

# Simulate parallel progress
echo "  [Agent 1] ⟳ Implementing User class..."
echo "  [Agent 2] ⟳ Implementing Product class..."
echo "  [Agent 3] ⟳ Implementing Order class..."
sleep 3

echo "  [Agent 2] ✓ Done - Product class complete"
sleep 1
echo "  [Agent 3] ✓ Done - Order class complete"
sleep 1
echo "  [Agent 1] ✓ Done - User class complete"
echo ""
sleep 1

# Merging
echo ">>> Merging Group 1 branches to main..."
echo ""
sleep 0.5
echo "  Merging ralphy/agent-1-users... ✓"
sleep 0.5
echo "  Merging ralphy/agent-2-products... ✓"
sleep 0.5
echo "  Merging ralphy/agent-3-orders... ✓"
echo ""
sleep 1

# Group 2 - Sequential
echo ">>> GROUP 2 - Starting integration agent..."
echo ""
sleep 0.5
echo "  [Agent 4] Branch: ralphy/agent-4-index"
echo "  [Agent 4] ⟳ Integrating all modules..."
sleep 3
echo "  [Agent 4] ✓ Done - Integration complete"
echo ""
sleep 0.5
echo "  Merging ralphy/agent-4-index... ✓"
echo ""
sleep 1

echo "============================================"
echo "PRD complete! Finished 4 task(s)."
echo "============================================"
echo ""
sleep 1

echo ">>> Git History:"
echo ""
echo "*   9709f3a Merge index.js integration"
echo "|\\"
echo "| * 1613d6c Implement modules and integrate"
echo "* |   2a0e1a1 Merge orders.js"
echo "|\\ \\"
echo "| * | 7693c34 Implement Order class"
echo "| |/"
echo "* |   51495e7 Merge products.js"
echo "|\\ \\"
echo "| * | 178a037 Implement Product class"
echo "| |/"
echo "* / 304fabd Implement User class"
echo "|/"
echo "* cb294e3 Initial commit"
echo ""
sleep 2

echo ">>> Testing: node src/index.js"
echo ""
sleep 0.5
echo "User: { id: 'u-1', name: 'Alice', email: 'alice@example.com' }"
echo "Laptop: { name: 'Laptop', price: 999.99, sku: 'SKU001' }"
echo "Mouse: { name: 'Mouse', price: 26.99, sku: 'SKU002' }"
echo "Order Total: 1053.97"
echo "Order Status: pending"
echo ""
sleep 2

echo "============================================"
echo "Parallel execution complete!"
echo "  3 agents worked simultaneously (Group 1)"
echo "  1 agent integrated the code (Group 2)"
echo "============================================"
