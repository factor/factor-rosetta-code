! Task:
! 
! (Over)write a file so that it contains a string.
! 
! The reverse of Read entire file—for when you want to update or create a
! file which you would read in its entirety all at once.

USING: io.encodings.utf8 io.files ;
"this is a string" "file.txt" utf8 set-file-contents
