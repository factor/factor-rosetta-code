! Binary-Coded Decimal (or BCD for short) is a method of representing
! decimal numbers by storing what appears to be a decimal number but is
! actually stored as hexadecimal. Many CISC CPUs (e.g. X86 Assembly have
! special hardware routines for displaying these kinds of numbers.) On
! low-level hardware, such as 7-segment displays, binary-coded decimal is
! very important for outputting data in a format the end user can
! understand.
! 
! Task:
! 
! Use your language's built-in BCD functions, OR create your own
! conversion function, that converts an addition of hexadecimal numbers to
! binary-coded decimal. You should get the following results with these
! test cases:
! 
! -   0x19 + 1 = 0x20
! -   0x30 - 1 = 0x29
! -   0x99 + 1 = 0x100
! 
! Bonus Points:
! 
! Demonstrate the above test cases in both "packed BCD" (two digits per
! byte) and "unpacked BCD" (one digit per byte).


