! Task:
! 
! Show the smallest (non-negative integer) power of 6 whose decimal
! expansion contains n, where n < 22

USING: formatting kernel lists lists.lazy math math.functions
present sequences tools.memory.private ;

: powers-of-6 ( -- list )
    0 lfrom [ 6 swap ^ ] lmap-lazy ;

: smallest ( m -- n )
    present powers-of-6 [ present subseq? ] with lfilter car ;

22 [ dup smallest commas "%2d   %s\n" printf ] each-integer
