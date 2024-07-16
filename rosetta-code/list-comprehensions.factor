! A list comprehension is a special syntax in some programming languages
! to describe lists. It is similar to the way mathematicians describe
! sets, with a set comprehension, hence the name.
! 
! Some attributes of a list comprehension are:
! 
! 1.  They should be distinct from (nested) for loops and the use of map
!     and filter functions within the syntax of the language.
! 2.  They should return either a list or an iterator (something that
!     returns successive members of a collection, in order).
! 3.  The syntax has parts corresponding to that of set-builder notation.
! 
! Task:
! 
! Write a list comprehension that builds the list of all Pythagorean
! triples with elements between 1 and n.
! 
! If the language has multiple ways for expressing such a construct (for
! example, direct list comprehensions and generators), write one example
! for each.

USING: backtrack kernel locals math math.ranges ;

:: pythagorean-triples ( n -- seq )
    [
          n [1,b] amb-lazy :> a
        a n [a,b] amb-lazy :> b
        b n [a,b] amb-lazy :> c
        a a * b b * + c c * = must-be-true { a b c }
    ] bag-of ;
