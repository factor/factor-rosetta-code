! A+B ─── a classic problem in programming contests, it's given so
! contestants can gain familiarity with the online judging system being
! used.
! 
! Task:
! 
! Given two integers, A and B.
! 
! Their sum needs to be calculated.
! 
! Input data:
! 
! Two integers are written in the input stream, separated by space(s):
! 
!     (−1000 ≤ A, B ≤ +1000)
! 
! Output data:
! 
! The required output is one integer: the sum of A and B.
! 
! Example:
! 
!         {|class="standard"
! 
! ! input  
! ! output  
! |-
! |2 2
! |4
! |-
! |3 2
! |5
! |}

USING: math.parser splitting ;
: a+b ( -- )
    readln " " split1
    [ string>number ] bi@ +
    number>string print ;
