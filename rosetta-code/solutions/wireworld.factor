! Wireworld is a cellular automaton with some similarities to Conway's
! Game of Life.
! 
! It is capable of doing sophisticated computations with appropriate
! programs (it is actually Turing complete), and is much simpler to
! program for.
! 
! A Wireworld arena consists of a Cartesian grid of cells, each of which
! can be in one of four states. All cell transitions happen
! simultaneously.
! 
! The cell transition rules are this:
! 
!     
! 
!         {| class=wikitable
! 
! |- ! Input State ! Output State ! Condition |- | empty | empty | |- |
! electronhead | electrontail | |- | electrontail | conductor | |- |
! valign=top | conductor | valign=top | electronhead | if 1 or 2 cells in
! the neighborhood of the cell are in the state “electron head” |- |
! conductor | conductor | otherwise |}
! 
! Task:
! 
! Create a program that reads a Wireworld program from a file and displays
! an animation of the processing. Here is a sample description file (using
! "H" for an electron head, "t" for a tail, "." for a conductor and a
! space for empty) you may wish to test with, which demonstrates two
! cycle-3 generators and an inhibit gate:
! 
!     tH.........
!     .   .
!        ...
!     .   .
!     Ht.. ......
! 
! While text-only implementations of this task are possible, mapping cells
! to pixels is advisable if you wish to be able to display large designs.
! The logic is not significantly more complex.
! 
! Category:Cellular automata


