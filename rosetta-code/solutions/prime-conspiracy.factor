! A recent discovery, quoted from Quantamagazine (March 13, 2016):
! 
!     Two mathematicians have uncovered a simple, previously unnoticed property of
!     prime numbers — those numbers that are divisible only by 1 and themselves.  
!     Prime numbers, it seems, have decided preferences about the final digits of  
!     '' the primes that immediately follow them.  
! 
! and
! 
!     This conspiracy among prime numbers seems, at first glance, to violate a
!     longstanding assumption in number theory: that prime numbers behave much
!     '' like random numbers. 
! 
!     ─── (original authors from Stanford University):
!     ─── Kannan Soundararajan and Robert Lemke Oliver
! 
! The task is to check this assertion, modulo 10.
! 
! Lets call i -> j a transition if i is the last decimal digit of a prime,
! and j the last decimal digit of the following prime.
! 
! Task:
! 
! Considering the first one million primes. Count, for any pair of
! successive primes, the number of transitions i -> j and print them along
! with their relative frequency, sorted by i.
! 
! You can see that, for a given i, frequencies are not evenly distributed.
! 
! Observation:
! 
! (Modulo 10), primes whose last digit is 9 "prefer" the digit 1 to the
! digit 9, as its following prime.
! 
! Extra credit:
! 
! Do the same for one hundred million primes.
! 
! Example for 10,000 primes:
! 
!     10000 first primes. Transitions prime % 10 → next-prime % 10.
!     1 → 1 count:        365 frequency: 3.65 %
!     1 → 3 count:        833 frequency: 8.33 %
!     1 → 7 count:        889 frequency: 8.89 %
!     1 → 9 count:        397 frequency: 3.97 %
!     2 → 3 count:          1 frequency: 0.01 %
!     3 → 1 count:        529 frequency: 5.29 %
!     3 → 3 count:        324 frequency: 3.24 %
!     3 → 5 count:          1 frequency: 0.01 %
!     3 → 7 count:        754 frequency: 7.54 %
!     3 → 9 count:        907 frequency: 9.07 %
!     5 → 7 count:          1 frequency: 0.01 %
!     7 → 1 count:        655 frequency: 6.55 %
!     7 → 3 count:        722 frequency: 7.22 %
!     7 → 7 count:        323 frequency: 3.23 %
!     7 → 9 count:        808 frequency: 8.08 %
!     9 → 1 count:        935 frequency: 9.35 %
!     9 → 3 count:        635 frequency: 6.35 %
!     9 → 7 count:        541 frequency: 5.41 %
!     9 → 9 count:        379 frequency: 3.79 % 

USING: assocs formatting grouping kernel math math.primes math.statistics
sequences sorting ;
IN: rosetta-code.prime-conspiracy

: transitions ( n -- alist )
    nprimes [ 10 mod ] map 2 clump histogram >alist natural-sort ;

: t-values ( transition -- i j count freq )
    first2 [ first2 ] dip dup 10000. / ;

: print-trans ( transition -- )
    t-values "%d -> %d  count: %5d  frequency: %5.2f%%\n" printf ;
    
: header ( n -- )
    "First %d primes. Transitions prime %% 10 -> next-prime %% 10.\n" printf ;
    
: main ( -- )
    1,000,000 dup header transitions [ print-trans ] each ;
    
MAIN: main
