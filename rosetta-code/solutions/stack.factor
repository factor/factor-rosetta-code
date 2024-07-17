! A stack is a container of elements with last in, first out access
! policy. Sometimes it also called LIFO.
! 
! The stack is accessed through its top.
! 
! The basic stack operations are:
! 
! -   push stores a new element onto the stack top;
! -   pop returns the last pushed stack element, while removing it from
!     the stack;
! -   empty tests if the stack contains no elements.
! 
! Sometimes the last pushed stack element is made accessible for immutable
! access (for read) or mutable access (for write):
! 
! -   top (sometimes called peek to keep with the p theme) returns the
!     topmost element without modifying the stack.
! 
! Stacks allow a very simple hardware implementation.
! 
! They are common in almost all processors.
! 
! In programming, stacks are also very popular for their way (LIFO) of
! resource management, usually memory.
! 
! Nested scopes of language objects are naturally implemented by a stack
! (sometimes by multiple stacks).
! 
! This is a classical way to implement local variables of a re-entrant or
! recursive subprogram. Stacks are also used to describe a formal
! computational framework.
! 
! See stack machine.
! 
! Many algorithms in pattern matching, compiler construction (e.g.
! recursive descent parsers), and machine learning (e.g. based on tree
! traversal) have a natural representation in terms of stacks.
! 
! Task:
! 
! Create a stack supporting the basic operations: push, pop, empty.
! 
! Category:Encyclopedia Category:Classic CS problems and programs

 V{ 1 2 3 } {
 [ 6 swap push ]
 [ "hi" swap push ]
 [ "Vector is now: " write . ]
 [ "Let's pop it: " write pop . ]
 [ "Vector is now: " write . ]
 [ "Top is: " write last . ] } cleave

 Vector is now: V{ 1 2 3 6 "hi" }
 Let's pop it: "hi"
 Vector is now: V{ 1 2 3 6 }
 Top is: 6
