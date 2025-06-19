! Task:
! 
! Given a list of integer arrays nums (which may be unsorted), find the
! smallest missing positive integer in each array in the list.
! 
! A missing positive integer is any positive integer, starting from 1,
! which is not present in the array.
! 
! Example:
! 
! -   nums = [1,2,0], [3,4,-1,1], [7,8,9,11,12]
! -   output = 3, 2, 1

USING: formatting fry hash-sets kernel math sequences sets ;

: first-missing ( seq -- n )
    >hash-set 1 swap '[ dup _ in? ] [ 1 + ] while ;

{ { 1 2 0 } { 3 4 1 1 } { 7 8 9 11 12 } { 1 2 3 4 5 }
{ -6 -5 -2 -1 } { 5 -5 } { -2 } { 1 } { } }
[ dup first-missing "%u ==> %d\n" printf ] each
