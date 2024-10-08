! Given an Array, derive a sequence of elements in which all duplicates
! are removed.
! 
! There are basically three approaches seen here:
! 
! -   Put the elements into a hash table which does not allow duplicates.
!     The complexity is O(n) on average, and O(n²) worst case. This
!     approach requires a hash function for your type (which is compatible
!     with equality), either built-in to your language, or provided by the
!     user.
! -   Sort the elements and remove consecutive duplicate elements. The
!     complexity of the best sorting algorithms is O(n log n). This
!     approach requires that your type be "comparable", i.e., have an
!     ordering. Putting the elements into a self-balancing binary search
!     tree is a special case of sorting.
! -   Go through the list, and for each element, check the rest of the
!     list to see if it appears again, and discard it if it does. The
!     complexity is O(n²). The up-shot is that this always works on any
!     type (provided that you can test for equality).
! 
! Category:Sorting

USING: sets ;
V{ 1 2 1 3 2 4 5 } members .

V{ 1 2 3 4 5 }
