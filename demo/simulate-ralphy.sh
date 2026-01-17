#!/bin/bash
# Simulate ralphy output for demo recording
# This replays the transcript with realistic timing

# Show the command being "run"
echo "$ ./ralphy/ralphy.sh --prd PRD.md"
sleep 0.5
echo ""
echo "============================================"
echo "Ralphy - Running until PRD is complete"
echo "Engine: Claude Code"
echo "Source: markdown (PRD.md)"
echo "============================================"
echo ""
sleep 1

# Task 1
echo ">>> Task 1"
echo "    Completed: 00 | Remaining: 5"
echo "--------------------------------------------"
sleep 0.5
echo -n "  ✓ Done             │ Create a simple Node.js project with pac"
sleep 3
echo ""
echo ""
echo "Task 1 is complete. I have:"
echo ""
echo "1. **Created package.json** with:"
echo "   - Name: \"hello-world\""
echo "   - Version, description, main entry point"
echo ""
echo "2. **Created tests** in package.test.js"
echo ""
echo "3. **All tests pass** (4/4)"
echo ""
echo "4. **Committed changes**"
sleep 2

# Task 2
echo ""
echo ">>> Task 2"
echo "    Completed: 1 | Remaining: 4"
echo "--------------------------------------------"
sleep 0.5
echo -n "  ✓ Done             │ Create an index.js file with a function"
sleep 3
echo ""
echo ""
echo "Task 2 completed successfully:"
echo ""
echo "- Created index.js with a greet() function"
echo "- Created index.test.js with 3 tests"
echo "- All 7 tests pass"
echo "- Committed: feat: Add index.js with greet function"
sleep 2

# Task 3
echo ""
echo ">>> Task 3"
echo "    Completed: 2 | Remaining: 3"
echo "--------------------------------------------"
sleep 0.5
echo -n "  ✓ Done             │ Create a utils.js file with a function t"
sleep 3
echo ""
echo ""
echo "Task 3 completed successfully:"
echo ""
echo "- Created utils.js with formatDate() function"
echo "- Created utils.test.js with 5 tests"
echo "- All 12 tests pass"
echo "- Changes committed"
sleep 2

# Task 4
echo ""
echo ">>> Task 4"
echo "    Completed: 3 | Remaining: 2"
echo "--------------------------------------------"
sleep 0.5
echo -n "  ✓ Done             │ Create a main.js file that imports both"
sleep 3
echo ""
echo ""
echo "Task 4 completed successfully."
echo ""
echo "- Created main.js importing both modules"
echo "- All 16 tests pass"
echo "- Committed: feat: Add main.js"
sleep 2

# Task 5
echo ""
echo ">>> Task 5"
echo "    Completed: 4 | Remaining: 1"
echo "--------------------------------------------"
sleep 0.5
echo -n "  ✓ Done             │ Add a README.md documenting the project"
sleep 3
echo ""
echo ""
echo "Task completed. All tasks in the PRD are now complete."
echo ""
echo "<promise>COMPLETE</promise>"
sleep 1

echo ""
echo "============================================"
echo "PRD complete! Finished 5 task(s)."
echo "============================================"
echo ""
echo ">>> Cost Summary"
echo "Input tokens:  228"
echo "Output tokens: 19095"
echo "Total tokens:  19323"
echo "Est. cost:     \$.287109"
echo "============================================"
