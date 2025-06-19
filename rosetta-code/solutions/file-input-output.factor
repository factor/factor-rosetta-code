! Task:
! 
! Create a file called "output.txt", and place in it the contents of the
! file "input.txt", via an intermediate variable.
! 
! In other words, your program will demonstrate:
! 
! ::# how to read from a file into a variable
! 
! ::# how to write a variable's contents into a file
! 
! Oneliners that skip the intermediate variable are of secondary interest
! — operating systems have copy commands for that.

"input.txt" binary file-contents
"output.txt" binary set-file-contents

[
    "input.txt" binary <file-reader> &dispose
    "output.txt" binary <file-writer> stream-copy
] with-destructors


"input.txt" "output.txt" copy-file
