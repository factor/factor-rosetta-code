! A magic square is an NxN square matrix whose numbers (usually integers)
! consist of consecutive numbers arranged so that the sum of each row and
! column, and both long (main) diagonals are equal to the same sum (which
! is called the magic number or magic constant).
! 
! The numbers are usually (but not always) the first N² positive integers.
! 
! A magic square whose rows and columns add up to a magic number but whose
! main diagonals do not, is known as a semimagic square.
! 
!   --- --- ---
!   8   1   6
!   3   5   7
!   4   9   2
!   --- --- ---
! 
! Task
! 
! For any odd N, generate a magic square with the integers 1 ──► N, and
! show the results here.
! 
! Optionally, show the magic number.
! 
! You should demonstrate the generator by showing at least a magic square
! for N = 5.
! 
! Related tasks
! 
! -   Magic squares of singly even order
! -   Magic squares of doubly even order
! 
! See also:
! 
! -   MathWorld™ entry: Magic_square
! -   Odd Magic Squares (1728.org)

USING: formatting io kernel math math.matrices math.ranges
sequences sequences.extras ;
IN: rosetta-code.magic-squares-odd

: inc-matrix ( n -- matrix )
    [ 0 ] dip dup [ 1 + dup ] make-matrix nip ;

: rotator ( n -- seq ) 2/ dup [ neg ] dip [a,b] ;

: odd-magic-square ( n -- matrix )
    [ inc-matrix ] [ rotator [ rotate ] 2map flip ] dup tri ;

: show-square ( n -- )
    dup "Order: %d\n" printf odd-magic-square dup
    [ [ "%4d" printf ] each nl ] each first sum
    "Magic number: %d\n\n" printf ;

3 5 11 [ show-square ] tri@
