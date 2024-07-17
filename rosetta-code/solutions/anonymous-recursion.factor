! While implementing a recursive function, it often happens that we must
! resort to a separate helper function to handle the actual recursion.
! 
! This is usually the case when directly calling the current function
! would waste too many resources (stack space, execution time), causing
! unwanted side-effects, and/or the function doesn't have the right
! arguments and/or return values.
! 
! So we end up inventing some silly name like foo2 or foo_helper. I have
! always found it painful to come up with a proper name, and see some
! disadvantages:
! 
! -   -   You have to think up a name, which then pollutes the namespace
!     -   Function is created which is called from nowhere else
!     -   The program flow in the source code is interrupted
! 
! Some languages allow you to embed recursion directly in-place. This
! might work via a label, a local gosub instruction, or some special
! keyword.
! 
! Anonymous recursion can also be accomplished using the Y combinator.
! 
! Task:
! 
! If possible, demonstrate this by writing the recursive version of the
! fibonacci function (see Fibonacci sequence) which checks for a negative
! argument before doing the actual recursion.
! 
! Related tasks:
! 
! -   -   Y combinator

USING: kernel math ;
IN: rosettacode.fibonacci.ar

: fib ( n -- m )
    dup 0 < [ "fib of negative" throw ] when
    [
        ! If n < 2, then drop q, else find q(n - 1) + q(n - 2).
        [ dup 2 < ] dip swap [ drop ] [
            [ [ 1 - ] dip dup call ]
            [ [ 2 - ] dip dup call ] 2bi +
        ] if
    ] dup call( n q -- m ) ;
