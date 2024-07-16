! JortSort is a sorting tool set that makes the user do the work and
! guarantees efficiency because you don't have to sort ever again.
! 
! It was originally presented by Jenn "Moneydollars" Schiffer at the
! prestigious JSConf.
! 
! JortSort is a function that takes a single array of comparable objects
! as its argument.
! 
! It then sorts the array in ascending order and compares the sorted array
! to the originally provided array.
! 
! If the arrays match (i.e. the original array was already sorted), the
! function returns true.
! 
! If the arrays do not match (i.e. the original array was not sorted), the
! function returns false.
! 
! Category:Sorting

USING: kernel sorting ;
: jortsort ( seq -- ? ) dup natural-sort = ;
