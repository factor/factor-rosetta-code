! An addition chain of length r for n is a sequence 1 = a(0) < a(1) < a(2)
! ... < a(r) = n , such as a(k) = a(i) + a(j) ( i < k and j < k , i may be
! = j) . Each member is the sum of two earlier members, not necessarily
! distincts.
! 
! A Brauer chain for n is an addition chain where a(k) = a(k-1) + a(j)
! with j < k. Each member uses the previous member as a summand.
! 
! We are interested in chains of minimal length L(n).
! 
! Task
! 
! For each n in {7,14,21,29,32,42,64} display the following : L(n), the
! count of Brauer chains of length L(n), an example of such a Brauer
! chain, the count of non-brauer chains of length L(n), an example of such
! a chain. (NB: counts may be 0 ).
! 
! Extra-credit: Same task for n in {47, 79, 191, 382 , 379, 12509}
! 
! References
! 
! -   OEIS sequences A079301, A079302. 1
! -   Richard K. Guy - Unsolved problems in Number Theory - C6 - Addition
!     chains.
! 
! Example
! 
! -   minimal chain length l(19) = 6
! -   brauer-chains(19) : count = 31 Ex: ( 1 2 3 4 8 11 19)
! -   non-brauer-chains(19) : count = 2 Ex: ( 1 2 3 6 7 12 19)


