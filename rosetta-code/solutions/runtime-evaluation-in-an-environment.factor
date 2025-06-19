! Do so in a way which:
! 
! -   does not involve string manipulation of the input source code
! -   is plausibly extensible to a runtime-chosen set of bindings rather
!     than just x
! -   does not make x a global variable
! 
! or note that these are impossible.
! 
! See also:
! 
! -   For more general examples and language-specific details, see Eval.
! -   Dynamic variable names is a similar task.

USE: eval
: eval-bi@- ( a b program -- n )
    tuck [ ( y -- z ) eval ] 2bi@ - ;

IN: scratchpad 9 4 "dup *" eval-bi@- .
65

: bi@- ( a b quot -- n ) bi@ - ; inline

IN: scratchpad 9 4 [ dup * ] bi@- .
65

SYMBOL: x
: eval-with-x ( a b program -- n )
    tuck
    [ [ x ] dip [ ( -- y ) eval ] curry with-variable ] 2bi@ - ;

IN: scratchpad 9 4 "x get dup *" eval-with-x .
65
IN: scratchpad x get .
f
