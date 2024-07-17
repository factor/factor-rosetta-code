! Task:
! 
! Find and show all palindromic primes n, where n < 1000
! 
! Category:Prime Numbers

USING: kernel math.primes present prettyprint sequences ;

1000 primes-upto [ present dup reverse = ] filter stack.
