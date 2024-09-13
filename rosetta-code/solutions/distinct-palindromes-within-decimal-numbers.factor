! Find all distinct palindromes contained as substrings in decimal
! representation of n. Note that for the purpose of the initial function,
! a single digit will be considered a palindrome.
! 
! Task:
! 
! 1.  Find all the palindromes including single digits in the integers
!     from 100 to 125, inclusive.
! 2.  Determine which if any of the following decimal integers contain
!     palindromes of 2 digits or more:
! 
!  9, 169, 12769, 1238769, 123498769, 12346098769, 1234572098769,
!  123456832098769, 12345679432098769, 1234567905432098769, 123456790165432098769,
!  83071934127905179083, 1320267947849490361205695
! 
! Also see:
! 
! -   -   OEIS entry: A262188 (Task 1).
!     -   OEIS entry: A151997 (Task 2).
! 
! Palindrome_detection
! Longest_palindromic_substrings
! N_1%27s_followed_by_a_3

USING: formatting io kernel math math.ranges present prettyprint
sequences sequences.extras sets ;

: dpal ( n -- seq )
    present all-subseqs members [ dup reverse = ] filter ;

! task 1
"Number  Palindromes" print
100 125 [a..b] [ dup pprint bl bl bl bl bl dpal .  ] each nl

! task 2
"Number                    Has no >= 2 digit-palindromes?" print
{ 9 169 12769 1238769 123498769 12346098769 1234572098769
  123456832098769 12345679432098769 1234567905432098769
  123456790165432098769 83071934127905179083
  1320267947849490361205695 }
[ dup dpal [ length 2 < ] reject empty? "%-25d %u\n" printf ]
each
