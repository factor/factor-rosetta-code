! Task:
! 
! Show the Stooge Sort for an array of integers.
! 
! The Stooge Sort algorithm is as follows:
! 
! algorithm stoogesort(array L, i = 0, j = length(L)-1)
!      if L[j] < L[i] then
!          L[i] ↔ L[j]
!      if j - i > 1 then
!          t := (j - i + 1)/3
!          stoogesort(L, i  , j-t)
!          stoogesort(L, i+t, j  )
!          stoogesort(L, i  , j-t)
!      return L
! 
! Category:Sorting

USING: kernel locals math prettyprint sequences ;
IN: rosetta-code.stooge-sort

<PRIVATE

:: (stooge-sort) ( seq i j -- )
    j i [ seq nth ] bi@ < [
        j i seq exchange
    ] when
    j i - 1 > [
        j i - 1 + 3 /i :> t
        seq i j t - (stooge-sort)
        seq i t + j (stooge-sort)
        seq i j t - (stooge-sort)
    ] when ; 

PRIVATE>

: stooge-sort ( seq -- sortedseq )
    [ clone dup ] [ drop 0 ] [ length 1 - ] tri (stooge-sort) ;

: stooge-sort-demo ( -- )
    { 1 4 5 3 -6 3 7 10 -2 -5 } stooge-sort . ;

MAIN: stooge-sort-demo
