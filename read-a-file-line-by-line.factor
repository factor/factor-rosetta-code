! Read a file one line at a time, as opposed to reading the entire file at
! once.
! 
! Related tasks:
! 
! -   Read a file character by character
! -   Input loop.

 "path/to/file" utf8 [ [ readln dup [ print ] when* ] loop ] with-file-reader
