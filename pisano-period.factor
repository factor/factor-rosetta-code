! The Fibonacci sequence taken modulo 2 is a periodic sequence of period 3
! : 0, 1, 1, 0, 1, 1, ...
! 
! For any integer n, the Fibonacci sequence taken modulo n is periodic and
! the length of the periodic cycle is referred to as the Pisano period.
! 
! Prime numbers are straightforward; the Pisano period of a prime number p
! is simply: pisano(p). The Pisano period of a composite number c may be
! found in different ways. It may be calculated directly: pisano(c), which
! works, but may be time consuming to find, especially for larger
! integers, or, it may be calculated by finding the least common multiple
! of the Pisano periods of each composite component.
! 
! E.G.:
! 
! Given a Pisano period function: pisano(x), and a least common multiple
! function lcm(x, y):
! 
!    pisano(m × n) is equivalent to lcm(pisano(m), pisano(n)) where  m  and  n  are coprime
! 
! A formulae to calculate the pisano period for integer powers k of prime
! numbers p is:
! 
!    pisano(p^(k)) == p^((k-1))pisano(p) 
! 
! The equation is conjectured, no exceptions have been seen.
! 
! If a positive integer i is split into its prime factors, then the second
! and first equations above can be applied to generate the pisano period.
! 
! Task
! 
! Write 2 functions: pisanoPrime(p,k) and pisano(m).
! 
! pisanoPrime(p,k) should return the Pisano period of p^(k) where p is
! prime and k is a positive integer.
! 
! pisano(m) should use pisanoPrime to return the Pisano period of m where
! m is a positive integer.
! 
! Print pisanoPrime(p,2) for every prime lower than 15.
! 
! Print pisanoPrime(p,1) for every prime lower than 180.
! 
! Print pisano(m) for every integer from 1 to 180.
! 
! Related tasks
! 
! -    Fibonacci sequence
! -    Prime decomposition
! -    Least common multiple

USING: formatting fry grouping io kernel math math.functions
math.primes math.primes.factors math.ranges sequences ;

: pisano-period ( m -- n )
    [ 0 1 ] dip [ sq <iota> ] [ ] bi
    '[ drop tuck + _ mod 2dup [ zero? ] [ 1 = ] bi* and ]
    find 3nip [ 1 + ] [ 1 ] if* ;

: pisano-prime ( p k -- n )
    over prime? [ "p must be prime." throw ] unless
    ^ pisano-period ;

: pisano ( m -- n )
    group-factors [ first2 pisano-prime ] [ lcm ] map-reduce ;

: show-pisano ( upto m -- )
    [ primes-upto ] dip
    [ 2dup pisano-prime "%d %d pisano-prime = %d\n" printf ]
    curry each nl ;

15  2 show-pisano
180 1 show-pisano

"n pisano for integers 'n' from 2 to 180:" print
2 180 [a,b] [ pisano ] map 15 group
[ [ "%3d " printf ] each nl ] each
