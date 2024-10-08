! Sort an array of composite structures by a key.
! 
! For example, if you define a composite structure that presents a
! name-value pair (in pseudo-code):
! 
! Define structure pair such that: 
!    name as a string
!    value as a string
! 
! and an array of such pairs:
! 
!    x: array of pairs
! 
! then define a sort routine that sorts the array x by the key name.
! 
! This task can always be accomplished with Sorting Using a Custom
! Comparator.
! 
! If your language is not listed here, please see the other article.
! 
! Category:Sorting

TUPLE: example-pair name value ;

: sort-by-name ( seq -- seq' ) [ [ name>> ] compare ] sort ;
