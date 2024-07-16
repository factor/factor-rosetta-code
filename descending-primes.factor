! Generate and show all primes with strictly descending decimal digits.
! 
! See also
! * OEIS:A052014 - Primes with distinct digits in descending order
! 
! Related:
! 
! -   Ascending primes

USING: grouping grouping.extras math math.combinatorics
math.functions math.primes math.ranges prettyprint sequences
sequences.extras ;
 
9 1 [a,b] all-subsets [ reverse 0 [ 10^ * + ] reduce-index ]
[ prime? ] map-filter 10 "" pad-groups 10 group simple-table.
