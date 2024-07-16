! Task:
! 
! Explain or demonstrate the levels of visibility of function names and
! labels within the language.
! 
! See also:
! 
! -   Variables for levels of scope relating to visibility of program
!     variables
! -   Scope modifiers for general scope modification facilities

USE: io
IN: hello-vocab

DEFER: hello
hello   ! visible here
: hello ( -- ) "Hello, world!" print ;
hello   ! visible here
