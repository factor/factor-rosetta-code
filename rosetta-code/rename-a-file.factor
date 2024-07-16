! Task:
! 
! Rename:
! 
! -   -   a file called input.txt into output.txt and
!     -   a directory called docs into mydocs.
! 
! This should be done twice: once "here", i.e. in the current working
! directory and once in the filesystem root.
! 
! It can be assumed that the user has the rights to do so.
! 
! (In unix-type systems, only the user root would have sufficient
! permissions in the filesystem root.)

"" "/" [ 
    [ "input.txt" "output.txt" move-file "docs" "mydocs" move-file ] with-directory
] bi@
