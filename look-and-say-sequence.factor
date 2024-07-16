! The Look and say sequence is a recursively defined sequence of numbers
! studied most notably by John Conway.
! 
! The look-and-say sequence is also known as the Morris Number Sequence,
! after cryptographer Robert Morris, and the puzzle What is the next
! number in the sequence 1, 11, 21, 1211, 111221? is sometimes referred to
! as the Cuckoo's Egg, from a description of Morris in Clifford Stoll's
! book The Cuckoo's Egg.
! 
! Sequence Definition
! 
! -   Take a decimal number
! -   Look at the number, visually grouping consecutive runs of the same
!     digit.
! -   Say the number, from left to right, group by group; as how many of
!     that digit there are - followed by the digit grouped.
! 
!     This becomes the next number of the sequence.
! 
! An example:
! 
! -   Starting with the number 1, you have one 1 which produces 11
! -   Starting with 11, you have two 1's. I.E.: 21
! -   Starting with 21, you have one 2, then one 1. I.E.: (12)(11) which
!     becomes 1211
! -   Starting with 1211, you have one 1, one 2, then two 1's. I.E.:
!     (11)(12)(21) which becomes 111221
! 
! Task:
! 
! Write a program to generate successive members of the look-and-say
! sequence.
! 
! Related tasks:
! 
! -   Fours is the number of letters in the ...
! -   Number names
! -   Self-describing numbers
! -   Self-referential sequence
! -   Spelling of ordinal numbers
! 
! See also:
! 
! -   Look-and-Say Numbers (feat John Conway), A Numberphile Video.
! -   This task is related to, and an application of, the Run-length
!     encoding task.
! -   Sequence A005150 on The On-Line Encyclopedia of Integer Sequences.

: (look-and-say) ( str -- )
    unclip-slice swap [ 1 ] 2dip [
        2dup = [ drop [ 1 + ] dip ] [
            [ [ number>string % ] dip , 1 ] dip
        ] if
    ] each [ number>string % ] [ , ] bi* ;

: look-and-say ( str -- str' ) [ (look-and-say) ] "" make ;

"1" 10 [ dup print look-and-say ] times print
