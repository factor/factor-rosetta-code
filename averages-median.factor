! Task
! 
! Write a program to find the median value of a vector of floating-point
! numbers.
! 
! The program need not handle the case where the vector is empty, but must
! handle the case where there are an even number of elements. In that
! case, return the average of the two middle values.
! 
! There are several approaches to this. One is to sort the elements, and
! then pick the element(s) in the middle.
! 
! Sorting would take at least O(n logn). Another approach would be to
! build a priority queue from the elements, and then extract half of the
! elements to get to the middle element(s). This would also take
! O(n logn). The best solution is to use the selection algorithm to find
! the median in O(n) time.
! 
! Quickselect_algorithm

( scratchpad ) 11 iota median .
5
( scratchpad ) 10 iota median .
4
