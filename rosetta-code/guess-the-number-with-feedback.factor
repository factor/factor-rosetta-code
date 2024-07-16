! Task:
! 
! Write a game (computer program) that follows the following rules:
! 
! -   -   The computer chooses a number between given set limits.
!     -   The player is asked for repeated guesses until the the target
!         number is guessed correctly
!     -   At each guess, the computer responds with whether the guess is:
!         -   -   higher than the target,
!             -   equal to the target,
!             -   less than the target, or
!             -   the input was inappropriate.
! 
! Related task:
! 
! -   Guess the number/With Feedback (Player)

USING:
    formatting
    fry
    io
    kernel
    math math.parser math.ranges
    prettyprint
    random ;
IN: guessnumber

: game-step ( target -- ? )
    readln string>number
    [
        2dup =
        [ 2drop f "Correct!" ]
        [ < "high" "low" ? "Guess too %s, try again." sprintf t swap ]
        if
    ]
    [ drop t "Invalid guess." ]
    if* print flush ;

: main ( -- )
    99 [1,b]
    [ unparse "Number in range %s, your guess?\n" printf flush ]
    [ random '[ _ game-step ] loop ]
    bi ;
