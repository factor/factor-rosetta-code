! Task:
! 
! Walk a given directory tree and print files matching a given pattern.
! 
! Note: This task is for recursive methods. These tasks should read an
! entire directory tree, not a single directory.
! 
! Note: Please be careful when running any code examples found here.
! 
! Related task:
! 
! -   Walk a directory/Non-recursively (read a single directory).
! 
! Category:Recursion

USE: io.directories.search

"." t [
    dup ".factor" tail? [ print ] [ drop ] if
] each-file
