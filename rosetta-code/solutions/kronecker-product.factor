! Task:
! 
! Implement the Kronecker product of two matrices (arbitrary sized)
! resulting in a block matrix.
! 
! Test cases:
! 
! Show results for each of the following two samples:
! 
! Sample 1 (from Wikipedia):
! 
! 
! 
!               ┌   ┐     ┌   ┐     ┌           ┐
!               │1 2│     │0 5│     │ 0  5  0 10│
!               │3 4│  x  │6 7│  =  │ 6  7 12 14│
!           └   ┘     └   ┘     │ 0 15  0 20│
!                               │18 21 24 28│
!                                   └           ┘ 
! 
! Sample 2:
! 
!               ┌     ┐     ┌       ┐     ┌                       ┐       
!               │0 1 0│     │1 1 1 1│     │0 0 0 0 1 1 1 1 0 0 0 0│
!               │1 1 1│  x  │1 0 0 1│  =  │0 0 0 0 1 0 0 1 0 0 0 0│
!               │0 1 0│     │1 1 1 1│     │0 0 0 0 1 1 1 1 0 0 0 0│
!           └     ┘     └       ┘     │1 1 1 1 1 1 1 1 1 1 1 1│
!                                         │1 0 0 1 1 0 0 1 1 0 0 1│
!                                         │1 1 1 1 1 1 1 1 1 1 1 1│
!                                         │0 0 0 0 1 1 1 1 0 0 0 0│
!                                         │0 0 0 0 1 0 0 1 0 0 0 0│
!                                         │0 0 0 0 1 1 1 1 0 0 0 0│
!                                         └                       ┘
! 
! See implementations and results below in JavaScript and PARI/GP
! languages.
! 
! Related task:
! 
! -    Kronecker product based fractals.

USING: kernel math.matrices.extras prettyprint ;

{ { 1 2 } { 3 4 } }
{ { 0 5 } { 6 7 } }
{ { 0 1 0 } { 1 1 1 } { 0 1 0 } }
{ { 1 1 1 1 } { 1 0 0 1 } { 1 1 1 1 } }
[ kronecker-product . ] 2bi@
