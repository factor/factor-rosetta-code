! Task:
! 
! Write a routine to perform a bitwise AND, OR, and XOR on two integers, a
! bitwise NOT on the first integer, a left shift, right shift, right
! arithmetic shift, left rotate, and right rotate.
! 
! All shifts and rotates should be done on the first integer with a
! shift/rotate amount of the second integer.
! 
! If any operation is not available in your language, note it.

"a=" "b=" [ write readln string>number ] bi@
{
    [ bitand "a AND b: " write . ]
    [ bitor "a OR b: " write . ] 
    [ bitxor "a XOR b: " write . ]
    [ drop bitnot "NOT a: " write . ]
    [ abs shift "a asl b: " write . ]
    [ neg shift "a asr b: " write . ]
} 2cleave
