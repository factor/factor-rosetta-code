! Task:
! 
! Create a boolean function which takes in a string and tells whether it
! is a numeric string (floating point and negative numbers included) in
! the syntax the language uses for numeric literals or numbers converted
! from strings.
! 
! Category:Simple

: numeric? ( string -- ? ) string>number >boolean ;
