! Find the index of a string (needle) in an indexable, ordered collection
! of strings (haystack).
! 
! Raise an exception if the needle is missing.
! 
! If there is more than one occurrence then return the smallest index to
! the needle.
! 
! Return the largest index to a needle that has multiple occurrences in
! the haystack.
! 
! -   Search a list of records

: find-index ( seq elt -- i )
    '[ _ = ] find drop [ "Not found" throw ] unless* ; inline

: find-last-index ( seq elt -- i )
    '[ _ = ] find-last drop [ "Not found" throw ] unless* ; inline
