! Task
! 
! 1. Initialization and building the 3D space
! 
! • Opens an 800x600 pixel window titled "Ring 3D - Cube Collector Game".
! • Sets up a fixed, bird's-eye view 3D camera that sees the playing field
! from above and behind. • Places a gray grid (DrawGrid) on the ground to
! have a benchmark in space.
! 
! 2. Characters and Starting Positions
! 
! • Player: Appears as a red sphere in the middle of the level (at
! coordinates 0, 1, 0). • Target: A green cube that initially waits at
! position (4, 1, -4).
! 
! 3. Control and Movement
! 
! • The program monitors the keyboard continuously. The player can use the
! arrow keys (ARROW keys) to move the red sphere forward, backward, left
! and right (on the X and Z axes) on the grid.
! 
! 4. Collision Detection and Scoring
! 
! • The code calculates the distance between the red sphere and the green
! cube for each frame (using the Pythagorean theorem). • If the player
! gets closer to the dice than 1.5 units, then:
! 
!    • The player receives 10 points (score += 10). 
!    • The green cube disappears and respawns in a new random location within the grid (random(14) - 7). 
! 
! 5. Display (GUI)
! 
! • A semi-transparent grey rectangle in the upper left corner of the
! screen continuously indicates the current score (SCORE) and a reminder
! for guidance. The game runs at 60 FPS until the user closes the window.
! The goal is essentially to "touch" the green cube with the red sphere as
! many times as possible and thus maximize your score.


