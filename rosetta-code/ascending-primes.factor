! Generate and show all primes with strictly ascending decimal digits.
! 
! Aside: Try solving without peeking at existing solutions. I had a weird
! idea for generating a prime sieve faster, which needless to say didn't
! pan out. The solution may be p(r)etty trivial but generating them
! quickly is at least mildly interesting. Tip: filtering all 7,027,260
! primes below 123,456,789 probably won't kill you, but there is at least
! one significantly better and much faster way, needing a mere 511
! odd/prime tests.
! 
! See also
! * OEIS:A052015 - Primes with distinct digits in ascending order
! 
! Related:
! 
! -   Primes with digits in nondecreasing order (infinite series allowing
!     duplicate digits, whereas this isn't and doesn't)
! -   Pandigital prime (whereas this is the smallest, with gaps in the
!     used digits being permitted)
! -   Descending primes

USING: grouping math math.combinatorics math.functions
math.primes math.ranges prettyprint sequences sequences.extras ;

9 [1,b] all-subsets [ reverse 0 [ 10^ * + ] reduce-index ]
[ prime? ] map-filter 10 group simple-table.
