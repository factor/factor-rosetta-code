! The merge sort is a recursive sort of order n*log(n).
! 
! It is notable for having a worst case and average complexity of
! O(n*log(n)), and a best case complexity of O(n) (for pre-sorted input).
! 
! The basic idea is to split the collection into smaller groups by halving
! it until the groups only have one element or no elements (which are both
! entirely sorted groups).
! 
! Then merge the groups back together so that their elements are in order.
! 
! This is how the algorithm gets its divide and conquer description.
! 
! Task:
! 
! Write a function to sort a collection of integers using the merge sort.
! 
! The merge sort algorithm comes in two parts:
! 
!    a sort function     and 
!    a merge function 
! 
! The functions in pseudocode look like this:
! 
! function mergesort(m)
!    var list left, right, result
!    if length(m) ≤ 1
!        return m
!    else
!        var middle = length(m) / 2
!        for each x in m up to middle - 1
!            add x to left
!        for each x in m at and after middle
!            add x to right
!        left = mergesort(left)
!        right = mergesort(right)
!        if last(left) ≤ first(right) 
!           append right to left
!           return left
!        result = merge(left, right)
!        return result
! function merge(left,right)
!    var list result
!    while length(left) > 0 and length(right) > 0
!        if first(left) ≤ first(right)
!            append first(left) to result
!            left = rest(left)
!        else
!            append first(right) to result
!            right = rest(right)
!    if length(left) > 0 
!        append rest(left) to result
!    if length(right) > 0 
!        append rest(right) to result
!    return result
! 
! See also:
! 
! -   the Wikipedia entry: merge sort
! 
! Note: better performance can be expected if, rather than recursing until
! length(m) ≤ 1, an insertion sort is used for length(m) smaller than some
! threshold larger than 1. However, this complicates the example code, so
! it is not shown here.
! 
! Category:Sorting Category:Recursion

( scratchpad ) { 4 2 6 5 7 1 3 } mergesort .
{ 1 2 3 4 5 6 7 }
