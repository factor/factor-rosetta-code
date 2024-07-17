! Task
! 
! Find prime n for 0 < n < 500 which are also primes when the (decimal)
! digits are reversed.
! 
! Nearly Emirp Primes, which don't count palindromatic primes like 101.

USING: formatting grouping io kernel math math.primes sequences ;

: reverse-digits ( 123 -- 321 )
    0 swap [ 10 /mod rot 10 * + swap ] until-zero ;

499 primes-upto [ reverse-digits prime? ] filter
dup length "Found %d reverse primes < 500.\n\n" printf
10 group [ [ "%4d" printf ] each nl ] each nl
