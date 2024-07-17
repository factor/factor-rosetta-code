! Task:
! 
! Make the terminal running the program ring its "bell".
! 
! On modern terminal emulators, this may be done by playing some other
! sound which might or might not be configurable, or by flashing the title
! bar or inverting the colors of the screen, but was classically a
! physical bell within the terminal. It is usually used to indicate a
! problem where a wrong character has been typed.
! 
! In most terminals, if the Bell character (ASCII code 7, \a in C) is
! printed by the program, it will cause the terminal to ring its bell.
! This is a function of the terminal, and is independent of the
! programming language of the program, other than the ability to print a
! particular character to standard out.

USE: io

"\u{7}" print
