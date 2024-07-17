! Task:
! 
! Given a prompt and a list containing a number of strings of which one is
! to be selected, create a function that:
! 
! -   prints a textual menu formatted as an index value followed by its
!     corresponding string for each item in the list;
! -   prompts the user to enter a number;
! -   returns the string corresponding to the selected index number.
! 
! The function should reject input that is not an integer or is out of
! range by redisplaying the whole menu before asking again for a number.
! The function should return an empty string if called with an empty list.
! 
! For test purposes use the following four phrases in a list:
! 
!    fee fie
!    huff and puff
!    mirror mirror
!    tick tock
! 
! Note:
! 
! This task is fashioned after the action of the Bash select statement.

USING: formatting io kernel math math.parser sequences ;

: print-menu ( seq -- )
    [ 1 + swap "%d - %s\n" printf ] each-index
    "Your choice? " write flush ;

: (select) ( seq -- result )
    dup print-menu readln string>number dup integer? [
        drop 1 - swap 2dup bounds-check?
        [ nth ] [ nip (select) ] if
    ] [ drop (select) ] if* ;

: select ( seq -- result ) [ "" ] [ (select) ] if-empty ;
