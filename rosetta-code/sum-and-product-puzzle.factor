! Task:
! 
! Solve the "Impossible Puzzle":
! 
! It can be hard to wrap one's head around what the three lines of dialog
! between S (the "sum guy") and P (the "product guy") convey about the
! values of X and Y.
! 
! So for your convenience, here's a break-down:
! 
!        Quote                               Implied fact
!   ---- ----------------------------------- ----------------------------------------------------------------------------------------------------------------------
!   1)   S says "P does not know X and Y."   For every possible sum decomposition of the number X+Y, the product has in turn more than one product decomposition.
!   2)   P says "Now I know X and Y."        The number X*Y has only one product decomposition for which fact 1 is true.
!   3)   S says "Now I also know X and Y."   The number X+Y has only one sum decomposition for which fact 2 is true.
! 
! Terminology:
! 
! -   "sum decomposition" of a number = Any pair of positive integers
!     (A, B) so that A+B equals the number. Here, with the additional
!     constraint 2 ≤ A < B.
! -   "product decomposition" of a number = Any pair of positive integers
!     (A, B) so that A*B equals the number. Here, with the additional
!     constraint 2 ≤ A < B.
! 
! Your program can solve the puzzle by considering all possible pairs
! (X, Y) in the range 2 ≤ X < Y ≤ 98, and then successively eliminating
! candidates based on the three facts. It turns out only one solution
! remains!
! 
! See the Python example for an implementation that uses this approach
! with a few optimizations.
! 
! -   Wikipedia: Sum and Product Puzzle

USING: combinators.short-circuit fry kernel literals math
math.ranges memoize prettyprint sequences sets tools.time ;
IN: rosetta-code.sum-and-product

CONSTANT: s1 $[
    2 100 [a,b] dup cartesian-product concat
    [ first2 { [ < ] [ + 100 < ] } 2&& ] filter
]

: quot-eq ( pair quot -- seq )
    [ s1 ] 2dip tuck '[ @ _ @ = ] filter ; inline

MEMO: sum-eq ( pair -- seq ) [ first2 + ] quot-eq ;
MEMO: mul-eq ( pair -- seq ) [ first2 * ] quot-eq ;

: s2 ( -- seq )
    s1 [ sum-eq [ mul-eq length 1 = not ] all? ] filter ;

: only-1 ( seq quot -- newseq )
    over '[ @ _ intersect length 1 = ] filter ; inline

: sum-and-product ( -- )
    [ s2 [ mul-eq ] [ sum-eq ] [ only-1 ] bi@ . ] time ;

MAIN: sum-and-product
