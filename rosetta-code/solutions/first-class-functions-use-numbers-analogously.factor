! In First-class functions, a language is showing how its manipulation of
! functions is similar to its manipulation of other types.
! 
! This tasks aim is to compare and contrast a language's implementation of
! first class functions, with its normal handling of numbers.
! 
! Write a program to create an ordered collection of a mixture of
! literally typed and expressions producing a real number, together with
! another ordered collection of their multiplicative inverses. Try and use
! the following pseudo-code to generate the numbers for the ordered
! collections:
! 
!   x  = 2.0
!   xi = 0.5
!   y  = 4.0
!   yi = 0.25
!   z  = x + y
!   zi = 1.0 / ( x + y )
! 
! Create a function multiplier, that given two numbers as arguments
! returns a function that when called with one argument, returns the
! result of multiplying the two arguments to the call to multiplier that
! created it and the argument in the call:
! 
!  new_function = multiplier(n1,n2)
!  # where new_function(m) returns the result of n1 * n2 * m
! 
! Applying the multiplier of a number and its inverse from the two ordered
! collections of numbers in pairs, show that the result in each case is
! one.
! 
! Compare and contrast the resultant program with the corresponding entry
! in First-class functions. They should be close.
! 
! To paraphrase the task description: Do what was done before, but with
! numbers rather than functions

USING: arrays kernel literals math prettyprint sequences ;
IN: q

CONSTANT: x  2.0
CONSTANT: xi 0.5
CONSTANT: y  4.0
CONSTANT: yi .25
CONSTANT: z $[ $ x $ y + ]
CONSTANT: zi $[ 1 $ x $ y + / ]

CONSTANT: A ${ x y z }
CONSTANT: B ${ xi yi zi } 

: multiplier ( n1 n2 -- q ) [ * * ] 2curry ;
: create-all ( seq1 seq2 -- seq ) [ multiplier ] 2map ;
: example  ( -- )
  0.5 A B create-all
  [ call( x -- y ) ] with map . ;
