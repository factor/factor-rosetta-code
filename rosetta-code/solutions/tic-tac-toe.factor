! []
! 
! |right
! 
! Task:
! 
! Play a game of tic-tac-toe.
! 
! Ensure that legal moves are played and that a winning position is
! notified.
! 
! Tic-tac-toe is also known as:
! 
! -   -   noughts and crosses
!     -   tic tac toe
!     -   tick tack toe
!     -   three in a row
!     -   tres en rayo and
!     -   Xs and Os
! 
! See also
! 
! -   MathWorld™, Tic-Tac-Toe game.
! -   Wikipedia tic-tac-toe.
! 
! Category:Games


USING: multiline math.vectors arrays sequences io.streams.c kernel assocs math io grouping math.matrices math.parser random strings ; IN: tictactoe

CONSTANT: winmasks { 7 56 448 73 146 292 273 84 }
t 0 0                                                                              ! turn board1 board2
[
  pick                                                                             ! turn b1 b2 turn
  [ 2dup bitor 9 <bits> f swap indices random set-bit ]                            ! cpu's move
  [ [ 2dup bitor nl "enter a move (1-9):" print readln string>number 1 - tuck      ! your move
      [ nip [ 9 < ] [ 0 >= ] bi and ] [ bit? not ] 2bi and [ set-bit f ] [ drop "no" print t ] if
    ] loop
  ] if    ! switch on turn
  { { [ dup winmasks swap [ bitand bit-count 3 = ] curry any?                      ! check for win
      ] [ pick "O" "X" ? " wins" append print f ]
    }
    { [ 2dup bitor 511 =  ] [ "tie" print f ]                                      ! check for tie
    } [ t ]                                                                        ! if neither, then loop
  } cond 
  [ 3dup rot not [ swap ] when [ 9 <binary-bits> >array ] bi@ 2 v*n v+ 3 <groups>  ! display the board
    [ nl [ ".XO" nth 1string " " append write ] each ] each nl
  ] dip                                                                   ! keep loop flag 
  [ not ] 3dip swapd                                                      ! negate turn; swap boards
] loop 3drop                                                              ! empty the stack when done



USING: multiline math.vectors arrays sequences io.streams.c kernel assocs math io grouping math.matrices math.parser random strings ; IN: tictactoe

: open? ( pos board -- ? ) nth 0 = ; 

: full? ( board -- ? ) 0 swap member? not ; 

: won? ( board -- ? ) 
    3 <groups> dup [ flip ] [ main-diagonal ] [ anti-diagonal ] tri 2array 3append [ sum abs 3 = ] any? ;

: you ( -- position ) 
    "enter a move (1-9):" print readln string>number 1 - dup 
    [ 9 < ] [ 0 >= ] bi and [ drop "no" print you ] unless ; 

: cpu ( board -- ? ) [ [ 0 = ] dip and ] map-index sift random ; 

: pos ( cturn? board -- position ) swap 0 < [ cpu ] [ drop you ] if ; 

: move ( turn board -- nturn nboard ) 
    2dup pos swap 2dup open? [ [ set-nth ] [ nip ] 3bi [ neg ] dip  ] [ nip "no" print move ] if ;

: show ( board -- ) 
    nl 3 <groups> [ [ 1 + "O.X" nth 1string " " append write ] each nl ] each ;

: outcome ( turn board -- ) 
    [ neg ] dip won? [ 1 + "O.X" nth 1string " wins" append ] [ drop "tie" ] if nl print ;

: ttt ( -- ) -1 9 0 <array> [ move [ show ] keep dup [ won? ] [ full? ] bi or not ] loop outcome ;

