! Demonstrate in your programming language the following:
! 
! 1.  Construct a Maybe Monad by writing the 'bind' function and the
!     'unit' (sometimes known as 'return') function for that Monad (or
!     just use what the language already has implemented)
! 2.  Make two functions, each which take a number and return a monadic
!     number, e.g. Int -> Maybe Int and Int -> Maybe String
! 3.  Compose the two functions with bind
! 
! A Monad is a single type which encapsulates several other types,
! eliminating boilerplate code. In practice it acts like a dynamically
! typed computational sequence, though in many cases the type issues can
! be resolved at compile time.
! 
! A Maybe Monad is a monad which specifically encapsulates the type of an
! undefined value.
! 
! Category:Monads

USING: monads ;
FROM: monads => do ;

! Prints "T{ just { value 7 } }"
3 maybe-monad return >>= [ 2 * maybe-monad return ] swap call
                     >>= [ 1 + maybe-monad return ] swap call .

! Prints "nothing"
nothing >>= [ 2 * maybe-monad return ] swap call
        >>= [ 1 + maybe-monad return ] swap call .
