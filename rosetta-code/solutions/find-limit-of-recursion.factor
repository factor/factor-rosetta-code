! Task:
! 
! Find the limit of recursion.
! 
! Category:Basic language learning Category:Programming environment
! operations Category:Simple

: recurse ( n -- n ) 1 + recurse ;

0 recurse

SYMBOL: depth

: fn ( n -- n ) depth inc 1 + fn 1 + ;

[ 0 fn ] try
depth get "Recursion depth on this system is %d.\n" printf
