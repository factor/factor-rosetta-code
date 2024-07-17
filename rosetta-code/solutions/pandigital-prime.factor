! Task:
! 
! The following problem is taken from Project Euler problem 41.
! 
! We shall say that an n-digit number is pandigital if it makes use of all
! the digits 1 to n exactly once. For example, 2143 is a 4-digit
! pandigital and is also prime.
! 
! What is the largest pandigital prime that exists?
! 
! Optional:
! 
! Further say that an n+1-digit number is pandigital0 if it makes use of
! all the digits 0 to n exactly once. For example 10243 is a 5-digit
! pandigital0 and is also prime.
! 
! What is the largest pandigital0 prime that exists?
! 
! Assume that the problem is talking about decimal numbers.

USING: io kernel math math.combinatorics math.functions
math.primes math.ranges present sequences sequences.cords ;

! If the digit-sum of a number is divisible by 3, so too is the number.
! The digit-sum of all n-digit pandigitals is the same.
! The digit sums for 9-, 8-, 6-, 5-, and 3-digit pandigitals are all divisible by 3.
! 1, 12, and 21 are not prime so 1- and 2-digit pandigitals don't need checked.
! Hence, we only need to check 4- and 7-digit pandigitals from biggest to smallest.

{ 4 7 } [ [1,b] <permutations> ] [ cord-append ] map-reduce
[ reverse 0 [ 10^ * + ] reduce-index prime? ] find-last nip
"The largest pandigital decimal prime is: " print
[ present write ] each nl
