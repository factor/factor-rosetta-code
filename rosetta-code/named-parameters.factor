! Create a function which takes in a number of arguments which are
! specified by name rather than (necessarily) position, and show how to
! call the function. If the language supports reordering the arguments or
! optionally omitting some of them, note this.
! 
! Note:
! 
!     Named parameters relies on being able to use the names given to
!     function parameters when the function is defined, when assigning
!     arguments when the function is called.
!     For example, if a function were to be defined as
!     define func1( paramname1, paramname2); then it could be called
!     normally as func1(argument1, argument2) and in the called function
!     paramname1 would be associated with argument1 and paramname2 with
!     argument2.
!     func1 must also be able to be called in a way that visually binds
!     each parameter to its respective argument, irrespective of argument
!     order, for example:
!     func1(paramname2=argument2, paramname1=argument1) which explicitly
!     makes the same parameter/argument bindings as before.
!     Named parameters are often a feature of languages used in safety
!     critical areas such as Verilog and VHDL.
! 
! See also:
! 
! -   Varargs
! -   Optional parameters
! -   Wikipedia: Named parameter

:: my-named-params ( a b -- c ) a b * ;
