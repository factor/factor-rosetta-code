! Twin primes are pairs of natural numbers (P₁ and P₂) that satisfy the
! following:
! 
! ::# P₁ and P₂ are primes
! 
! ::# P₁ + 2 = P₂
! 
! Task:
! 
! Write a program that displays the number of pairs of twin primes that
! can be found under a user-specified number
! 
! (P₁ < user-specified number & P₂ < user-specified number).
! 
! Extension:
! 
! ::# Find all twin prime pairs under 100000, 10000000 and 1000000000.
! 
! ::# What is the time complexity of the program? Are there ways to reduce
! computation time?
! 
! Examples:
! 
!     > Search Size: 100
!     > 8 twin prime pairs.
! 
!     > Search Size: 1000
!     > 35 twin prime pairs.
! 
! Also see:
! 
! -   The OEIS entry: A001097: Twin primes.
! -   The OEIS entry: A167874: The number of distinct primes < 10^n which
!     are members of twin-prime pairs.
! -   The OEIS entry: A077800: List of twin primes {p, p+2}, with
!     repetition.
! -   The OEIS entry: A007508: Number of twin prime pairs below 10^n.

USING: io kernel math math.parser math.primes.erato math.ranges
sequences tools.memory.private ;

: twin-pair-count ( n -- count )
    [ 5 swap 2 <range> ] [ sieve ] bi
    [ over 2 - over [ marked-prime? ] 2bi@ and ] curry count ;

"Search size: " write flush readln string>number
twin-pair-count commas write " twin prime pairs." print
