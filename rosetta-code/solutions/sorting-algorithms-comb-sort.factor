! Task:
! 
! Implement a comb sort.
! 
! The Comb Sort is a variant of the Bubble Sort.
! 
! Like the Shell sort, the Comb Sort increases the gap used in comparisons
! and exchanges.
! 
! Dividing the gap by (1 − e^(−φ))⁻¹ ≈ 1.247330950103979 works best, but
! 1.3 may be more practical.
! 
! Some implementations use the insertion sort once the gap is less than a
! certain amount.
! 
! Also see:
! 
! -   the Wikipedia article: Comb sort.
! 
! Variants:
! 
! -   Combsort11 makes sure the gap ends in (11, 8, 6, 4, 3, 2, 1), which
!     is significantly faster than the other two possible endings.
! -   Combsort with different endings changes to a more efficient sort
!     when the data is almost sorted (when the gap is small). Comb sort
!     with a low gap isn't much better than the Bubble Sort.
! 
! Pseudocode:
! 
! function combsort(array input)
!     gap := input.size //initialize gap size
!     loop until gap = 1 and swaps = 0
!         //update the gap value for a next comb. Below is an example
!         gap := int(gap / 1.25)
!         if gap < 1
!           //minimum gap is 1
!           gap := 1
!         end if
!         i := 0
!         swaps := 0 //see Bubble Sort for an explanation
!         //a single "comb" over the input list
!         loop until i + gap >= input.size //see Shell sort for similar idea
!             if input[i] > input[i+gap]
!                 swap(input[i], input[i+gap])
!                 swaps := 1 // Flag a swap has occurred, so the
!                            // list is not guaranteed sorted
!             end if
!             i := i + 1
!         end loop
!     end loop
! end function
! 
! Category:Sorting


