! An O(n²) sorting algorithm which moves elements one at a time into the
! correct position. The algorithm consists of inserting one element at a
! time into the previously sorted part of the array, moving higher ranked
! elements up as necessary. To start off, the first (or smallest, or any
! arbitrary) element of the unsorted array is considered to be the sorted
! part.
! 
! Although insertion sort is an O(n²) algorithm, its simplicity, low
! overhead, good locality of reference and efficiency make it a good
! choice in two cases:
! 
! :# small n,
! 
! :# as the final finishing-off algorithm for O(n logn) algorithms such as
! mergesort and quicksort.
! 
! The algorithm is as follows (from wikipedia):
! 
! function insertionSort(array A)
!     for i from 1 to length[A]-1 do
!         value := A[i] 
!         j := i-1
!         while j >= 0 and A[j] > value do
!             A[j+1] := A[j]
!             j := j-1
!         done
!         A[j+1] = value
!     done
! 
! Writing the algorithm for integers will suffice.
! 
! Category:Sorting

USING: kernel prettyprint sorting.extras sequences ;

: insertion-sort ( seq -- sorted-seq )
    <reversed> V{ } clone [ swap insort-left! ] reduce ;

{ 6 8 5 9 3 2 1 4 7 } insertion-sort .
