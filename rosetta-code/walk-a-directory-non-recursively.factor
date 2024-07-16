! Task:
! 
! Walk a given directory and print the names of files matching a given
! pattern.
! 
! (How is "pattern" defined? substring match? DOS pattern? BASH pattern?
! ZSH pattern? Perl regular expression?)
! 
! Note: This task is for non-recursive methods. These tasks should read a
! single directory, not an entire directory tree.
! 
! Note: Please be careful when running any code presented here.
! 
! Related task:
! 
! -   Walk Directory Tree (read entire directory tree).

USING: globs io io.directories kernel regexp sequences ;
IN: walk-directory-non-recursively

: print-files ( path pattern -- )
    [ directory-files ] [ <glob> ] bi* [ matches? ] curry filter
    [ print ] each ;
