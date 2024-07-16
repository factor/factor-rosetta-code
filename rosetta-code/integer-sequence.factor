! Task:
! 
! Create a program that, when run, would display all integers from 1 to ∞
! (or any relevant implementation limit), in sequence (i.e. 1, 2, 3, 4,
! etc) if given enough time.
! 
! An example may not be able to reach arbitrarily-large numbers based on
! implementations limits. For example, if integers are represented as a
! 32-bit unsigned value with 0 as the smallest representable value, the
! largest representable value would be 4,294,967,295. Some languages
! support arbitrarily-large numbers as a built-in feature, while others
! make use of a module or library.
! 
! If appropriate, provide an example which reflect the language
! implementation's common built-in limits as well as an example which
! supports arbitrarily large numbers, and describe the nature of such
! limitations—or lack thereof.

USE: lists.lazy
1 lfrom [ . ] leach
