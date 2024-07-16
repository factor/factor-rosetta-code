! Definition
! 
! A Fortunate number is the smallest integer m > 1 such that for a given
! positive integer n, primorial(n) + m is a prime number, where
! primorial(n) is the product of the first n prime numbers.
! 
! For example the first fortunate number is 3 because primorial(1) is 2
! and 2 + 3 = 5 which is prime whereas 2 + 2 = 4 is composite.
! 
! Task
! 
! After sorting and removal of any duplicates, compute and show on this
! page the first 8 Fortunate numbers or, if your language supports big
! integers, the first 50 Fortunate numbers.
! 
! Related task
! 
! -   Primorial numbers
! 
! See also
! 
! -   oeis:A005235 Fortunate numbers
! -   oeis:A046066 Fortunate numbers, sorted with duplicates removed

USING: grouping io kernel math math.factorials math.primes
math.ranges prettyprint sequences sets sorting ;

"First 50 distinct fortunate numbers:" print
75 [1,b] [
    primorial dup next-prime 2dup - abs 1 =
    [ next-prime ] when - abs
] map members natural-sort 50 head 10 group simple-table.
