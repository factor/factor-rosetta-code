! Task:
! 
! The objective is to write a function that finds the sum of all positive
! multiples of 3 or 5 below n.
! 
! Show output for n = 1000.
! 
! This is is the same as Project Euler problem 1.
! 
! Extra credit: do this efficiently for n = 1e20 or higher.

USING: kernel math prettyprint ;

: sum-multiples ( m n upto -- sum )
    >integer 1 - [ 2dup * ] dip
    [ 2dup swap [ mod - + ] [ /i * 2/ ] 2bi ] curry tri@
    [ + ] [ - ] bi* ;

3 5 1000 sum-multiples .
3 5 1e20 sum-multiples .
