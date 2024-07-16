! The Problem:
! 
! -   100 prisoners are individually numbered 1 to 100
! -   A room having a cupboard of 100 opaque drawers numbered 1 to 100,
!     that cannot be seen from outside.
! -   Cards numbered 1 to 100 are placed randomly, one to a drawer, and
!     the drawers all closed; at the start.
! -   Prisoners start outside the room
!     -   They can decide some strategy before any enter the room.
!     -   Prisoners enter the room one by one, can open a drawer, inspect
!         the card number in the drawer, then close the drawer.
!     -   A prisoner can open no more than 50 drawers.
!     -   A prisoner tries to find his own number.
!     -   A prisoner finding his own number is then held apart from the
!         others.
! -   If all 100 prisoners find their own numbers then they will all be
!     pardoned. If any don't then all sentences stand.
! 
! The task:
! 
! 1.  Simulate several thousand instances of the game where the prisoners
!     randomly open drawers
! 2.  Simulate several thousand instances of the game where the prisoners
!     use the optimal strategy mentioned in the Wikipedia article, of:
! 
! -   -   First opening the drawer whose outside number is his prisoner
!         number.
!     -   If the card within has his number then he succeeds otherwise he
!         opens the drawer with the same number as that of the revealed
!         card. (until he opens his maximum).
! 
! Show and compare the computed probabilities of success for the two
! strategies, here, on this page.
! 
! References:
! 
! 1.  The unbelievable solution to the 100 prisoner puzzle standupmaths
!     (Video).
! 2.  wp:100 prisoners problem
! 3.  100 Prisoners Escape Puzzle DataGenetics.
! 4.  Random permutation statistics#One hundred prisoners on Wikipedia.

USING: arrays formatting fry io kernel math random sequences ;

: setup ( -- seq seq ) 100 <iota> dup >array randomize ;

: rand ( -- ? )
    setup [ 50 sample member? not ] curry find nip >boolean not ;

: trail ( m seq -- n )
    50 pick '[ [ nth ] keep over _ = ] replicate [ t = ] any?
    2nip ;

: optimal ( -- ? ) setup [ trail ] curry [ and ] map-reduce ;

: simulate ( m quot -- x )
    dupd replicate [ t = ] count swap /f 100 * ; inline

"Simulation count: 10,000" print
10,000 [ rand ] simulate "Random play success: "
10,000 [ optimal ] simulate "Optimal play success: "
[ write "%.2f%%\n" printf ] 2bi@
