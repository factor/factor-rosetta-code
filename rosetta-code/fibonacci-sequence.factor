! The Fibonacci sequence is a sequence F_(n) of natural numbers defined
! recursively:
! 
!       F⁰ = 0 
!       F¹ = 1 
!       F_(n) = F_(n-1) + F_(n-2), if n>1 
! 
! Task:
! 
! Write a function to generate the n^(th) Fibonacci number.
! 
! Solutions can be iterative or recursive (though recursive solutions are
! generally considered too slow and are mostly used as an exercise in
! recursion).
! 
! The sequence is sometimes extended into negative numbers by using a
! straightforward inverse of the positive definition:
! 
!       F_(n) = F_(n+2) - F_(n+1), if n<0   
! 
! support for negative n in the solution is optional.
! 
! Related tasks:
! 
! -   Fibonacci n-step number sequences‎
! -   Leonardo numbers
! 
! References:
! 
! -   Wikipedia, Fibonacci number
! -   Wikipedia, Lucas number
! -   MathWorld, Fibonacci Number
! -   Some identities for r-Fibonacci numbers
! -   OEIS Fibonacci numbers
! -   OEIS Lucas numbers

USE: math.matrices

: fib ( n -- m )
    dup 2 < [
        [ { { 0 1 } { 1 1 } } ] dip 1 - m^n
        second second
    ] unless ;