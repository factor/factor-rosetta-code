! Task:
! 
! Let (p₁, p₂) are neighbor primes.
! 
! Find and show here in base ten if p₁+p₂-1 is prime, where p₁, p₂ < 100.

USING: kernel lists lists.lazy math math.primes
math.primes.lists prettyprint sequences ;

lprimes dup cdr lzip [ sum 1 - prime? ] lfilter
[ second 100 < ] lwhile [ . ] leach
