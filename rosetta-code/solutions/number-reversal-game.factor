! Task:
! 
! Given a jumbled list of the numbers 1 to 9 that are definitely not in
! ascending order.
! 
! Show the list, and then ask the player how many digits from the left to
! reverse.
! 
! Reverse those digits, then ask again, until all the digits end up in
! ascending order.
! 
! The score is the count of the reversals needed to attain the ascending
! order.
! 
! Note: Assume the player's input does not need extra validation.
! 
! Related tasks:
! 
! -   Sorting algorithms/Pancake sort
! -   Pancake sorting.
! -   Topswops
! 
! Category:Puzzles

USING: formatting io kernel math math.parser math.ranges
namespaces random sequences strings ;
IN: rosetta.number-reversal

: make-jumbled-array ( -- sorted jumbled )
    CHAR: 1 CHAR: 9 [a,b] [ 1string ] map dup clone randomize
    [ 2dup = ] [ randomize ] while ;

SYMBOL: trials

: prompt ( jumbled -- n )
    trials get "#%2d: " printf
    ", " join write
    "   Flip how many? " write flush
    readln string>number ;

: game-loop ( sorted jumbled -- )
    2dup = [
        2drop trials get
        "\nYou took %d attempts to put the digits in order!\n" printf
        flush
    ] [
        trials [ 1 + ] change
        dup dup prompt head-slice reverse! drop
        game-loop
    ] if ;

: play ( -- )
    0 trials set
    make-jumbled-array game-loop ;
