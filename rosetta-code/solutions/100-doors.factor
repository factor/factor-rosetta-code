! There are 100 doors in a row that are all initially closed.
! 
! You make 100 passes by the doors.
! 
! The first time through, visit every door and toggle the door (if the
! door is closed, open it; if it is open, close it).
! 
! The second time, only visit every 2^(nd) door (door #2, #4, #6, ...),
! and toggle it.
! 
! The third time, visit every 3^(rd) door (door #3, #6, #9, ...), etc,
! until you only visit the 100^(th) door.
! 
! Task:
! 
! Answer the question: what state are the doors in after the last pass?
! Which are open, which are closed?
! 
! Alternate: As noted in this page's discussion page, the only doors that
! remain open are those whose numbers are perfect squares.
! 
! Opening only those doors is an optimization that may also be expressed;
! however, as should be obvious, this defeats the intent of comparing
! implementations across programming languages.

USING: bit-arrays formatting fry kernel math math.ranges
sequences ;
IN: rosetta.doors

CONSTANT: number-of-doors 100

: multiples ( n -- range )
    0 number-of-doors rot <range> ;

: toggle-multiples ( n doors -- )
    [ multiples ] dip '[ _ [ not ] change-nth ] each ;

: toggle-all-multiples ( doors -- )
    [ number-of-doors [1,b] ] dip '[ _ toggle-multiples ] each ;

: print-doors ( doors -- )
    [
        swap "open" "closed" ? "Door %d is %s\n" printf
    ] each-index ;

: main ( -- )
    number-of-doors 1 + <bit-array>
    [ toggle-all-multiples ] [ print-doors ] bi ;

main
