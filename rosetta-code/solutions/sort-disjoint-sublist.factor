! Given a list of values and a set of integer indices into that value
! list, the task is to sort the values at the given indices, while
! preserving the values at indices outside the set of those to be sorted.
! 
! Make your example work with the following list of values and set of
! indices:
! 
!     
! 
!         Values: [7, 6, 5, 4, 3, 2, 1, 0]
! 
!     
! 
!         Indices: {6, 1, 7}
! 
! Where the correct result would be:
! 
!     
! 
!         [7, 0, 5, 4, 3, 2, 1, 6].
! 
! In case of one-based indexing, rather than the zero-based indexing
! above, you would use the indices {7, 2, 8} instead.
! 
! The indices are described as a set rather than a list but any
! collection-type of those indices without duplication may be used as long
! as the example is insensitive to the order of indices given.
! 
! Cf.
! 
! -   Order disjoint list items
! 
! Category:Sorting

: disjoint-sort! ( values indices -- values' )
    over <enumerated> nths unzip swap [ natural-sort ] bi@
    pick [ set-nth ] curry 2each ;
