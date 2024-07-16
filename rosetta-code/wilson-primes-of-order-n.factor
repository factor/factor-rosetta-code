! Definition
! 
! A Wilson prime of order n is a prime number p such that p² exactly
! divides:
! 
!      (n − 1)! × (p − n)! − (− 1)^(n) 
! 
! If n is 1, the latter formula reduces to the more familiar: (p - n)! + 1
! where the only known examples for p are 5, 13, and 563.
! 
! Task
! 
! Calculate and show on this page the Wilson primes, if any, for orders n
! = 1 to 11 inclusive and for primes p < 18 or,
! 
! if your language supports big integers, for p < 11,000.
! 
! Related task
! 
! -   -   Primality by Wilson's theorem

USING: formatting infix io kernel literals math math.functions
math.primes math.ranges prettyprint sequences sequences.extras ;

<< CONSTANT: limit 11,000 >>

CONSTANT: primes $[ limit primes-upto ]

CONSTANT: factorials
    $[ limit [1,b] 1 [ * ] accumulate* 1 prefix ]

: factorial ( n -- n! ) factorials nth ; inline

INFIX:: fn ( p n -- m )
    factorial(n-1) * factorial(p-n) - -1**n ;

: wilson? ( p n -- ? ) [ fn ] keepd sq divisor? ; inline

: order ( n -- seq )
    primes swap [ [ < ] curry drop-while ] keep
    [ wilson? ] curry filter ;

: order. ( n -- )
    dup "%2d:  " printf order [ pprint bl ] each nl ;

" n:  Wilson primes\n--------------------" print
11 [1,b] [ order. ] each
