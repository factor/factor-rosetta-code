! A generator is an executable entity (like a function or procedure) that
! contains code that yields a sequence of values, one at a time, so that
! each time you call the generator, the next value in the sequence is
! provided.
! 
! Generators are often built on top of coroutines or objects so that the
! internal state of the object is handled “naturally”.
! 
! Generators are often used in situations where a sequence is potentially
! infinite, and where it is possible to construct the next value of the
! sequence with only minimal state.
! 
! Task:
! 
! -   Create a function that returns a generation of the m'th powers of
!     the positive integers starting from zero, in order, and without
!     obvious or simple upper limit. (Any upper limit to the generator
!     should not be stated in the source but should be down to factors
!     such as the languages natural integer size limit or computational
!     time/size).
! -   Use it to create a generator of:
!     -   -   Squares.
!         -   Cubes.
! -   Create a new generator that filters all cubes from the generator of
!     squares.
! -   Drop the first 20 values from this last generator of filtered
!     results, and then show the next 10 values.
! 
! Note that this task requires the use of generators in the calculation of
! the result.
! 
! Also see:
! 
! -   Generator
! 
! Category:Non parametric generators Category:Stateful transactions

USING: fry kernel lists lists.lazy math math.functions
prettyprint ;
IN: rosetta-code.generator-exponential

: mth-powers-generator ( m -- lazy-list )
    [ 0 lfrom ] dip [ ^ ] curry lmap-lazy ;

: lmember? ( elt list -- ? )
    over '[ unswons dup _ >= ] [ drop ] until nip = ;

: 2-not-3-generator ( -- lazy-list )
    2 mth-powers-generator
    [ 3 mth-powers-generator lmember? not ] <lazy-filter> ;

10 2-not-3-generator 20 [ cdr ] times ltake list>array .
