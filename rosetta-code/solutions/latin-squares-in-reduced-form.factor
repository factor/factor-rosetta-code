! A Latin Square is in its reduced form if the first row and first column
! contain items in their natural order. The order n is the number of
! items. For any given n there is a set of reduced Latin Squares whose
! size increases rapidly with n. g is a number which identifies a unique
! element within the set of reduced Latin Squares of order n. The
! objective of this task is to construct the set of all Latin Squares of a
! given order and to provide a means which given suitable values for g any
! element within the set may be obtained.
! 
! For a reduced Latin Square the first row is always 1 to n. The second
! row is all Permutations/Derangements of 1 to n starting with 2. The
! third row is all Permutations/Derangements of 1 to n starting with 3
! which do not clash (do not have the same item in any column) with row 2.
! The fourth row is all Permutations/Derangements of 1 to n starting with
! 4 which do not clash with rows 2 or 3. Likewise continuing to the nth
! row.
! 
! Demonstrate by:
! 
! -   displaying the four reduced Latin Squares of order 4.
! -   for n = 1 to 6 (or more) produce the set of reduced Latin Squares;
!     produce a table which shows the size of the set of reduced Latin
!     Squares and compares this value times n! times (n-1)! with the
!     values in OEIS A002860.


