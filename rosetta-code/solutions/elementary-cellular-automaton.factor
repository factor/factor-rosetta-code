! An elementary cellular automaton is a one-dimensional cellular automaton
! where there are two possible states (labeled 0 and 1) and the rule to
! determine the state of a cell in the next generation depends only on the
! current state of the cell and its two immediate neighbors. Those three
! values can be encoded with three bits.
! 
! The rules of evolution are then encoded with eight bits indicating the
! outcome of each of the eight possibilities 111, 110, 101, 100, 011, 010,
! 001 and 000 in this order. Thus for instance the rule 13 means that a
! state is updated to 1 only in the cases 011, 010 and 000, since 13 in
! binary is 0b00001101.
! 
! Task:
! 
! Create a subroutine, program or function that allows to create and
! visualize the evolution of any of the 256 possible elementary cellular
! automaton of arbitrary space length and for any given initial state. You
! can demonstrate your solution with any automaton of your choice.
! 
! The space state should wrap: this means that the left-most cell should
! be considered as the right neighbor of the right-most cell, and
! reciprocally.
! 
! This task is basically a generalization of one-dimensional cellular
! automata.
! 
! Related tasks:
! 
! -   One-dimensional cellular automata
! 
! See also
! 
! -   Cellular automata (natureofcode.com)

USING: assocs formatting grouping io kernel math math.bits
math.combinatorics sequences sequences.extras ;

: make-rules ( n -- assoc )
    { f t } 3 selections swap make-bits 8 f pad-tail zip ;

: next-state ( assoc seq -- assoc seq' )
    dupd 3 circular-clump -1 rotate [ of ] with map ;

: first-state ( -- seq ) 15 f <repetition> dup { t } glue ;

: show-state ( seq -- ) [ "#" "." ? write ] each nl ;

: show-automaton ( rule -- )
    dup "Rule %d:\n" printf make-rules first-state 16
    [ dup show-state next-state ] times 2drop ;

90 show-automaton
