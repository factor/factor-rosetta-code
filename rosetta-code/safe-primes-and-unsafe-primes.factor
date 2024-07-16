! Definitions:
! 
! -   -   A safe prime is a prime p and where (p-1)/2 is also prime.
!     -   The corresponding prime  (p-1)/2 is known as a Sophie Germain
!         prime.
!     -   An unsafe prime is a prime p and where (p-1)/2 isn't a prime.
!     -   An unsafe prime is a prime that isn't a safe prime.
! 
! Task:
! 
! -   -   Find and display (on one line) the first 35 safe primes.
!     -   Find and display the count of the safe primes below 1,000,000.
!     -   Find and display the count of the safe primes below 10,000,000.
!     -   Find and display (on one line) the first 40 unsafe primes.
!     -   Find and display the count of the unsafe primes below 1,000,000.
!     -   Find and display the count of the unsafe primes below
!         10,000,000.
!     -   (Optional) display the counts and "below numbers" with commas.
! 
! Show all output here.
! 
! Related Task:
! 
! -   -   strong and weak primes.
! 
! Also see:
! 
! -   -   The OEIS article: safe primes.
!     -   The OEIS article: unsafe primes.

USING: fry interpolate kernel literals math math.primes
sequences tools.memory.private ;
IN: rosetta-code.safe-primes

CONSTANT: primes $[ 10,000,000 primes-upto ]

: safe/unsafe ( -- safe unsafe )
    primes [ 1 - 2/ prime? ] partition ;

: count< ( seq n -- str ) '[ _ < ] count commas ;

: seq>commas ( seq -- str ) [ commas ] map " " join ;

: stats ( seq n -- head count1 count2 )
    '[ _ head seq>commas ] [ 1e6 count< ] [ 1e7 count< ] tri ;

safe/unsafe [ 35 ] [ 40 ] bi* [ stats ] 2bi@

[I
First 35 safe primes:
${5}
Safe prime count below  1,000,000: ${4}
Safe prime count below 10,000,000: ${3}

First 40 unsafe primes:
${2}
Unsafe prime count below  1,000,000: ${1}
Unsafe prime count below 10,000,000: ${}
I]
