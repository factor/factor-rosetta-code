! Given an integer array nums, find the common list elements.
! 
! Example:
! 
! nums = [2,5,1,3,8,9,4,6], [3,5,6,2,9,8,4], [1,3,7,6,9]
! 
! output = [3,6,9]

USING: prettyprint sets ;

{ { 2 5 1 3 8 9 4 6 } { 3 5 6 2 9 8 4 } { 1 3 7 6 9 } } intersect-all .
