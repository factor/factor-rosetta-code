! Task:
! 
! Create a program that computes an approximation of the principal N^(th)
! root of X as the largest integer less than or equal to R for which
! R^(N)=X.
! 
! ──where:
! 
!        N  is a positive integer. 
!        X  is a non-negative integer. 
!        R  (the root)  is a non-negative real number. 
! 
! No arbitrary limits should be placed on the magnitudes of the numbers
! involved.
! 
! Example: With N=3 and X=8 you would calculate the number 2 because
! 2³ = 8
! 
! Example: With N=3 and X=9 you would again calculate the number 2 because
! 2 is the largest integer less than or equal to the root R.
! 
! Example: With N=2 and X=2×100^(2,000) you would calculate a large
! integer consisting of the first 2,001 digits (in order) of the square
! root of two.

USING: io kernel locals math math.functions math.order
prettyprint sequences ;

:: (root) ( a b -- n )
    a 1 - 1 :> ( a1 c! )
    [| x | a1 x * b x a1 ^ /i + a /i ] :> f
    c f call :> d!
    d f call :> e!
    [ c { d e } member? ] [
        d c! e d! e f call e!
    ] until
    d e min ;

: root ( a b -- n ) dup 2 < [ nip ] [ (root) ] if ;

"First 2,001 digits of the square root of two:" print
2 100 2000 ^ 2 * root .
