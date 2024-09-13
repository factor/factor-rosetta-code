! Bulls and Cows is an old game played with pencil and paper that was
! later implemented using computers.
! 
! Task:
! 
! Create a four digit random number from the digits 1 to 9, without
! duplication.
! 
! The program should:
! 
! -   -   ask for guesses to this number
!     -   reject guesses that are malformed
!     -   print the score for the guess
! 
! The score is computed as:
! 
! 1.  The player wins if the guess is the same as the randomly chosen
!     number, and the program ends.
! 2.  A score of one bull is accumulated for each digit in the guess that
!     equals the corresponding digit in the randomly chosen initial
!     number.
! 3.  A score of one cow is accumulated for each digit in the guess that
!     also appears in the randomly chosen number, but in the wrong
!     position.
! 
! Related tasks:
! 
! -   Bulls and cows/Player
! -   Guess the number
! -   Guess the number/With Feedback
! -   Mastermind
! 
! Category:Puzzles Category:Games


USING: io kernel math math.parser random ranges sequences sets ; IN: bullsncows
9 [1..b] 4 sample [ 48 + ] "" map-as
[ "guess the 4-digit number: " write flush readln dup
  [ length 4 = ] [ [ 48 57 [a..b] in? ] all? ] bi and ! [48,57] is the ascii range for 0-9
  [ 2dup =
    [ 2drop "yep!" print flush f ]
    [ "bulls & cows: " write
      [ 0 [ = 1 0 ? + ] 2reduce ] [ intersect length ] 2bi over -
      [ number>string ] bi@ " & " glue print flush t ]
    if ]
  [ 2drop "bad input" print t ]
  if ] curry loop

