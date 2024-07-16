! Task:
! 
! Write a program where the program chooses a number between 1 and 10.
! 
! A player is then prompted to enter a guess. If the player guesses wrong,
! then the prompt appears again until the guess is correct.
! 
! When the player has made a successful guess the computer will issue a
! "Well guessed!" message, and the program exits.
! 
! A conditional loop may be used to repeat the guessing until the user is
! correct.
! 
! Related tasks:
! 
! -   Bulls and cows
! -   Bulls and cows/Player
! -   Guess the number/With Feedback
! -   Mastermind

USING: io random math math.parser kernel formatting ;
IN: guess-the-number

<PRIVATE

: gen-number ( -- n )
  10 random 1 + ;

: make-guess ( n -- n ? )
  dup readln string>number = ;

: play-game ( n -- n )
  [ make-guess ]
  [ "Guess a number between 1 and 10:" print flush ] do until ;

PRIVATE>

: guess-the-number ( -- )
  gen-number play-game
  "Yes, the number was %d!\n" printf ;
