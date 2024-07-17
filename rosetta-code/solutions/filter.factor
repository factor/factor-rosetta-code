! Task:
! 
! Select certain elements from an Array into a new Array in a generic way.
! 
! To demonstrate, select all even numbers from an Array.
! 
! As an option, give a second solution which filters destructively, by
! modifying the original Array rather than creating a new Array.
! 
! Category:Iteration

10 <iota> >array [ even? ] filter .
! prints { 0 2 4 6 8 }
