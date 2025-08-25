! The Fibonacci sequence is a sequence F_(n) of natural numbers defined
! recursively:
! 
!       F⁰ = 0 
!       F¹ = 1 
!       F_(n) = F_(n-1) + F_(n-2) , if n > 1 
! 
! Task:
! 
! Write a function to generate the n^(th) Fibonacci number.
! 
! Solutions can be iterative or recursive (though recursive solutions are
! generally considered too slow and are mostly used as an exercise in
! recursion).
! 
! The sequence is sometimes extended for negative numbers by using an
! alternating inverse of the positive values. Rewriting the definition as
! 
!       F_(n) = F_(n+2) - F_(n+1) , if n < 0 
! 
! leads to
! 
!       F_(-n) = (-1)^(n+1) F_(n) .
! 
! Support for negative n in the solution is optional.
! 
! Related tasks:
! 
! -   Fibonacci n-step number sequences
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
! 
! Category:Recursion Category:Memoization Category:Classic CS problems and
! programs


! produce the nth fib
: fib ( n -- fib )     1 0 rot [ tuck + ]      times     drop ; inline

! produce a list of the first n fibs
: fibseq ( n -- fibs ) 1 0 rot [ [ + ] 2keep ] replicate 2nip ; inline


: fib ( n -- m )
    dup 2 < [
        [ 0 1 ] dip [ swap [ + ] keep ] times
        drop
    ] unless ;

: fib ( n -- m )
    dup 2 < [
        [ 1 - fib ] [ 2 - fib ] bi +
    ] unless ;

: fib2 ( x y n -- a )
  dup 1 <
    [ 2drop ]
    [ [ swap [ + ] keep ] dip 1 - fib2 ]
  if ;
: fib ( n -- m ) [ 0 1 ] dip fib2 ;

USE: math.matrices

: fib ( n -- m )
    dup 2 < [
        [ { { 0 1 } { 1 1 } } ] dip 1 - m^n
        second second
    ] unless ;
