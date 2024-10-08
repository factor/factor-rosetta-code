! Task:
! 
! Create a function taking a positive integer as its parameter and
! returning a string containing the Roman numeral representation of that
! integer. Modern Roman numerals are written by expressing each digit
! separately, starting with the left most digit and skipping any digit
! with a value of zero.
! 
! In Roman numerals:
! 
! -   1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC
! -   2008 is written as 2000=MM, 8=VIII; or MMVIII
! -   1666 uses each Roman symbol in descending order: MDCLXVI
! 
! Category:String_manipulation

USE: roman
( scratchpad ) 3333 >roman .
"mmmcccxxxiii"
