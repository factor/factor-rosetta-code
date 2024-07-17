! A method of choosing a line randomly from a file:
! 
! -   -   Without reading the file more than once
!     -   When substantial parts of the file cannot be held in memory
!     -   Without knowing how many lines are in the file
! 
! Is to:
! 
! -   -   keep the first line of the file as a possible choice, then
!     -   Read the second line of the file if possible and make it the
!         possible choice if a uniform random value between zero and one
!         is less than 1/2.
!     -   Read the third line of the file if possible and make it the
!         possible choice if a uniform random value between zero and one
!         is less than 1/3.
!     -   ...
!     -   Read the Nth line of the file if possible and make it the
!         possible choice if a uniform random value between zero and one
!         is less than 1/N
! 
! -   -   Return the computed possible choice when no further lines exist
!         in the file.
! 
! Task:
! 
! 1.  Create a function/method/routine called one_of_n that given n, the
!     number of actual lines in a file, follows the algorithm above to
!     return an integer - the line number of the line chosen from the
!     file.
! 
! The number returned can vary, randomly, in each run.
! 
! 1.  Use one_of_n in a simulation to find what would be the chosen line
!     of a 10-line file simulated 1,000,000 times.
! 2.  Print and show how many times each of the 10 lines is chosen as a
!     rough measure of how well the algorithm works.
! 
! Note: You may choose a smaller number of repetitions if necessary, but
! mention this up-front.
! 
! Note: This is a specific version of a Reservoir Sampling algorithm:
! https://en.wikipedia.org/wiki/Reservoir_sampling

! rosettacode/random-line/random-line.factor
USING: io kernel locals math random ;
IN: rosettacode.random-line

:: random-line ( -- line )
    readln :> choice! 1 :> count!
    [ readln dup ]
    [ count 1 + dup count! random zero?
        [ choice! ] [ drop ] if
    ] while drop
    choice ;
