! Task:
! 
! Find and show primes p such that p*q+2 is prime, where q is next prime
! after p and p < 500
! 
! See also:
! 
! -   Special neighbor primes

USING: formatting io kernel math math.primes ;

"p    q    p*q+2" print
2 3
[ over 500 < ] [
    2dup * 2 + dup prime?
    [ 3dup "%-4d %-4d %-6d\n" printf ] when
    drop nip dup next-prime
] while 2drop
