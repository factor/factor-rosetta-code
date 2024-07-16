! Hero's formula for the area of a triangle given the length of its three
! sides a, b, and c is given by:
! 
!         $A = \sqrt{s(s-a)(s-b)(s-c)},$
! 
! where s is half the perimeter of the triangle; that is,
! 
!         $s=\frac{a+b+c}{2}.$
! 
! Heronian triangles are triangles whose sides and area are all integers.
! 
!     An example is the triangle with sides 3, 4, 5 whose area is 6 (and
!     whose perimeter is 12).
! 
! Note that any triangle whose sides are all an integer multiple of 3, 4,
! 5; such as 6, 8, 10, will also be a Heronian triangle.
! 
! Define a Primitive Heronian triangle as a Heronian triangle where the
! greatest common divisor of all three sides is 1 (unity).
! 
! This will exclude, for example, triangle 6, 8, 10.
! 
! Task:
! 
! 1.  Create a named function/method/procedure/... that implements Hero's
!     formula.
! 2.  Use the function to generate all the primitive Heronian triangles
!     with sides <= 200.
! 3.  Show the count of how many triangles are found.
! 4.  Order the triangles by first increasing area, then by increasing
!     perimeter, then by increasing maximum side lengths
! 5.  Show the first ten ordered triangles in a table of sides, perimeter,
!     and area.
! 6.  Show a similar ordered table for those triangles with area = 210
! 
! Show all output here.
! 
! Note: when generating triangles it may help to restrict a <  = b <  = c

USING: accessors assocs backtrack combinators.extras
combinators.short-circuit formatting io kernel locals math
math.functions math.order math.parser math.ranges mirrors qw
sequences sorting.slots ;
IN: rosetta-code.heronian-triangles

TUPLE: triangle a b c area perimeter ;

:: area ( a b c -- x )
    a b + c + 2 / :> s
    s s a - * s b - * s c - * sqrt ;

: <triangle> ( triplet-seq -- triangle )
    [ first3 ] [ first3 area >integer ] [ sum ] tri
    triangle boa ;

: heronian? ( a b c -- ? )
    area dup [ complex? ] [ 0 number= ] bi or
    [ drop f ] [ dup >integer number= ] if ;
    
: 3gcd ( a b c -- n ) [ gcd nip ] twice ;
    
: primitive-heronian? ( a b c -- ? )
    { [ 3gcd 1 = ] [ heronian? ] } 3&& ;

:: find-triangles ( -- seq )
    [
        200 [1,b] amb-lazy :> c    ! Use backtrack vocab to test
        c   [1,b] amb-lazy :> b    ! permutations of sides such
        b   [1,b] amb-lazy :> a    ! that c >= b >= a.
        a b c primitive-heronian? must-be-true
        { a b c } <triangle>
    ] bag-of ;                     ! collect every triangle
    
: sort-triangles ( seq -- seq' )
    { { area>> <=> } { perimeter>> <=> } } sort-by ;
    
CONSTANT: format "%4s%5s%5s%5s%10s\n"
    
: print-header ( -- )
    qw{ a b c area perimeter } format vprintf
    "---- ---- ---- ---- ---------" print ;
    
: print-triangle ( triangle -- )
    <mirror> >alist values [ number>string ] map format vprintf ;

: print-triangles ( seq -- ) [ print-triangle ] each ; inline
    
: first10 ( sorted-triangles -- )
    dup length "%d triangles found. First 10: \n" printf
    print-header 10 head print-triangles ;
    
: area210= ( sorted-triangles -- )
    "Triangles with area 210: " print print-header
    [ area>> 210 = ] filter print-triangles ;
    
: main ( -- )
    "Finding heronian triangles with sides <= 200..." print nl
    find-triangles sort-triangles
    [ first10 nl ] [ area210= ] bi ;
    
MAIN: main
