! A Monad is a combination of a data-type with two helper functions
! written for that type.
! 
! The data-type can be of any kind which can contain values of some other
! type – common examples are lists, records, sum-types, even functions or
! IO streams. The two special functions, mathematically known as eta and
! mu, but usually given more expressive names like 'pure', 'return', or
! 'yield' and 'bind', abstract away some boilerplate needed for
! pipe-lining or enchaining sequences of computations on values held in
! the containing data-type.
! 
! The bind operator in the List monad enchains computations which return
! their values wrapped in lists. One application of this is the
! representation of indeterminacy, with returned lists representing a set
! of possible values. An empty list can be returned to express
! incomputability, or computational failure.
! 
! A sequence of two list monad computations (enchained with the use of
! bind) can be understood as the computation of a cartesian product.
! 
! The natural implementation of bind for the List monad is a composition
! of concat and map, which, used with a function which returns its value
! as a (possibly empty) list, provides for filtering in addition to
! transformation or mapping.
! 
! Demonstrate in your programming language the following:
! 
! 1.  Construct a List Monad by writing the 'bind' function and the 'pure'
!     (sometimes known as 'return') function for that Monad (or just use
!     what the language already has implemented)
! 2.  Make two functions, each which take a number and return a monadic
!     number, e.g. Int -> List Int and Int -> List String
! 3.  Compose the two functions with bind
! 
! Category:Monads

USING: kernel math monads prettyprint ;
FROM: monads => do ;

{ 3 4 5 }
>>= [ 1 + array-monad return ] swap call
>>= [ 2 * array-monad return ] swap call .
