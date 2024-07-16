! Task:
! 
! Sort an array (or list) of elements using the Selection sort algorithm.
! 
! It works as follows:
! 
! First find the smallest element in the array and exchange it with the
! element in the first position, then find the second smallest element and
! exchange it with the element in the second position, and continue in
! this way until the entire array is sorted.
! 
! Its asymptotic complexity is O(n²) making it inefficient on large
! arrays.
! 
! Its primary purpose is for when writing data is very expensive (slow)
! when compared to reading, eg. writing to flash memory or EEPROM.
! 
! No other sorting algorithm has less data movement.
! 
! References:
! 
! -   Rosetta Code: O (complexity).
! -   Wikipedia: Selection sort.
! -   Wikipedia: https://en.wikipedia.org/wiki/Big_O_notation Big O
!     notation.
! 
! Category:Sorting

IN: scratchpad { 5 -6 3 9 -2 4 -1 -6 5 -5 } selection-sort!

--- Data stack:
{ -6 -6 -5 -2 -1 3 4 5 5 9 }
