! Storing the history of objects in a program is a common task.
! Maintaining the history of an object in a program has traditionally
! required programmers either to write specific code for handling the
! historical data, or to use a library which supports history logging.
! 
! History variables are variables in a programming language which store
! not only their current value, but also the values they have contained in
! the past. Some existing languages do provide support for history
! variables. However these languages typically have many limits and
! restrictions on use of history variables.
! 
! "History Variables: The Semantics, Formal Correctness, and
! Implementation of History Variables in an Imperative Programming
! Language" by Mallon and Takaoka
! 
! Concept also discussed on LtU and Patents.com.
! 
! Task:
! 
! Demonstrate History variable support:
! 
! -   enable history variable support (if needed)
! -   define a history variable
! -   assign three values
! -   non-destructively display the history
! -   recall the three values.
! 
! For extra points, if the language of choice does not support history
! variables, demonstrate how this might be implemented.

USING: accessors combinators formatting kernel models.history ;

1 <history> {
    [ add-history ]
    [ value>> "Initial value: %u\n" printf ]
    [ 2 >>value add-history ]
    [ 3 swap value<< ]
    [ value>> "Current value: %u\n" printf ]
    [ go-back ]
    [ go-back ]
    [ value>> "Restored value: %u\n" printf ]
} cleave
