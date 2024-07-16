! Number base conversion is when you express a stored integer in an
! integer base, such as in octal (base 8) or binary (base 2). It also is
! involved when you take a string representing a number in a given base
! and convert it to the stored integer form. Normally, a stored integer is
! in binary, but that's typically invisible to the user, who normally
! enters or sees stored integers as decimal.
! 
! Task:
! 
! Write a function (or identify the built-in function) which is passed a
! non-negative integer to convert, and another integer representing the
! base.
! 
! It should return a string containing the digits of the resulting number,
! without leading zeros except for the number 0 itself.
! 
! For the digits beyond 9, one should use the lowercase English alphabet,
! where the digit a = 9+1, b = a+1, etc.
! 
! For example: the decimal number 26 expressed in base 16 would be 1a.
! 
! Write a second function which is passed a string and an integer base,
! and it returns an integer representing that string interpreted in that
! base.
! 
! The programs may be limited by the word size or other such constraint of
! a given language. There is no need to do error checking for negatives,
! bases less than 2, or inappropriate digits.

USE: math.parser

12345 16 >base .
"3039" 16 base> .
