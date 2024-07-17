! Given a string and defined variables or values, string interpolation is
! the replacement of defined character sequences in the string by values
! or variable values.
! 
!     For example, given an original string of "Mary had a X lamb.", a
!     value of "big", and if the language replaces X in its interpolation
!     routine, then the result of its interpolation would be the string
!     "Mary had a big lamb".
! 
!     (Languages usually include an infrequently used character or
!     sequence of characters to indicate what is to be replaced such as
!     "%", or "#" rather than "X").
! 
! Task:
! 
! 1.  Use your languages inbuilt string interpolation abilities to
!     interpolate a string missing the text "little" which is held in a
!     variable, to produce the output string "Mary had a little lamb".
! 2.  If possible, give links to further documentation on your languages
!     string interpolation features.
! 
! Note: The task is not to create a string interpolation routine, but to
! show a language's built-in capability.
! 
! Category:String manipulation Category:Simple Category:Strings

USE: formatting 

SYMBOL: little

"little" little set

little get "Mary had a %s lamb" sprintf
