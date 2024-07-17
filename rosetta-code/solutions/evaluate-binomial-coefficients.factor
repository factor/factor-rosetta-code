! This programming task, is to calculate ANY binomial coefficient.
! 
! However, it has to be able to output $\binom{5}{3}$, which is 10.
! 
! This formula is recommended:
! 
!     
! 
!         $\binom{n}{k} = \frac{n!}{(n-k)!k!} = \frac{n(n-1)(n-2)\ldots(n-k+1)}{k(k-1)(k-2)\ldots 1}$
! 
! See Also:
! 
! -   Combinations and permutations
! -   Pascal's triangle


: fact ( n -- n-factorial )
    dup 0 = [ drop 1 ] [ dup 1 - fact * ] if ;

: choose ( n k -- n-choose-k )
    2dup - [ fact ] tri@ * / ;

! outputs 10
5 3 choose .

! alternative using folds
USE: math.ranges

! (product [n..k+1] / product [n-k..1])
: choose-fold ( n k -- n-choose-k )
    2dup 1 + [a,b] product -rot - 1 [a,b] product / ;

