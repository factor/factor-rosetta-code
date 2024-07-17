! Note that in the following explanation list indices are assumed to start
! at one.
! 
! Definition of lucky numbers
! 
! Lucky numbers are positive integers that are formed by:
! 
! 1.  Form a list of all the positive odd integers > 0
! 
! 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39...
! 
! 1.  Return the first number from the list (which is 1).
! 2.  (Loop begins here)
!     -   Note then return the second number from the list (which is 3).
!     -   Discard every third, (as noted), number from the list to form
!         the new list
! 
! 1, 3, 7, 9, 13, 15, 19, 21, 25, 27, 31, 33, 37, 39, 43, 45, 49, 51, 55, 57...
! 
! 1.  (Expanding the loop a few more times...)
!     -   Note then return the third number from the list (which is 7).
!     -   Discard every 7^(th), (as noted), number from the list to form
!         the new list
! 
! 1, 3, 7, 9, 13, 15, 21, 25, 27, 31, 33, 37, 43, 45, 49, 51, 55, 57, 63, 67...
! 
! #* Note then return the 4^(th) number from the list (which is 9).
! 
! #* Discard every 9^(th), (as noted), number from the list to form the
! new list
! 1, 3, 7, 9, 13, 15, 21, 25, 31, 33, 37, 43, 45, 49, 51, 55, 63, 67, 69, 73...
! 
! #* Take the 5^(th), i.e. 13. Remove every 13^(th).
! 
! #* Take the 6^(th), i.e. 15. Remove every 15^(th).
! 
! #* Take the 7^(th), i.e. 21. Remove every 21^(th).
! 
! #* Take the 8^(th), i.e. 25. Remove every 25^(th).
! 
! 1.  (Rule for the loop)
!     -   Note the n^(th), which is m.
!     -   Remove every m^(th).
!     -   Increment n.
! 
! Definition of even lucky numbers
! 
! This follows the same rules as the definition of lucky numbers above
! except for the very first step:
! 
! 1.  Form a list of all the positive even integers > 0
! 
! 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40...
! 
! 1.  Return the first number from the list (which is 2).
! 2.  (Loop begins here)
!     -   Note then return the second number from the list (which is 4).
!     -   Discard every 4^(th), (as noted), number from the list to form
!         the new list
! 
! 2, 4, 6, 10, 12, 14, 18, 20, 22, 26, 28, 30, 34, 36, 38, 42, 44, 46, 50, 52...
! 
! 1.  (Expanding the loop a few more times...)
!     -   Note then return the third number from the list (which is 6).
!     -   Discard every 6^(th), (as noted), number from the list to form
!         the new list
! 
! 2, 4, 6, 10, 12, 18, 20, 22, 26, 28, 34, 36, 38, 42, 44, 50, 52, 54, 58, 60...
! 
! #* Take the 4^(th), i.e. 10. Remove every 10^(th).
! 
! #* Take the 5^(th), i.e. 12. Remove every 12^(th).
! 
! 1.  (Rule for the loop)
!     -   Note the n^(th), which is m.
!     -   Remove every m^(th).
!     -   Increment n.
! 
! Task requirements
! 
! -   Write one or two subroutines (functions) to generate lucky numbers
!     and even lucky numbers
! -   Write a command-line interface to allow selection of which kind of
!     numbers and which number(s). Since input is from the command line,
!     tests should be made for the common errors:
!     -   missing arguments
!     -   too many arguments
!     -   number (or numbers) aren't legal
!     -   misspelled argument (lucky or evenLucky)
! -   The command line handling should:
!     -   support mixed case handling of the (non-numeric) arguments
!     -   support printing a particular number
!     -   support printing a range of numbers by their index
!     -   support printing a range of numbers by their values
! -   The resulting list of numbers should be printed on a single line.
! 
! The program should support the arguments:
! 
!                                  what is displayed  (on a single line)
!            argument(s)              (optional verbiage is encouraged)
!       ╔═══════════════════╦════════════════════════════════════════════════════╗
!       ║  j                ║  Jth       lucky number                            ║
!       ║  j  ,      lucky  ║  Jth       lucky number                            ║
!       ║  j  ,  evenLucky  ║  Jth  even lucky number                            ║
!       ║                   ║                                                    ║
!       ║  j  k             ║  Jth  through  Kth (inclusive)       lucky numbers ║
!       ║  j  k      lucky  ║  Jth  through  Kth (inclusive)       lucky numbers ║
!       ║  j  k  evenLucky  ║  Jth  through  Kth (inclusive)  even lucky numbers ║
!       ║                   ║                                                    ║
!       ║  j -k             ║  all       lucky numbers in the range  j ──► |k|   ║
!       ║  j -k      lucky  ║  all       lucky numbers in the range  j ──► |k|   ║
!       ║  j -k  evenLucky  ║  all  even lucky numbers in the range  j ──► |k|   ║
!       ╚═══════════════════╩════════════════════════════════════════════════════╝
!                                where    |k|    is the absolute value of   k
! 
! Demonstrate the program by:
! 
! -   showing the first twenty lucky numbers
! -   showing the first twenty even lucky numbers
! -   showing all lucky numbers between 6,000 and 6,100 (inclusive)
! -   showing all even lucky numbers in the same range as above
! -   showing the 10,000^(th) lucky number (extra credit)
! -   showing the 10,000^(th) even lucky number (extra credit)
! 
! See also:
! 
! -   This task is related to the Sieve of Eratosthenes task.
! -   OEIS Wiki Lucky numbers.
! -   Sequence A000959 lucky numbers on The On-Line Encyclopedia of
!     Integer Sequences.
! -   Sequence A045954 even lucky numbers or ELN on The On-Line
!     Encyclopedia of Integer Sequences.
! -   Entry lucky numbers on The Eric Weisstein's World of Mathematics.


