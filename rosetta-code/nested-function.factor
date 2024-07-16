! In many languages, functions can be nested, resulting in outer functions
! and inner functions. The inner function can access variables from the
! outer function. In most languages, the inner function can also modify
! variables in the outer function.
! 
! Task:
! 
! Write a program consisting of two nested functions that prints the
! following text.
! 
! 1. first
! 2. second
! 3. third
! 
! The outer function (called MakeList or equivalent) is responsible for
! creating the list as a whole and is given the separator ". " as
! argument. It also defines a counter variable to keep track of the item
! number. This demonstrates how the inner function can influence the
! variables in the outer function.
! 
! The inner function (called MakeItem or equivalent) is responsible for
! creating a list item. It accesses the separator from the outer function
! and modifies the counter.
! 
! References:
! 
! -   -   Nested function

USING: io kernel math math.parser locals qw sequences ;
IN: rosetta-code.nested-functions

:: make-list ( separator -- str )
    1 :> counter!    
    [| item |
        counter number>string separator append item append
        counter 1 + counter!
    ] :> make-item
    qw{ first second third } [ make-item call ] map "\n" join
;
    
". " make-list write
