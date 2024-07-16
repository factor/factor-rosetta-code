! For the purposes of this task, the actual memory layout or access method
! of this data structure is not mandated.
! 
! It is enough to:
! 
! 1.  State the number and extent of each index to the array.
! 2.  Provide specific, ordered, integer indices for all dimensions of the
!     array together with a new value to update the indexed value.
! 3.  Provide specific, ordered, numeric indices for all dimensions of the
!     array to obtain the arrays value at that indexed position.
! 
! Task:
! 
! -   State if the language supports multi-dimensional arrays in its
!     syntax and usual implementation.
! -   State whether the language uses row-major or column major order for
!     multi-dimensional array storage, or any other relevant kind of
!     storage.
! -   Show how to create a four dimensional array in your language and
!     set, access, set to another value; and access the new value of an
!     integer-indexed item of the array.
! 
! The idiomatic method for the language is preferred.
! 
! -   -   The array should allow a range of five, four, three and two (or
!         two three four five if convenient), in each of the indices, in
!         order. (For example, if indexing starts at zero for the first
!         index then a range of 0..4 inclusive would suffice).
! -   State if memory allocation is optimised for the array - especially
!     if contiguous memory is likely to be allocated.
! -   If the language has exceptional native multi-dimensional array
!     support such as optional bounds checking, reshaping, or being able
!     to state both the lower and upper bounds of index ranges, then this
!     is the task to mention them.
! 
! Show all output here, (but you may judiciously use ellipses to shorten
! repetitive output text).

USING: accessors arrays.shaped io kernel prettyprint sequences ;

! Create a 4-dimensional array with increasing elements.
{ 2 3 4 5 } increasing

! Check if an index is in bounds.
{ 0 0 0 0 } over shaped-bounds-check

! Access and print the first element.
"First element: " write
get-shaped-row-major .

! Set the first element and show the array.
"With first element set to 999:" print
999 { 0 0 0 0 } pick set-shaped-row-major dup .

! Reshape and show the array.
"Reshaped: " print
{ 5 4 3 2 } reshape .
