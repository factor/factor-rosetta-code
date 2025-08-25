! Kempner numbers are numbers n where S(n) is smallest positive integer k
! where k! is evenly divided by n.
! 
! I.E.
! 
! S(6) = 3 because 3! is the smallest factorial number evenly divisible by
! 6.
! 
! Small numbers are easy, and the naive algorithm works quite well.
! Factorials grow very large, very quickly though, so larger numbers
! benefit from a better algorithm.
! 
! By convention, S(1) is defined to be 1. A case could be made for it to
! be defined as 0, and Kempner originally did so, but it is now
! traditionally defined to be 1.
! 
! S(0) is undefined.
! 
! Task
! 
! -   Find and display the first fifty Kempner numbers S(1) through S(50).
! 
! Stretch
! 
! -   Find and display the Kempner numbers S(n) for the range
!     n = 77135679311..77135679321
! 
! See also
! 
! -   OEIS A002034 - Kempner numbers: smallest positive integer m such
!     that n divides m!.


