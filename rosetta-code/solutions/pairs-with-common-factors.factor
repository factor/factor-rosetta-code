! Generate the sequence where each term n is the count of the pairs (x,y)
! with 1 < x < y <= n, that have at least one common prime factor.
! 
! For instance, when n = 9, examine the pairs:
! 
!    (2,3) (2,4) (2,5) (2,6) (2,7) (2,8) (2,9)
!    (3,4) (3,5) (3,6) (3,7) (3,8) (3,9)
!    (4,5) (4,6) (4,7) (4,8) (4,9)
!    (5,6) (5,7) (5,8) (5,9)
!    (6,7) (6,8) (6,9)
!    (7,8) (7,9)
!    (8,9)
! 
! Find all of the pairs that have at least one common prime factor:
! 
!    (2,4) (2,6) (2,8) (3,6) (3,9) (4,6) (4,8) (6,8) (6,9)
! 
! and count them:
! 
!    a(9) = 9
! 
! Terms may be found directly using the formula:
! 
!    a(n) = n × (n-1) / 2 + 1 - 𝚺{i=1..n} 𝚽(i)
! 
! where 𝚽() is Phi; the Euler totient function.
! 
! For the term a(p), if p is prime, then a(p) is equal to the previous
! term.
! 
! Task
! 
! -   Find and display the first one hundred terms of the sequence.
! -   Find and display the one thousandth.
! 
! Stretch
! 
! -   Find and display the ten thousandth, one hundred thousandth, one
!     millionth.
! 
! See also
! * OEIS:A185670 - Number of pairs (x,y) with 1 <= x < y <= n with at least one common factor
! * Task: Totient function

USING: formatting grouping io kernel math math.functions
math.primes.factors prettyprint ranges sequences
tools.memory.private ;

: totient-sum ( n -- sum )
    [1..b] [ totient ] map-sum ;

: a ( n -- a(n) )
    dup [ 1 - * 2 / ] keep totient-sum - ;

"Number of pairs with common factors - first 100 terms:" print
100 [1..b] [ a commas ] map 10 group simple-table. nl

7 <iota> [ dup 10^ a commas "Term #1e%d: %s\n" printf ] each
