! Modular arithmetic is a form of arithmetic (a calculation technique
! involving the concepts of addition and multiplication) which is done on
! numbers with a defined equivalence relation called congruence.
! 
! For any positive integer p called the congruence modulus, two numbers a
! and b are said to be congruent modulo p whenever there exists an integer
! k such that:
! 
! a = b + k p
! 
! The corresponding set of equivalence classes forms a ring denoted
! $\frac{\Z}{p\Z}$. When p is a prime number, this ring becomes a field
! denoted 𝔽_(p), but you won't have to implement the multiplicative
! inverse for this task.
! 
! Addition and multiplication on this ring have the same algebraic
! structure as in usual arithmetic, so that a function such as a
! polynomial expression could receive a ring element as argument and give
! a consistent result.
! 
! The purpose of this task is to show, if your programming language allows
! it, how to redefine operators so that they can be used transparently on
! modular integers. You can do it either by using a dedicated library, or
! by implementing your own class.
! 
! You will use the following function for demonstration:
! 
! f(x) = x¹⁰⁰ + x + 1
! You will use 13 as the congruence modulus and you will compute f(10).
! 
! It is important that the function f is agnostic about whether or not its
! argument is modular; it should behave the same way with normal and
! modular integers. In other words, the function is an algebraic
! expression that could be used with any ring, not just integers.
! 
! Related tasks:
! 
! Modular exponentiation

USING: accessors generalizations io kernel math math.functions
parser prettyprint prettyprint.custom sequences ;
IN: rosetta-code.modular-arithmetic
RENAME: ^ math.functions => **

! Define a modular integer class.
TUPLE: mod-int
    { n integer read-only } { mod integer read-only } ;

! Define a constructor for mod-int.
C: <mod-int> mod-int

ERROR: non-equal-modulus m1 m2 ;

! Define a literal syntax for mod-int. 
<< SYNTAX: MI{ \ } [ first2 <mod-int> ] parse-literal ; >>

! Implement prettyprinting for mod-int custom syntax.
M: mod-int pprint-delims drop \ MI{ \ } ;
M: mod-int >pprint-sequence [ n>> ] [ mod>> ] bi { } 2sequence ;
M: mod-int pprint* pprint-object ;

<PRIVATE

! Helper words for displaying the results of an arithmetic
! operation.
: show ( quot -- )
    [ unparse 2 tail but-last "= " append write ] [ call . ] bi
    ; inline

: 2show ( quots -- )
    [ 2curry show ] map-compose [ call( -- ) ] each ; inline

! Check whether two mod-ints have the same modulus and throw an
! error if not.
: check-mod ( m1 m2 -- )
    2dup [ mod>> ] bi@ = [ 2drop ] [ non-equal-modulus ] if ;

! Apply quot to the integer parts of two mod-ints and create a
! new mod-int from the result.
: mod-int-op ( m1 m2 quot -- m3 )
    [ [ n>> ] bi@ ] prepose [ 2dup check-mod ] dip over
    mod>> [ call( x x -- x ) ] dip [ mod ] keep <mod-int>
    ; inline

! Promote an integer to a mod-int and call mod-int-op.
: integer-op ( obj1 obj2 quot -- mod-int )
    [
        dup integer?
        [ over mod>> <mod-int> ]
        [ dup [ mod>> <mod-int> ] dip ] if
    ] dip mod-int-op ; inline

! Apply quot, a binary function, to any combination of integers
! and mod-ints.
: binary-op ( obj1 obj2 quot -- mod-int )
    2over [ mod-int? ] both? [ mod-int-op ] [ integer-op ] if
    ; inline

PRIVATE>

! This is where the arithmetic words are 'redefined' by adding a
! method to them that specializes on the object class.
M: object + [ + ] binary-op ;
M: object - [ - ] binary-op ;
M: object * [ * ] binary-op ;
M: object /i [ /i ] binary-op ;

! ^ is a special case because it is not generic.
: ^ ( obj1 obj2 -- obj3 )
    2dup [ mod-int? ] either? [ [ ** ] binary-op ] [ ** ] if ;

: fn ( obj -- obj' ) dup 100 ^ + 1 + ;

: modular-arithmetic-demo ( -- )
    [ MI{ 10 13 } fn ]
    [ 2 fn ] [ show ] bi@
    {
        [ MI{ 10 13 } MI{ 5 13 } [ + ] ]
        [ MI{ 10 13 } 5 [ + ] ]
        [ 5 MI{ 10 13 } [ + ] ]
        [ MI{ 10 13 } 2 [ /i ] ]
        [ 5 10 [ * ] ]
        [ MI{ 3 7 } MI{ 4 7 } [ * ] ]
        [ MI{ 3 7 } 50 [ ^ ] ]
    } 2show ;

MAIN: modular-arithmetic-demo
