! The Writer monad is a programming design pattern which makes it possible
! to compose functions which return their result values paired with a log
! string. The final result of a composed function yields both a value, and
! a concatenation of the logs from each component function application.
! 
! Demonstrate in your programming language the following:
! 
! 1.  Construct a Writer monad by writing the 'bind' function and the
!     'unit' (sometimes known as 'return') function for that monad (or
!     just use what the language already provides)
! 2.  Write three simple functions: root, addOne, and half
! 3.  Derive Writer monad versions of each of these functions
! 4.  Apply a composition of the Writer versions of root, addOne, and half
!     to the integer 5, deriving both a value for the Golden Ratio φ, and
!     a concatenated log of the function applications (starting with the
!     initial value, and followed by the application of root, etc.)
! 
! Category:Monads

USING: kernel math math.functions monads prettyprint ;
FROM: monads => do ;

{
    [ 5 "Started with five, " <writer> ]
    [ sqrt "took square root, " <writer> ]
    [ 1 + "added one, " <writer> ]
    [ 2 / "divided by two." <writer> ]
} do .
