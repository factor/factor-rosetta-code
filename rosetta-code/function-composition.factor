! Task:
! 
! Create a function, compose, whose two arguments f and g, are both
! functions with one argument.
! 
! The result of compose is to be a function of one argument, (lets call
! the argument x), which works like applying function f to the result of
! applying function g to x.
! 
! Example:
! 
!  compose(f, g) (x) = f(g(x))
! 
! Reference: Function composition
! 
! Hint: In some languages, implementing compose correctly requires
! creating a closure.

( scratchpad ) [ 2 * ] [ 1 + ] compose .
[ 2 * 1 + ]
( scratchpad ) 4 [ 2 * ] [ 1 + ] compose call .
9
