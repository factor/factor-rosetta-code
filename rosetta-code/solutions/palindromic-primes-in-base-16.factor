! Task:
! 
! Find palindromic primes n in base 16, where n < 500₁₀

USING: kernel math.parser math.primes prettyprint sequences
sequences.extras ;

500 primes-upto [ >hex ] [ dup reverse = ] map-filter .
