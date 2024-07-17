! A super-Poulet number is a Poulet number (or Fermat pseudoprime to base
! 2) whose every divisor d'' evenly divides2^(d) − 2''.
! 
! Task
! 
! -   Find and display the first 20 super-Poulet numbers.
! 
! Stretch
! 
! -   Find and display the index and value of the first super-Poulet
!     number greater than one million.
! 
! See also
! *Task: Fermat pseudoprimes
! *Wikipedia: super-Poulet number
! *OEIS:A050217 - super-Poulet numbers

USING: combinators.short-circuit io kernel lists lists.lazy math
math.functions math.primes math.primes.factors prettyprint
sequences ;

: super-poulet? ( n -- ? )
    {
        [ prime? not ]
        [ [ 1 - 2^ ] keep mod 1 = ]
        [ divisors [ [ 2^ 2 - ] keep divisor? ] all? ]
    } 1&& ;

: super-poulets ( -- list )
    1 lfrom [ super-poulet? ] lfilter ;

20 super-poulets ltake [ pprint bl ] leach nl
