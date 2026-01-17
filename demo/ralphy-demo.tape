# VHS Tape - Ralphy Demo: Autonomous PRD Execution
# Run with: cd /Users/mike/github/softwarewrighter/try-ralphy && vhs demo/ralphy-demo.tape

Output demo/ralphy-demo.mp4

Set FontSize 24
Set Width 1920
Set Height 1080
Set Theme "Dracula"
Set Padding 40
Set TypingSpeed 40ms

# Show the PRD first
Type "cat demo/PRD.md"
Enter
Sleep 4s

# Clear screen
Type "clear"
Enter
Sleep 500ms

# Run the simulation (shows command + output)
Type "./demo/simulate-ralphy.sh"
Enter
Sleep 45s

# Hold on final output
Sleep 3s
