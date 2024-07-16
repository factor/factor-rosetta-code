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

USING: kernel tools.test rosettacode.Y ;
IN: rosettacode.Y.tests

[ 120 ] [ 5 [ almost-fac ] Y call ] unit-test
[ 8 ]   [ 6 [ almost-fib ] Y call ] unit-test
