! Create a routine that, given a set of strings representing directory
! paths and a single character directory separator, will return a string
! representing that part of the directory tree that is common to all the
! directories.
! 
! Test your routine using the forward slash '/' character as the directory
! separator and the following three strings as input paths:
! 
!      '/home/user1/tmp/coverage/test'
!      '/home/user1/tmp/covert/operator'
!      '/home/user1/tmp/coven/members'
! 
! Note: The resultant path should be the valid directory '/home/user1/tmp'
! and not the longest common string '/home/user1/tmp/cove'.
! 
! If your language has a routine that performs this function (even if it
! does not have a changeable separator character), then mention it as part
! of the task.

: take-shorter ( seq1 seq2 -- shorter )
    [ shorter? ] 2keep ? ;

: common-head ( seq1 seq2 -- head )
    2dup mismatch [ nip head ] [ take-shorter ] if* ;

: common-prefix-1 ( file1 file2 separator -- prefix )
    [ common-head ] dip '[ _ = not ] trim-tail ;

: common-prefix ( seq separator -- prefix )
    [ ] swap '[ _ common-prefix-1 ] map-reduce ;
