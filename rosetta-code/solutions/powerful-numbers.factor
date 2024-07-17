! A k-powerful (or k-full) number is a positive integer n such that for
! every prime number p dividing n, p^k also divides n.
! 
! These are numbers of the form:
! 
!   2-powerful = a^2 * b^3,             for a,b >= 1
!   3-powerful = a^3 * b^4 * c^5,       for a,b,c >= 1
!   4-powerful = a^4 * b^5 * c^6 * d^7, for a,b,c,d >= 1
!   ...
!   k-powerful = a^k * b^(k+1) * c^(k+2) *...* ω^(2*k-1), for a,b,c,...,ω >= 1
! 
! Task
! 
! Write a function that generates all the k-powerful numbers less than or
! equal to n.
! 
! -   For k = 2..10, generate the set of k-powerful numbers <= 10^k and
!     show the first 5 and the last 5 terms, along with the length of the
!     set.
! 
! Write a function that counts the number of k-powerful numbers less than
! or equal to n. (optional)
! 
! -   For k = 2..10, show the number of k-powerful numbers less than or
!     equal to 10^j, for 0 <= j < k+10.
! 
! See also
! 
! -   Wikipedia, Powerful number
! 
! -   OEIS A001694: 2-powerful numbers
! 
! -   OEIS A036966: 3-powerful numbers
! 
! -   OEIS A036967: 4-powerful numbers
! 
! -   OEIS A069492: 5-powerful numbers
! 
! -   OEIS A069493: 6-powerful numbers
! 
! -   OEIS A062762: number of powerful numbers <= 2^n
! 
! -   OEIS A118896: number of powerful numbers <= 10^n


