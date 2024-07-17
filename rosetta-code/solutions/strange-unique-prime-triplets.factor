! Primes n, m, and p are strange unique primes if n, m, and p are unique
! and their sum n+m+p is also prime. Assume n < m < p.
! 
! Task:
! 
! -   -   Find all triplets of strange unique primes in which n, m, and p
!         are all less than 30.
!     -   (stretch goal) Show the count (only) of all the triplets of
!         strange unique primes in which n,m,andp are all less than 1,000.

USING: formatting io kernel math math.combinatorics math.primes
sequences tools.memory.private ;

: .triplet ( seq -- ) "%2d+%2d+%2d = %d\n" vprintf ;

: strange ( n -- )
    primes-upto 3
    [ dup sum dup prime? [ suffix .triplet ] [ 2drop ] if ]
    each-combination ;

: count-strange ( n -- count )
    0 swap primes-upto 3
    [ sum prime? [ 1 + ] when ] each-combination ;

30 strange
1,000 count-strange commas nl
"Found %s strange prime triplets with n, m, p < 1,000.\n" printf
