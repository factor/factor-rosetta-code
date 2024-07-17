! Definitions (as per number theory):
! 
! -   -   The prime(p) is the 'p''^(th) prime.
!         -   -   prime(1) is 2
!             -   prime(4) is 7
!     -   A strong prime is when prime(p) is > [prime(p-1) + prime(p+1)] ÷
!         2
!     -   A weak prime is when prime(p) is < [prime(p-1) + prime(p+1)] ÷ 2
! 
! Note that the definition for strong primes is different when used in the
! context of cryptography.
! 
! Task:
! 
! -   -   Find and display (on one line) the first 36 strong primes.
!     -   Find and display the count of the strong primes below 1,000,000.
!     -   Find and display the count of the strong primes below
!         10,000,000.
!     -   Find and display (on one line) the first 37 weak primes.
!     -   Find and display the count of the weak primes below 1,000,000.
!     -   Find and display the count of the weak primes below 10,000,000.
!     -   (Optional) display the counts and "below numbers" with commas.
! 
! Show all output here.
! 
! Related Task:
! 
! -   -   Safe primes and unsafe primes.
! 
! Also see:
! 
! -   -   The OEIS article A051634: strong primes.
!     -   The OEIS article A051635: weak primes.

USING: formatting grouping kernel math math.primes sequences
tools.memory.private ;
IN: rosetta-code.strong-primes

: fn ( p-1 p p+1 -- p sum ) rot + 2 / ;
: strong? ( p-1 p p+1 -- ? ) fn > ;
: weak? ( p-1 p p+1 -- ? ) fn < ;

: swprimes ( seq quot -- seq )
    [ 3 <clumps> ] dip [ first3 ] prepose filter [ second ] map
    ; inline

: stats ( seq n -- firstn count1 count2 )
    [ head ] [ drop [ 1e6 < ] filter length ] [ drop length ]
    2tri [ commas ] bi@ ;

10,000,019 primes-upto [ strong? ] over [ weak? ]
[ swprimes ] 2bi@ [ 36 ] [ 37 ] bi* [ stats ] 2bi@

"First 36 strong primes:\n%[%d, %]
%s strong primes below 1,000,000
%s strong primes below 10,000,000\n
First 37 weak primes:\n%[%d, %]
%s weak primes below 1,000,000
%s weak primes below 10,000,000\n" printf
