! The Sieve of Eratosthenes is a simple algorithm that finds the prime
! numbers up to a given integer.
! 
! Task:
! 
! Implement the Sieve of Eratosthenes algorithm, with the only allowed
! optimization that the outer loop can stop at the square root of the
! limit, and the inner loop may start at the square of the prime just
! found.
! 
! That means especially that you shouldn't optimize by using pre-computed
! wheels, i.e. don't assume you need only to cross out odd numbers (wheel
! based on 2), numbers equal to 1 or 5 modulo 6 (wheel based on 2 and 3),
! or similar wheels based on low primes.
! 
! If there's an easy way to add such a wheel based optimization, implement
! it as an alternative version.
! 
! Note:
! 
! -   It is important that the sieve algorithm be the actual algorithm
!     used to find prime numbers for the task.
! 
! Related tasks:
! 
! -   Emirp primes
! -   count in factors
! -   prime decomposition
! -   factors of an integer
! -   extensible prime generator
! -   primality by trial division
! -   factors of a Mersenne number
! -   trial factoring of a Mersenne number
! -   partition an integer X into N primes
! -   sequence of primes by Trial Division

USING: bit-arrays io kernel locals math math.functions
math.ranges prettyprint sequences ;
IN: rosetta-code.sieve-of-erato

<PRIVATE

: init-sieve ( n -- seq )   ! Include 0 and 1 for easy indexing.
    1 - <bit-array> dup set-bits ?{ f f } prepend ;

! Given the sieve and a prime starting index, create a range of
! values to mark composite. Start at the square of the prime.
: to-mark ( seq n -- range )
    [ length 1 - ] [ dup dup * ] bi* -rot <range> ;

! Mark multiples of prime n as composite.
: mark-nths ( seq n -- ) 
    dupd to-mark [ swap [ f ] 2dip set-nth ] with each ;

: next-prime ( index seq -- n ) [ t = ] find-from drop ;

PRIVATE>

:: sieve ( n -- seq )
    n sqrt 2 n init-sieve :> ( limit i! s )
    [ i limit < ]             ! sqrt optimization 
    [ s i mark-nths i 1 + s next-prime i! ] while t s indices ;

: sieve-demo ( -- )
    "Primes up to 120 using sieve of Eratosthenes:" print
    120 sieve . ;

MAIN: sieve-demo
