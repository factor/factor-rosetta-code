! Task:
! 
! Create a function that strips a set of characters from a string.
! 
! The function should take two arguments:
! 
! :::# a string to be stripped
! 
! :::# a string containing the set of characters to be stripped
! 
! The returned string should contain the first string, stripped of any
! characters in the second argument:
! 
!      print stripchars("She was a soul stripper. She took my heart!","aei")
!     Sh ws  soul strppr. Sh took my hrt!

USE: sets
"She was a soul stripper. She took my heart!" "aei" without print
