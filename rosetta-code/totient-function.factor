! The totient function is also known as:
! 
! -   -   Euler's totient function
!     -   Euler's phi totient function
!     -   phi totient function
!     -    Φ function (uppercase Greek phi)
!     -    φ function (lowercase Greek phi)
! 
! Definitions (as per number theory):
! 
! The totient function:
! 
! -   -   counts the integers up to a given positive integer n that are
!         relatively prime to n
!     -   counts the integers k in the range 1 ≤ k ≤ n for which the
!         greatest common divisor gcd(n,k) is equal to 1
!     -   counts numbers ≤ n and prime to n
! 
! If the totient number (for N) is one less than N, then N is prime.
! 
! Task:
! 
! Create a totient function and:
! 
! -   -   Find and display (1 per line) for the 1^(st) 25 integers:
!         -   -   the integer (the index)
!             -   the totient number for that integer
!             -   indicate if that integer is prime
!     -   Find and display the count of the primes up to   100
!     -   Find and display the count of the primes up to 1,000
!     -   Find and display the count of the primes up to 10,000
!     -   Find and display the count of the primes up to 100,000
!         (optional)
! 
! Show all output here.
! 
! Related task:
! 
! -   -   Perfect totient numbers
! 
! Also see:
! 
! -   -   Wikipedia: Euler's totient function.
!     -   MathWorld: totient function.
!     -   OEIS: Euler totient function phi(n).

USING: combinators formatting io kernel math math.primes.factors
math.ranges sequences ;
IN: rosetta-code.totient-function

: Φ ( n -- m )
    {
        { [ dup 1 < ] [ drop 0 ] }
        { [ dup 1 = ] [ drop 1 ] }
        [
            dup unique-factors
            [ 1 [ 1 - * ] reduce ] [ product ] bi / *
        ]
    } cond ;

: show-info ( n -- )
    [ Φ ] [ swap 2dup - 1 = ] bi ", prime" "" ?
    "Φ(%2d) = %2d%s\n" printf ;

: totient-demo ( -- )
    25 [1,b] [ show-info ] each nl 0 100,000 [1,b] [
        [ dup Φ - 1 = [ 1 + ] when ]
        [ dup { 100 1,000 10,000 100,000 } member? ] bi
        [ dupd "%4d primes <= %d\n" printf ] [ drop ] if
    ] each drop ;

MAIN: totient-demo
