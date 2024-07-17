! In strict functional programming and the lambda calculus, functions
! (lambda expressions) don't have state and are only allowed to refer to
! arguments of enclosing functions.
! 
! This rules out the usual definition of a recursive function wherein a
! function is associated with the state of a variable and this variable's
! state is used in the body of the function.
! 
! The Y combinator is itself a stateless function that, when applied to
! another stateless function, returns a recursive version of the function.
! 
! The Y combinator is the simplest of the class of such functions, called
! fixed-point combinators.
! 
! Task:
! 
! Define the stateless Y combinator and use it to compute factorials and
! Fibonacci numbers from other stateless functions or lambda expressions.
! 
! Cf:
! 
! -   Jim Weirich: Adventures in Functional Programming
! 
! Category:Recursion

USING: fry kernel math ;
IN: rosettacode.Y
: Y ( quot -- quot )
    '[ [ dup call call ] curry @ ] dup call ; inline

: almost-fac ( quot -- quot )
    '[ dup zero? [ drop 1 ] [ dup 1 - @ * ] if ] ;

: almost-fib ( quot -- quot )
    '[ dup 2 >= [ 1 2 [ - @ ] bi-curry@ bi + ] when ] ;
