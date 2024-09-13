! Nim is a simple game where the second player─if they know the trick─will
! always win.
! 
! The game has only 3 rules:
! 
! -   -   start with 12 tokens
!     -   each player takes 1, 2, or 3 tokens in turn
!     -   the player who takes the last token wins.
! 
! To win every time, the second player simply takes 4 minus the number the
! first player took. So if the first player takes 1, the second takes 3;
! if the first player takes 2, the second should take 2; and if the first
! player takes 3, the second player will take 1.
! 
! Task:
! 
! Design a simple Nim game where the human player goes first, and the
! computer always wins. The game should enforce the rules.
! 
! Category:Puzzles Category:Games

USING: interpolate io kernel math math.parser sequences ;
IN: rosetta-code.nim-game

: get-input ( -- n )
    "Number of tokens to take (1, 2, or 3): " write readln
    string>number dup { 1 2 3 } member?
    [ drop "Invalid move." print get-input ] unless ;

: .remaining ( n -- )
    nl [I -~~==[ ${} tokens remaining ]==~~-I] nl nl ;

: .choice ( str n -- )
    dup 1 = "" "s" ? [I ${} took ${} token${}I] nl ;

: (round) ( -- )
    "You" get-input "Computer" 4 pick - [ .choice ] 2bi@ ;

: round ( n -- n-4 )
    dup dup .remaining [ drop (round) 4 - round ] unless-zero ;

: nim-game ( -- ) 12 round drop "Computer wins!" print ;

MAIN: nim-game
