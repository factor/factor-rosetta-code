! Solve the eight queens puzzle.
! 
! You can extend the problem to solve the puzzle with a board of size NxN.
! 
! For the number of solutions for small values of N, see OEIS: A000170.
! 
! Related tasks:
! 
! -   A* search algorithm
! -   Solve a Hidato puzzle
! -   Solve a Holy Knight's tour
! -   Knight's tour
! -   Peaceful chess queen armies
! -   Solve a Hopido puzzle
! -   Solve a Numbrix puzzle
! -   Solve the no connection puzzle

USING: kernel sequences math math.combinatorics formatting io locals ;
IN: queens

: /=  ( x y -- ? )   = not ; inline

:: safe?  ( board q -- ? )
    [let  q board nth :> x
      q <iota> [
         x swap
         [ board nth ] keep
         q swap -
           [ + /= ]
           [ - /= ] 3bi and
      ] all?
    ] ;

: solution? ( board -- ? )
    dup length <iota> [ dupd safe? ] all? nip ;

: queens ( n -- l )
    <iota> all-permutations [ solution? ] filter ;

: .queens ( n -- )
    queens
    [ 
      [ 1 + "%d " printf ] each nl
    ] each ;
