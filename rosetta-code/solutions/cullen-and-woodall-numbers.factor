! A Cullen number is a number of the form n × 2^(n) + 1 where n is a
! natural number.
! 
! A Woodall number is very similar. It is a number of the form n × 2^(n) -
! 1 where n is a natural number.
! 
! So for each n the associated Cullen number and Woodall number differ by
! 2.
! 
! Woodall numbers are sometimes referred to as Riesel numbers or Cullen
! numbers of the second kind.
! 
! Cullen primes are Cullen numbers that are prime. Similarly, Woodall
! primes are Woodall numbers that are prime.
! 
! It is common to list the Cullen and Woodall primes by the value of n
! rather than the full evaluated expression. They tend to get very large
! very quickly. For example, the third Cullen prime, n == 4713, has 1423
! digits when evaluated.
! 
! Task
! 
! -   Write procedures to find Cullen numbers and Woodall numbers.
! 
! -   Use those procedures to find and show here, on this page the first
!     20 of each.
! 
! Stretch
! 
! -   Find and show the first 5 Cullen primes in terms of n.
! 
! -   Find and show the first 12 Woodall primes in terms of n.
! 
! See also
! 
! -   OEIS:A002064 - Cullen numbers: a(n) = n*2^n + 1
! 
! -   OEIS:A003261 - Woodall (or Riesel) numbers: n*2^n - 1
! 
! -   OEIS:A005849 - Indices of prime Cullen numbers: numbers k such that
!     k*2^k + 1 is prime
! 
! -   OEIS:A002234 - Numbers k such that the Woodall number k*2^k - 1 is
!     prime

USING: arrays kernel math math.vectors prettyprint ranges
sequences ;

20 [1..b] [ dup 2^ * 1 + ] map dup 2 v-n 2array simple-table.
