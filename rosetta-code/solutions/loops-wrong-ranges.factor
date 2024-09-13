! Some languages have syntax or function(s) to generate a range of numeric
! values from a start value, a stop value, and an increment.
! 
! The purpose of this task is to select the range syntax/function that
! would generate at least two increasing numbers when given a stop value
! more than the start value and a positive increment of less than half the
! difference. You are then to use that same syntax/function but with
! different parameters; and show, here, what would happen.
! 
! Use these values if possible:
! 
!     
! 
!         {| class="wikitable"
! 
! !start ||stop ||increment ||Comment |- | -2||2||1||Normal |- |
! -2||2||0||Zero increment |- | -2||2||-1||Increments away from stop value
! |- | -2||2||10||First increment is beyond stop value |- |2||-2||1||Start
! more than stop: positive increment |- |2||2||1||Start equal stop:
! positive increment |- |2||2||-1||Start equal stop: negative increment |-
! |2||2||0||Start equal stop: zero increment |- |0||0||0||Start equal stop
! equal zero: zero increment |}
! 
! Related tasks:
! 
! -   Loop over multiple arrays simultaneously
! -   Loops/Break
! -   Loops/Continue
! -   Loops/Do-while
! -   Loops/Downward for
! -   Loops/For
! -   Loops/For with a specified step
! -   Loops/Foreach
! -   Loops/Increment loop index within loop body
! -   Loops/Infinite
! -   Loops/N plus one half
! -   Loops/Nested
! -   Loops/While
! -   Loops/with multiple ranges
! -   Loops/Wrong ranges
! 
! Category:Loop modifiers

USING: continuations formatting io kernel math.ranges
prettyprint sequences ;

: try-range ( from length step -- )
    [ <range> { } like . ]
    [ 4drop "Exception: divide by zero." print ] recover ;

{
    { -2 2 1 } { 2 2 0 } { -2 2 -1 } { -2 2 10 } { 2 -2 1 }
    { 2 2 1 } { 2 2 -1 } { 2 2 0 } { 0 0 0 }
}
[
    first3
    [ "%2d %2d %2d <range>  =>  " printf ]
    [ try-range ] 3bi
] each
