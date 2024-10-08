! Sort an array of integers (of any convenient size) into ascending order
! using Circlesort.
! 
! In short, compare the first element to the last element, then the second
! element to the second last element, etc.
! 
! Then split the array in two and recurse until there is only one single
! element in the array, like this:
! 
! Before:
! 6 7 8 9 2 5 3 4 1
! After:
! 1 4 3 5 2 9 8 7 6
! 
! Repeat this procedure until quiescence (i.e. until there are no swaps).
! 
! Show both the initial, unsorted list and the final sorted list.
! (Intermediate steps during sorting are optional.)
! 
! Optimizations (like doing 0.5 log2(n) iterations and then continue with
! an Insertion sort) are optional.
! 
! Pseudo code:
! 
!  function circlesort (index lo, index hi, swaps)
!  {
!    if lo == hi return (swaps)
!    high := hi
!    low := lo
!    mid := int((hi-lo)/2)
!    while lo < hi {
!      if  (value at lo) > (value at hi) {
!         swap.values (lo,hi)
!         swaps++
!      }
!      lo++
!      hi--
!    }
!    if lo == hi
!      if (value at lo) > (value at hi+1) {
!          swap.values (lo,hi+1)
!          swaps++
!      }
!    swaps := circlesort(low,low+mid,swaps)
!    swaps := circlesort(low+mid+1,high,swaps)
!    return(swaps)
!  }
!  while circlesort (0, sizeof(array)-1, 0)
! 
! See also:
! 
! -   For more information on Circle sorting, see Sourceforge.


