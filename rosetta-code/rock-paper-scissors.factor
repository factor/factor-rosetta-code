! Task:
! 
! Implement the classic children's game Rock-paper-scissors, as well as a
! simple predictive AI (artificial intelligence) player.
! 
! Rock Paper Scissors is a two player game.
! 
! Each player chooses one of rock, paper or scissors, without knowing the
! other player's choice.
! 
! The winner is decided by a set of rules:
! 
! -   -   Rock beats scissors
!     -   Scissors beat paper
!     -   Paper beats rock
! 
! If both players choose the same thing, there is no winner for that
! round.
! 
! For this task, the computer will be one of the players.
! 
! The operator will select Rock, Paper or Scissors and the computer will
! keep a record of the choice frequency, and use that information to make
! a weighted random choice in an attempt to defeat its opponent.
! 
! Extra credit:
! 
! Support additional choices additional weapons.

USING: combinators formatting io kernel math math.ranges qw
random sequences ;
IN: rosetta-code.rock-paper-scissors

CONSTANT: thing qw{ rock paper scissors }
CONSTANT: msg { "I win." "Tie!" "You win." }

: ai-choice ( r p s -- n )
    3dup + + nip [1,b] random {
        { [ 3dup nip >= ] [ 3drop 1 ] }
        { [ 3dup [ + ] dip >= ] [ 3drop 2 ] }
        [ 3drop 0 ]
    } cond ;

: player-choice ( -- n )
    "r/p/s/q? " write readln qw{ r p s q } index dup
    [ drop player-choice ] unless ;

! return:
! -1 for n1 loses to n2.
!  0 for n1 ties n2.
!  1 for n1 beats n2.
: outcome ( n1 n2 -- n3 ) - dup abs 1 > [ neg ] when sgn ;

: status. ( seq -- )
    "My wins: %d  Ties: %d  Your wins: %d\n" vprintf ;

: choices. ( n1 n2 -- )
    [ thing nth ] bi@ "You chose: %s\nI chose: %s\n" printf ;

: tally ( seq n -- seq' ) over [ 1 + ] change-nth ;

: game ( seq -- seq' )
    dup status. player-choice dup 3 = [ drop ] [
        [ 3 + tally ] keep over 3 tail* first3 ai-choice 2dup
        choices. outcome 1 + dup [ tally ] dip msg nth print nl
        game
    ] if ;

! The game state is a sequence where the members are:
! losses, ties, wins, #rock, #paper, #scissors
: main ( -- ) { 0 0 0 1 1 1 } clone game drop ;

MAIN: main
