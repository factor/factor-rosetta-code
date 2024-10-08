! Gnome sort is a sorting algorithm which is similar to Insertion sort,
! except that moving an element to its proper place is accomplished by a
! series of swaps, as in Bubble Sort.
! 
! The pseudocode for the algorithm is:
! 
! function gnomeSort(a[0..size-1])
!     i := 1
!     j := 2
!     while i < size do
!         if a[i-1] <= a[i] then
!             // for descending sort, use >= for comparison
!             i := j
!             j := j + 1 
!         else
!             swap a[i-1] and a[i]
!             i := i - 1
!             if i = 0 then
!                 i := j
!                 j := j + 1
!             endif
!         endif
!     done
! 
! Task:
! 
! Implement the Gnome sort in your language to sort an array (or list) of
! numbers.
! 
! Category:Sorting


