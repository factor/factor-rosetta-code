! The cocktail shaker sort is an improvement on the Bubble Sort.
! 
! The improvement is basically that values "bubble" both directions
! through the array, because on each iteration the cocktail shaker sort
! bubble sorts once forwards and once backwards. Pseudocode for the
! algorithm (from wikipedia):
! 
! function cocktailSort( A : list of sortable items )
!  do
!    swapped := false
!    for each i in 0 to length( A ) - 2 do
!      if A[ i ] > A[ i+1 ] then // test whether the two 
!                                // elements are in the wrong 
!                                // order
!        swap( A[ i ], A[ i+1 ] ) // let the two elements
!                                 // change places
!        swapped := true;
!    if swapped = false then
!      // we can exit the outer loop here if no swaps occurred.
!      break do-while loop;
!    swapped := false
!    for each i in length( A ) - 2 down to 0 do
!      if A[ i ] > A[ i+1 ] then
!        swap( A[ i ], A[ i+1 ] )
!        swapped := true;
!  while swapped; // if no elements have been swapped, 
!                 // then the list is sorted
! 
! Related task:
! 
! -   -   cocktail sort with shifting bounds
! 
! Category:Sorting

USING: kernel locals math math.ranges sequences ;

:: cocktail-sort! ( seq -- seq' )
    f :> swapped!                                         ! bind false to mutable lexical variable 'swapped'. This must be done outside both while quotations so it is in scope of both.
    [ swapped ] [                                         ! is swapped true? Then execute body quotation. 'do' executes body quotation before predicate on first pass.
        f swapped!                                        ! set swapped to false
        seq length 2 - [| i |                             ! for each i in 0 to seq length - 2 do
            i i 1 + [ seq nth ] bi@ >                     ! is element at index i greater than element at index i + 1?
            [ i i 1 + seq exchange t swapped! ] when      ! if so, swap them and set swapped to true
        ] each-integer
        swapped [                                         ! skip to end of loop if swapped is false
            seq length 2 - 0 [a,b] [| i |                 ! for each i in seq length - 2 to 0 do
                i i 1 + [ seq nth ] bi@ >                 ! is element at index i greater than element at index i + 1?
                [ i i 1 + seq exchange t swapped! ] when  ! if so, swap them and set swapped to true
            ] each
        ] when
    ] do while
    seq ;                                                 ! return the sequence
