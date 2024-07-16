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

USING: fry kernel math math.ranges namespaces sequences ;

SYMBOL: swapped?

: dupd+ ( m obj -- m n obj ) [ dup 1 + ] dip ;

: 2nth ( n seq -- elt1 elt2 ) dupd+ [ nth ] curry bi@ ;

: ?exchange ( n seq -- )
    2dup 2nth > [ dupd+ exchange swapped? on ] [ 2drop ] if ;

: cocktail-pass ( seq forward? -- )
    '[ length 2 - 0 _ [ swap ] when [a,b] ] [ ] bi
    [ ?exchange ] curry each ;

: (cocktail-sort!) ( seq -- seq' )
    swapped? off dup t cocktail-pass
    swapped? get [ dup f cocktail-pass ] when ;

: cocktail-sort! ( seq -- seq' )
    [ swapped? get ] [ (cocktail-sort!) ] do while ;
