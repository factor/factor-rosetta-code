! One of the foundational mathematical constructs behind computer science
! is the universal Turing Machine.
! 
! (Alan Turing introduced the idea of such a machine in 1936–1937.)
! 
! Indeed one way to definitively prove that a language is turing-complete
! is to implement a universal Turing machine in it.
! 
! Task:
! 
! Simulate such a machine capable of taking the definition of any other
! Turing machine and executing it.
! 
! Of course, you will not have an infinite tape, but you should emulate
! this as much as is possible.
! 
! The three permissible actions on the tape are "left", "right" and
! "stay".
! 
! To test your universal Turing machine (and prove your programming
! language is Turing complete!), you should execute the following two
! Turing machines based on the following definitions.
! 
! Simple incrementer
! 
! -   States: q0, qf
! -   Initial state: q0
! -   Terminating states: qf
! -   Permissible symbols: B, 1
! -   Blank symbol: B
! -   Rules:
!     -   (q0, 1, 1, right, q0)
!     -   (q0, B, 1, stay, qf)
! 
! The input for this machine should be a tape of 1 1 1
! 
! Three-state busy beaver
! 
! -   States: a, b, c, halt
! -   Initial state: a
! -   Terminating states: halt
! -   Permissible symbols: 0, 1
! -   Blank symbol: 0
! -   Rules:
!     -   (a, 0, 1, right, b)
!     -   (a, 1, 1, left, c)
!     -   (b, 0, 1, left, a)
!     -   (b, 1, 1, right, b)
!     -   (c, 0, 1, left, b)
!     -   (c, 1, 1, stay, halt)
! 
! The input for this machine should be an empty tape.
! 
! Bonus:
! 
! 5-state, 2-symbol probable Busy Beaver machine from Wikipedia
! 
! -   States: A, B, C, D, E, H
! -   Initial state: A
! -   Terminating states: H
! -   Permissible symbols: 0, 1
! -   Blank symbol: 0
! -   Rules:
!     -   (A, 0, 1, right, B)
!     -   (A, 1, 1, left, C)
!     -   (B, 0, 1, right, C)
!     -   (B, 1, 1, right, B)
!     -   (C, 0, 1, right, D)
!     -   (C, 1, 0, left, E)
!     -   (D, 0, 1, left, A)
!     -   (D, 1, 1, left, D)
!     -   (E, 0, 1, stay, H)
!     -   (E, 1, 0, left, A)
! 
! The input for this machine should be an empty tape.
! 
! This machine runs for more than 47 millions steps.


