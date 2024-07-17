! Task:
! 
! Create a function that takes a Roman numeral as its argument and returns
! its value as a numeric decimal integer.
! 
! You don't need to validate the form of the Roman numeral.
! 
! Modern Roman numerals are written by expressing each decimal digit of
! the number to be encoded separately,
! 
! starting with the leftmost decimal digit and skipping any 0s (zeroes).
! 
! 1990 is rendered as MCMXC (1000 = M, 900 = CM, 90 = XC) and
! 
! 2008 is rendered as MMVIII (2000 = MM, 8 = VIII).
! 
! The Roman numeral for 1666, MDCLXVI, uses each letter in descending
! order.

USE: roman
( scratchpad ) "MMMCCCXXXIII" roman> .
3333
