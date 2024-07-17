! An ultra-useful prime is a member of the sequence where each a(n) is the
! smallest positive integer k such that 2^((2^(n))) - k is prime.
! 
! k must always be an odd number since 2 to any power is always even.
! 
! Task
! 
! -   Find and show here, on this page, the first 10 elements of the
!     sequence.
! 
! Stretch
! 
! -   Find and show the next several elements. (The numbers get really big
!     really fast. Only nineteen elements have been identified as of this
!     writing.)
! 
! See also
! 
! -   OEIS:A058220 - Ultra-useful primes: smallest k such that 2^(2^n) - k
!     is prime

USING: io kernel lists lists.lazy math math.primes prettyprint ;

: useful ( -- list )
    1 lfrom
    [ 2^ 2^ 1 lfrom [ - prime? ] with lfilter car ] lmap-lazy ;

10 useful ltake [ pprint bl ] leach nl
