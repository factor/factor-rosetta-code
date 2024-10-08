! Some languages (like Gambas and Visual Basic) support two startup modes.
! Applications written in these languages start with an open window that
! waits for events, and it is necessary to do some trickery to cause a
! main procedure to run instead. Data driven or event driven languages may
! also require similar trickery to force a startup procedure to run.
! 
! Task:
! 
! Demonstrate the steps involved in causing the application to run a main
! procedure, rather than an event driven window at startup.
! 
! Languages that always run from main() can be omitted from this task.

USE: io
IN: example

: hello ( -- ) "Hello, world!" print ;

MAIN: hello
