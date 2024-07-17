! Task:
! 
! Smallest positive integer k such that the decimal expansion of k^(k)
! contains n, where n < 51

USING: formatting grouping io kernel lists lists.lazy
math.functions present sequences ;

: smallest ( m -- n )
    present 1 lfrom [ dup ^ present subseq? ] with lfilter car ;

51 <iota> [ smallest ] map 10 group
[ [ "%3d" printf ] each nl ] each
