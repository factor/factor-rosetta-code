! Many puzzle games such as the 15 puzzle game need a way to randomize the
! order of the pieces. One way to do this is to create an array and fill
! it with random values, with each element's index in that array being its
! position. Unfortunately, most random number generators can produce the
! same value more than once, which in this case isn't what we want.
! 
! Task:
! 
! Create a random number generator and have it output the numbers 1
! through 20 (inclusive), in a random order. It cannot produce the same
! value more than once.
! 
! Or:
! 
! Given the output of an existing random number generator that does
! produce repeated output, create a function that constrains the output to
! numbers 1 through 20 (inclusive), and no number is output more than
! once. (Technically it stops being "random" at that point, but that's
! beyond the scope of this task.) Try your best not to make the process
! take too long at runtime.
! 
! For the second version of the task, the random number generator itself
! need not be implemented; however you must specify its possible range of
! values before your constraint function is applied. (e.g "Assume the
! random number generator creates a value from 0 to 255, and values are
! allowed to repeat")
! 
! Related Tasks
! 
! -   -   15 Puzzle Solver
!     -   16 Puzzle Game
!     -   Random numbers

USING: kernel math.combinatorics math.ranges prettyprint random
sequences ;

: random-permutation ( seq -- newseq )
    [ length dup nPk random ] keep permutation ;

20 [1,b] random-permutation .
