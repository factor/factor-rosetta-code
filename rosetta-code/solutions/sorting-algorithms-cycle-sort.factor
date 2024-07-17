! From the the Wikipedia entry on cycle sorting:
! 
!     Cycle sort is an in-place, unstable sorting algorithm, a comparison
!     sort that is theoretically optimal in terms of the total number of
!     writes to the original array, unlike any other in-place sorting
!     algorithm.
!     It is based on the idea that the permutation to be sorted can be
!     factored into cycles, which can individually be rotated to give a
!     sorted result.
! 
!     Unlike nearly every other sort, items are never written elsewhere in
!     the array simply to push them out of the way of the action.
!     Each value is either written zero times, if it's already in its
!     correct position, or written one time to its correct position.
!     This matches the minimal number of overwrites required for a
!     completed in-place sort.
! 
!     Minimizing the number of writes is useful when making writes to some
!     huge data set is very expensive, such as with EEPROMs like Flash
!     memory where each write reduces the lifespan of the memory.
! 
! See also:
! 
! -   Youtube Visualization and audibilization of Cycle Sort algorithm.
! 
! Category:Sorting


