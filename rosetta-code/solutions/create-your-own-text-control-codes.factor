! A control code is a text character or sequence of characters with a
! special meaning that, rather than print a text character to the terminal
! or screen, instructs the computer to do something text-related. Examples
! include:
! 
! -   NUL (ASCII 0) = The null terminator. Most programming languages
!     silently place this at the end of a string so that the print
!     function knows when to stop.
! -   \n (New Line) = This tells the print function to start a new line.
!     Older computers don't have this, rather they use an ASCII 13
!     (carriage return) followed by an ASCII 10 (line feed).
! -   \ (Escape Character) = Any control code placed directly after the
!     escape character loses is special meaning and is printed as-is.
! -   %d = Insert a base 10 numeral into the string. The value is loaded
!     from a variable specified after the string, separated by commas.
! 
! The C code below shows the %d control code in action:
! 
!     int foo = 1;
!     int bar = 2;
!     int baz = foo + bar;
!     printf("%d plus %d is: %d",foo,bar,baz); //outputs "1 plus 2 is: 3"
! 
! Task
! 
! Add a new control code to your language's standard print function, which
! does some sort of text related task that is not already built into the
! language. Have the standard print function print a string that uses that
! code, and display the output. What the control code actually does is up
! to you, but some examples include:
! 
! -   Changing the color of the text
! -   Starting a new line at a custom location, without padding the string
!     with blank spaces
! 
! If the language allows, try to make something entirely new that isn't
! just a macro of existing control codes combined to produce a trivial
! result (e.g. \n\n\n\n for four new lines would be trivial)
! 
! If your language doesn't allow you to modify the standard print
! function, note it. (This is a draft task for now because I don't know if
! anything other than assembly can do this.)


