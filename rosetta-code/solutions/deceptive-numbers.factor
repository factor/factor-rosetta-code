! Repunits are numbers that consist entirely of repetitions of the digit
! one (unity). The notation R_(n) symbolizes the repunit made up of n
! ones.
! 
! Every prime p larger than 5, evenly divides the repunit R_(p-1).
! 
! E.G.
! 
! The repunit R₆ is evenly divisible by 7.
! 
! 111111 / 7 = 15873
! 
! The repunit R₄₂ is evenly divisible by 43.
! 
! 111111111111111111111111111111111111111111 / 43 =
! 2583979328165374677002583979328165374677
! 
! And so on.
! 
! There are composite numbers that also have this same property. They are
! often referred to as deceptive non-primes or deceptive numbers.
! 
! The repunit R₉₀ is evenly divisible by the composite number 91 (=7*13).
! 
! 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
! / 91 =
! 1221001221001221001221001221001221001221001221001221001221001221001221001221001221001221
! 
! Task
! 
! -   Find and show at least the first 10 deceptive numbers; composite
!     numbers n that evenly divide the repunit R_(n-1)
! 
! See also
! 
! * Numbers Aplenty - Deceptive numbers
! * OEIS:A000864 - Deceptive nonprimes: composite numbers k that divide the repunit R_{k-1}

USING: io kernel lists lists.lazy math math.functions
math.primes prettyprint ;

: repunit ( m -- n ) 10^ 1 - 9 / ;

: composite ( -- list ) 4 lfrom [ prime? not ] lfilter ;

: deceptive ( -- list )
    composite [ [ 1 - repunit ] keep divisor? ] lfilter ;

10 deceptive ltake [ pprint bl ] leach nl
