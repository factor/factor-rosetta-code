! A daemon is a service that runs in the background independent of a users
! login session.
! 
! Demonstrate how a program disconnects from the terminal to run as a
! daemon in the background.
! 
! Write a small program that writes a message roughly once a second to its
! stdout which should be redirected to a file.
! 
! Note that in some language implementations it may not be possible to
! disconnect from the terminal, and instead the process needs to be
! started with stdout (and stdin) redirected to files before program
! start. If that is the case then a helper program to set up this
! redirection should be written in the language itself. A shell wrapper,
! as would be the usual solution on Unix systems, is not appropriate.


