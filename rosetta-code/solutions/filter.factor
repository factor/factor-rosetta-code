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

10 <iota> [ even? ] filter .
! prints V{ 0 2 4 5 8 }

USE: vectors
10 <iota> >vector [ even? ] filter! .
! prints V{ 0 2 4 5 8 }

USE: locals
10 <iota> >vector [| v |
    v [ even? ] filter drop
    v pprint " after filter" print
    v [ even? ] filter! drop
    v pprint " after filter!" print
] call
! V{ 0 1 2 3 4 5 6 7 8 9 } after filter
! V{ 0 2 4 6 8 } after filter!
