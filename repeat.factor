! Task:
! 
! Write a procedure which accepts as arguments another procedure and a
! positive integer.
! 
! The latter procedure is executed a number of times equal to the accepted
! integer.

: times ( ... n quot: ( ... -- ... ) -- ... )
    [ drop ] prepose each-integer ; inline
