! The AKS algorithm for testing whether a number is prime is a
! polynomial-time algorithm based on an elementary theorem about Pascal
! triangles.
! 
! The theorem on which the test is based can be stated as follows:
! 
! -   a number p is prime if and only if all the coefficients of the
!     polynomial expansion of
! 
!     
! 
!         (x − 1)^(p) − (x^(p) − 1)
! 
! are divisible by p.
! 
! Example:
! 
! Using p = 3:
! 
!          (x-1)^3 - (x^3 - 1)
!             = (x^3 - 3x^2 + 3x - 1) - (x^3 - 1)
!             = -3x^2 + 3x
! 
! And all the coefficients are divisible by 3, so 3 is prime.
! 
! Task:
! 
! 1.  Create a function/subroutine/method that given p generates the
!     coefficients of the expanded polynomial representation of
!     (x − 1)^(p).
! 2.  Use the function to show here the polynomial expansions of
!     (x − 1)^(p) for p in the range 0 to at least 7, inclusive.
! 3.  Use the previous function in creating another function that when
!     given p returns whether p is prime using the theorem.
! 4.  Use your test to generate a list of all primes under 35.
! 5.  As a stretch goal, generate all primes under 50 (needs integers
!     larger than 31-bit).
! 
! References:
! 
! -   Agrawal-Kayal-Saxena (AKS) primality test (Wikipedia)
! -   Fool-Proof Test for Primes - Numberphile (Video). The accuracy of
!     this video is disputed -- at best it is an oversimplification.

USING: combinators formatting io kernel make math math.parser
math.polynomials prettyprint sequences ;
IN: rosetta-code.aks-test

! Polynomials are represented by the math.polynomials vocabulary
! as sequences with the highest exponent on the right. Hence
! { -1 1 } represents x - 1.
: (x-1)^ ( n -- seq ) { -1 1 } swap p^ ;

: choose-exp ( n -- str )
    { { 0 [ "" ] } { 1 [ "x" ] } [ "x^%d" sprintf ] } case ;

: choose-coeff ( n -- str )
    [ dup neg? [ neg "- " ] [ "+ " ] if % # ] "" make ;

: terms ( coeffs-seq -- terms-seq )
    [ [ choose-coeff ] [ choose-exp append ] bi* ] map-index ;

: (.p) ( n -- str ) (x-1)^ terms <reversed> " " join 3 tail ;

: .p ( n -- ) dup zero? [ drop "1" ] [ (.p) ] if print ;

: show-poly ( n -- ) [ "(x-1)^%d = " printf ] [ .p ] bi ;

: part1 ( -- ) 8 <iota> [ show-poly ] each ;

: (prime?) ( n -- ? )
    (x-1)^ rest but-last dup first [ mod 0 = not ] curry find
    nip not ;

: prime? ( n -- ? ) dup 2 < [ drop f ] [ (prime?) ] if ;

: part2 ( -- )
    "Primes up to 50 via AKS:" print
    50 <iota> [ prime? ] filter . ;

: aks-test ( -- ) part1 nl part2 ;

MAIN: aks-test
