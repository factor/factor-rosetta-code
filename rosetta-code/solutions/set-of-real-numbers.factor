! All real numbers form the uncountable set ℝ. Among its subsets,
! relatively simple are the convex sets, each expressed as a range between
! two real numbers a and b where a ≤ b. There are actually four cases for
! the meaning of "between", depending on open or closed boundary:
! 
! -   [a, b]: {x | a ≤ x and x ≤ b }
! -   (a, b): {x | a < x and x < b }
! -   [a, b): {x | a ≤ x and x < b }
! -   (a, b]: {x | a < x and x ≤ b }
! 
! Note that if a = b, of the four only [a, a] would be non-empty.
! 
! Task
! 
! -   Devise a way to represent any set of real numbers, for the
!     definition of 'any' in the implementation notes below.
! -   Provide methods for these common set operations (x is a real number;
!     A and B are sets):
!     -   x ∈ A: determine if x is an element of A
! 
!     
! 
!         example: 1 is in [1, 2), while 2, 3, ... are not.
! 
! -   -   A ∪ B: union of A and B, i.e. {x | x ∈ A or x ∈ B}
! 
!     
! 
!         example: [0, 2) ∪ (1, 3) = [0, 3); [0, 1) ∪ (2, 3] = well,
!         [0, 1) ∪ (2, 3]
! 
! -   -   A ∩ B: intersection of A and B, i.e. {x | x ∈ A and x ∈ B}
! 
!     
! 
!         example: [0, 2) ∩ (1, 3) = (1, 2); [0, 1) ∩ (2, 3] = empty set
! 
! -   -   A - B: difference between A and B, also written as A \ B, i.e.
!         {x | x ∈ A and x ∉ B}
! 
!     
! 
!         example: [0, 2) − (1, 3) = [0, 1]
! 
! -   Test your implementation by checking if numbers 0, 1, and 2 are in
!     any of the following sets:
!     -   (0, 1] ∪ [0, 2)
!     -   [0, 2) ∩ (1, 2]
!     -   [0, 3) − (0, 1)
!     -   [0, 3) − [0, 1]
! 
! Implementation notes
! 
! -   'Any' real set means 'sets that can be expressed as the union of a
!     finite number of convex real sets'. Cantor's set need not apply.
! -   Infinities should be handled gracefully; indeterminate numbers (NaN)
!     can be ignored.
! -   You can use your machine's native real number representation, which
!     is probably IEEE floating point, and assume it's good enough (it
!     usually is).
! 
! Optional work
! 
! -   Create a function to determine if a given set is empty (contains no
!     element).
! -   Define A = {x | 0 < x < 10 and |sin(π x²)| > 1/2 }, B = {x | 0 < x <
!     10 and |sin(π x)| > 1/2}, calculate the length of the real axis
!     covered by the set A − B. Note that
! 
! |sin(π x)| > 1/2 is the same as n + 1/6 < x < n + 5/6 for all integers
! n; your program does not need to derive this by itself.


