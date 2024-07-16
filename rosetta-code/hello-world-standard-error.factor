! A common practice in computing is to send error messages to a different
! output stream than normal text console messages.
! 
! The normal messages print to what is called "standard output" or
! "standard out".
! 
! The error messages print to "standard error".
! 
! This separation can be used to redirect error messages to a different
! place than normal messages.
! 
! Task:
! 
! Show how to print a message to standard error by printing Goodbye,
! World! on that stream.
! 
! Category:Streams

error-stream get [ "Goodbye, World! bbl, crashing" print flush ] with-output-stream*
