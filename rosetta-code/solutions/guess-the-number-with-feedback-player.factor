! Task:
! 
! Write a player for the game that follows the following rules:
! 
!     The scorer will choose a number between set limits. The computer
!     player will print a guess of the target number. The computer asks
!     for a score of whether its guess is higher than, lower than, or
!     equal to the target. The computer guesses, and the scorer scores, in
!     turn, until the computer correctly guesses the target number.
! 
! The computer should guess intelligently based on the accumulated scores
! given. One way is to use a Binary search based algorithm.
! 
! Related tasks:
! 
! -   Guess the number/With Feedback
! -   Bulls and cows/Player

USING: binary-search formatting io kernel math.ranges words ;

: instruct ( -- )
    "Think of a number between 1 and 100." print
    "Score my guess with +lt+ +gt+ or +eq+." print nl ;

: score ( n -- <=> )
    "My guess is %d. " printf readln "math.order" lookup-word ;

: play-game ( -- n )
    100 [1,b] [ score ] search nip nl ;

: gloat ( n -- )
    "I did it. Your number was %d!\n" printf ;

instruct play-game gloat
