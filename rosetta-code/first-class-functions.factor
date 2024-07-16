! A language has first-class functions if it can do each of the following
! without recursively invoking a compiler or interpreter or otherwise
! metaprogramming:
! 
! -   Create new functions from preexisting functions at run-time
! -   Store functions in collections
! -   Use functions as arguments to other functions
! -   Use functions as return values of other functions
! 
! Task:
! 
! Write a program to create an ordered collection A of functions of a real
! number. At least one function should be built-in and at least one should
! be user-defined; try using the sine, cosine, and cubing functions. Fill
! another collection B with the inverse of each function in A. Implement
! function composition as in Functional Composition. Finally, demonstrate
! that the result of applying the composition of each function in A and
! its inverse in B to a value, is the original value. (Within the limits
! of computational accuracy).
! 
! (A solution need not actually call the collections "A" and "B". These
! names are only used in the preceding paragraph for clarity.)
! 
! Related task:
! 
! First-class Numbers

USING: assocs combinators kernel math.functions prettyprint sequences ;
IN: rosettacode.first-class-functions

CONSTANT: A { [ sin ] [ cos ] [ 3 ^ ] }
CONSTANT: B { [ asin ] [ acos ] [ 1/3 ^ ] } 

: compose-all ( seq1 seq2 -- seq ) [ compose ] 2map ;

: test-fcf ( -- )
    0.5 A B compose-all
    [ call( x -- y ) ] with map . ;
