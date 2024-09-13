! Task:
! 
! Create a list of ten functions, in the simplest manner possible
! (anonymous functions are encouraged), such that the function at index i
! (you may choose to start i from either 0 or 1), when run, should return
! the square of the index, that is, i ².
! 
! Display the result of running any but the last function, to demonstrate
! that the function indeed remembers its value.
! 
! Goal:
! 
! Demonstrate how to create a series of independent closures based on the
! same template but maintain separate copies of the variable closed over.
! 
! In imperative languages, one would generally use a loop with a mutable
! counter variable.
! 
! For each function to maintain the correct number, it has to capture the
! value of the variable at the time it was created, rather than just a
! reference to the variable, which would have a different value by the
! time the function was run.
! 
! See also: Multiple distinct objects
! 
! Category:Functions and subroutines

USING: io kernel locals math prettyprint sequences ;

[let
    ! Create a sequence of 10 quotations
    10 iota [
        :> i            ! Bind lexical variable i
        [ i i * ]       ! Push a quotation to calculate i squared
    ] map :> seq

    { 3 8 } [
        dup pprint " squared is " write
        seq nth call .
    ] each
]
