# VHS Tape - Ralphy Parallel Demo
# Run with: cd /Users/mike/github/softwarewrighter/try-ralphy/parallel-demo && vhs demo/parallel-demo.tape

Output demo/parallel-demo.mp4

Set FontSize 24
Set Width 1920
Set Height 1080
Set Theme "Dracula"
Set Padding 40
Set TypingSpeed 40ms

# Show the task structure first
Type "cat subject-repo/tasks.yaml"
Enter
Sleep 5s

# Clear and run
Type "clear"
Enter
Sleep 500ms

# Run the simulation
Type "./demo/simulate-parallel.sh"
Enter
Sleep 45s

# Hold on final output
Sleep 3s
