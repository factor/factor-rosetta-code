! From Chung-Chieh Shan (LtU):
! 
! Your stair-climbing robot has a very simple low-level API: the "step"
! function takes no argument and attempts to climb one step as a side
! effect. Unfortunately, sometimes the attempt fails and the robot
! clumsily falls one step instead. The "step" function detects what
! happens and returns a boolean flag: true on success, false on failure.
! 
! Write a function "step_up" that climbs one step up [from the initial
! position] (by repeating "step" attempts if necessary). Assume that the
! robot is not already at the top of the stairs, and neither does it ever
! reach the bottom of the stairs. How small can you make "step_up"? Can
! you avoid using variables (even immutable ones) and numbers?
! 
! Here's a pseudo-code of a simple recursive solution without using
! variables:
! 
!     func step_up()
!     {
!         if not step() {
!             step_up();
!             step_up();
!         }
!     }
! 
! Inductive proof that step_up() steps up one step, if it terminates:
! 
! -   Base case (if the step() call returns true): it stepped up one step.
!     QED
! -   Inductive case (if the step() call returns false): Assume that
!     recursive calls to step_up() step up one step. It stepped down one
!     step (because step() returned false), but now we step up two steps
!     using two step_up() calls. QED
! 
! The second (tail) recursion above can be turned into an iteration, as
! follows:
! 
!     func step_up()
!     {
!         while not step() {
!             step_up();
!         }
!     }

: step-up ( -- ) step [ step-up step-up ] unless ;
