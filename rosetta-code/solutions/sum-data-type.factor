! Task:
! 
! Create a sum data type:
! 
! A sum data type is a data structure used to hold a value that could take
! on several different, but fixed, types. Only one of the types can be in
! use at any one time.
! 
! Sum data types are considered an algebraic data type and are also known
! as tagged union, variant, variant record, choice type, discriminated
! union, disjoint union or coproduct.
! 
! Related task:
! 
! -   Compound data type

USING: accessors kernel math math.parser strings ;

PREDICATE: numeric-string < string string>number >boolean ;
TUPLE: pseudo-number { value union{ number numeric-string } } ;
C: <pseudo-number> pseudo-number   ! constructor

5.245 <pseudo-number>   ! ok
"-17"   >>value         ! ok
"abc42" >>value         ! error
