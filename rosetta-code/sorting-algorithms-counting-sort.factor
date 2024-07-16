! Task:
! 
! Implement the Counting sort. This is a way of sorting integers when the
! minimum and maximum value are known.
! 
! Pseudocode:
! 
! function countingSort(array, min, max):
!     count: array of (max - min + 1) elements
!     initialize count with 0
!     for each number in array do
!         count[number - min] := count[number - min] + 1
!     done
!     z := 0
!     for i from min to max do
!         while ( count[i - min] > 0 ) do
!             array[z] := i
!             z := z+1
!             count[i - min] := count[i - min] - 1
!         done
!     done
! 
! The min and max can be computed apart, or be known a priori.
! 
! Note: we know that, given an array of integers, its maximum and minimum
! values can be always found; but if we imagine the worst case for an
! array that can hold up to 32 bit integers, we see that in order to hold
! the counts, an array of up to 2³² elements may be needed. I.E.: we need
! to hold a count value up to 2³²-1, which is a little over 4.2 Gbytes. So
! the counting sort is more practical when the range is (very) limited,
! and minimum and maximum values are known a priori. (However, as a
! counterexample, the use of sparse arrays minimizes the impact of the
! memory usage, as well as removing the need of having to know the minimum
! and maximum values a priori.)

