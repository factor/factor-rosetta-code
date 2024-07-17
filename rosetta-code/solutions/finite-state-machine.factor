! A Finite state machine (FSM) is computational abstraction which maps a
! finite number of states to other states within the same set, via
! transitions. An FSM can only be in one state at any given moment.
! Transitions can either be explicit or implicit; explicit transitions are
! triggered by an input signal and implicit transitions by the internal
! state of the system (that is, the current state). Implicit transitions
! thus represent "automatic" or sequenced states that are generally
! processed between explicit transitions (although they can also be used
! to provide an optional path when no valid transition exists for a given
! input signal).
! 
! Example
! 
! Consider the model of a simple vending machine. The machine is initially
! in the "ready" state, which maps to exactly two states in the following
! way:
! 
!     ready -> deposit -> waiting
! 
!     ready -> quit -> exit
! 
! The variables in bold-face represent transitions. Any input signal not
! corresponding to one of those transitions can either trigger an error or
! be ignored. Otherwise, the current state is updated and the process is
! repeated. If, for example, a deposit input signal is encountered, the
! FSM will move to the "waiting" state, which defines these transitions:
! 
!     waiting -> select -> dispense
! 
!     waiting -> refund -> refunding
! 
! The "dispense" state defines only one transition:
! 
!     dispense -> remove -> ready
! 
! Note, however, that in this example the "refunding" state doesn't
! actually require input in order to move to the "ready" state, so an
! implicit transition is defined as such:
! 
!     refunding -> ready
! 
! Task:
! 
! Implement a finite state machine which handles both explicit and
! implicit transitions. Then demonstrate an example which models some
! real-world process.
! 
! See also:
! 
! -   Computers Without Memory (Finite State Automata), A Computerphile
!     Video.


