#!/bin/bash
# =============================================================================
# Ralphy Parallel Demo - Setup Script
# =============================================================================
# This script sets up a fresh demo environment for Ralphy parallel execution.
# Run this to create or reset the demo subject repo.
# =============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUBJECT_REPO="$SCRIPT_DIR/subject-repo"

echo "=== Ralphy Parallel Demo Setup ==="
echo ""

# Check for required dependencies
echo "Checking dependencies..."
command -v git >/dev/null 2>&1 || { echo "ERROR: git is required"; exit 1; }
command -v jq >/dev/null 2>&1 || { echo "ERROR: jq is required (brew install jq)"; exit 1; }
command -v yq >/dev/null 2>&1 || { echo "WARNING: yq not found - install with 'brew install yq' for YAML support"; }
command -v claude >/dev/null 2>&1 || { echo "ERROR: claude CLI is required"; exit 1; }
echo "All required dependencies found."
echo ""

# Remove existing subject-repo if it exists
if [ -d "$SUBJECT_REPO" ]; then
    echo "Removing existing subject-repo..."
    rm -rf "$SUBJECT_REPO"
fi

# Create subject-repo directory
echo "Creating subject-repo..."
mkdir -p "$SUBJECT_REPO/src"
cd "$SUBJECT_REPO"

# Initialize git
git init

# Create package.json
cat > package.json << 'EOF'
{
  "name": "parallel-demo-app",
  "version": "1.0.0",
  "description": "Demo app for Ralphy parallel execution",
  "main": "src/index.js",
  "type": "module",
  "scripts": {
    "start": "node src/index.js"
  }
}
EOF

# Create src/index.js
cat > src/index.js << 'EOF'
// Main entry point - will import all modules
// Placeholder for parallel agent work

console.log("Parallel Demo App");
EOF

# Create src/users.js
cat > src/users.js << 'EOF'
// User module - to be implemented by Agent 1
// Placeholder
EOF

# Create src/products.js
cat > src/products.js << 'EOF'
// Products module - to be implemented by Agent 2
// Placeholder
EOF

# Create src/orders.js
cat > src/orders.js << 'EOF'
// Orders module - to be implemented by Agent 3
// Placeholder
EOF

# Create tasks.yaml with parallel groups and EXPLICIT API specifications (single-line format)
cat > tasks.yaml << 'EOF'
tasks:
  # Group 1: Independent modules (run in parallel)
  # API specs are explicit to ensure compatibility

  - title: "Implement src/users.js: class User with constructor(name,email), static create(name,email), static findById(id), toJSON() returning {id,name,email}. Use 'export { User }'"
    completed: false
    parallel_group: 1

  - title: "Implement src/products.js: class Product with constructor(name,price,sku), static create(name,price,sku), static findBySku(sku), applyDiscount(percent), toJSON() returning {name,price,sku}. Use 'export { Product }'"
    completed: false
    parallel_group: 1

  - title: "Implement src/orders.js: class Order with constructor() setting items=[],total=0,status='pending', addItem(product,quantity), calculateTotal(), getStatus(). Use 'export { Order }'"
    completed: false
    parallel_group: 1

  # Group 2: Integration (runs after group 1)

  - title: "Update src/index.js: import {User} from './users.js', {Product} from './products.js', {Order} from './orders.js'. Create user=User.create('Alice','alice@example.com'), laptop=Product.create('Laptop',999.99,'SKU001'), mouse=Product.create('Mouse',29.99,'SKU002'). Call mouse.applyDiscount(10). Create order=new Order(), order.addItem(laptop,1), order.addItem(mouse,2). Log user.toJSON(), laptop.toJSON(), mouse.toJSON(), order.calculateTotal(), order.getStatus()"
    completed: false
    parallel_group: 2
EOF

# Initial commit
git add -A
git commit -m "Initial commit: base project structure with parallel task groups"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Subject repo created at: $SUBJECT_REPO"
echo ""
echo "Files created:"
echo "  - package.json"
echo "  - src/index.js"
echo "  - src/users.js"
echo "  - src/products.js"
echo "  - src/orders.js"
echo "  - tasks.yaml (with parallel_group settings)"
echo ""
echo "Next: Run ./run-parallel.sh to start Ralphy in parallel mode"
