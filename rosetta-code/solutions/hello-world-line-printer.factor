! Task:
! 
! Cause a line printer attached to the computer to print a line containing
! the message: Hello World!
! 
! Note:
! 
! A line printer is not the same as standard output.
! 
! A line printer was an older-style printer which prints one line at a
! time to a continuous ream of paper.
! 
! With some systems, a line printer can be any device attached to an
! appropriate port (such as a parallel port).
! 
! Category:Hardware Category:Printer

( scratchpad ) USE: io.encodings.utf8
( scratchpad ) USE: io.launcher
( scratchpad ) "lpr" utf8 [ "Hello World!" print ] with-process-writer
