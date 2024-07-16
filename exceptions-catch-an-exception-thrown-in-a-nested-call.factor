! Show how to create a user-defined exception and show how to catch an
! exception raised from several nested calls away.
! 
! :# Create two user-defined exceptions, U0 and U1.
! 
! :# Have function foo call function bar twice.
! 
! :# Have function bar call function baz.
! 
! :# Arrange for function baz to raise, or throw exception U0 on its first
! call, then exception U1 on its second.
! 
! :# Function foo should catch only exception U0, not U1.
! 
! Show/describe what happens when the program is run.

USING: combinators.extras continuations eval formatting kernel ;
IN: rosetta-code.nested-exceptions

ERROR: U0 ;
ERROR: U1 ;

: baz ( -- )
    "IN: rosetta-code.nested-exceptions : baz ( -- ) U1 ;"
    ( -- ) eval U0 ;

: bar ( -- ) baz ;

: foo ( -- )
    [
        [ bar ] [
            dup T{ U0 } =
            [ "%u recovered\n" printf ] [ rethrow ] if
        ] recover
    ] twice ;

foo
