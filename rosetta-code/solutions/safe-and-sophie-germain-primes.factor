! A prime number p is a Sophie Germain prime if 2p+1 is also prime.
! 
! The number 2p+1 associated with a Sophie Germain prime is called a safe
! prime.
! 
! Task
! 
! Generate the first 50 Sophie Germain prime numbers.
! 
! See also
! 
! * Wikipedia: Sophie Germain primes
! * OEIS:A005384 - Sophie Germain primes
! * Related Task: Safe_primes_and_unsafe_primes
! 
! Category:Mathematics

USING: lists lists.lazy math math.primes math.primes.lists prettyprint ;

50 lprimes [ 2 * 1 + prime? ] lfilter ltake [ . ] leach
