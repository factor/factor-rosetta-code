! Task
! 
! Execute a system command and get its output into the program. The output
! may be stored in any kind of collection (array, list, etc.).
! 
! Related task
! 
! -    Execute a system command

USING: io.encodings.utf8 io.launcher ;
"echo hello" utf8 [ contents ] with-process-reader .
