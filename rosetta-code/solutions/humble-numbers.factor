! Humble numbers are positive integers which have no prime factors  > 7.
! 
! Humble numbers are also called 7-smooth numbers, and sometimes called
! highly composite,
! 
! although this conflicts with another meaning of highly composite
! numbers.
! 
! Another way to express the above is:
! 
!   humble  =  2^(i) × 3^(j) × 5^(k) × 7^(m) 
! 
!            where     i, j, k, m ≥ 0 
! 
! Task:
! 
! -   -   show the first 50 humble numbers (in a horizontal list)
!     -   show the number of humble numbers that have x decimal digits for
!         all x's up to n (inclusive).
!     -   show (as many as feasible or reasonable for above) on separate
!         lines
!     -   show all output here on this page
! 
! Related tasks:
! 
! -   -   Hamming numbers
! 
! References:
! 
! -   -   Wikipedia: Smooth numbers, see the 2^(nd) paragraph.
!     -   OEIS A002473: humble numbers
!     -   University of Ulm, The first 5842 terms of humble numbers

USING: accessors assocs combinators deques dlists formatting fry
generalizations io kernel make math math.functions math.order
prettyprint sequences tools.memory.private ;
IN: rosetta-code.humble-numbers
 
TUPLE: humble-iterator 2s 3s 5s 7s digits
    { #digits initial: 1 } { target initial: 10 } ;
 
: <humble-iterator> ( -- humble-iterator )
    humble-iterator new
    1 1dlist >>2s
    1 1dlist >>3s
    1 1dlist >>5s
    1 1dlist >>7s
    H{ } clone >>digits ;

: enqueue ( n humble-iterator -- )
    {
        [ [ 2 * ] [ 2s>> ] ]
        [ [ 3 * ] [ 3s>> ] ]
        [ [ 5 * ] [ 5s>> ] ]
        [ [ 7 * ] [ 7s>> ] ]
    } [ bi* push-back ] map-compose 2cleave ;

: count-digits ( humble-iterator n -- )
    [ over target>> >=
    [ [ 1 + ] change-#digits [ 10 * ] change-target ] when ]
    [ drop 1 swap [ #digits>> ] [ digits>> ] bi at+ ] bi ;

: ?pop ( 2s 3s 5s 7s n -- )
    '[ dup peek-front _ = [ pop-front* ] [ drop ] if ] 4 napply ;

: next ( humble-iterator -- n )
    dup dup { [ 2s>> ] [ 3s>> ] [ 5s>> ] [ 7s>> ] } cleave
    4 ndup [ peek-front ] 4 napply min min min
    { [ ?pop ] [ swap enqueue ] [ count-digits ] [ ] } cleave ;

: upto-n-digits ( humble-iterator n -- seq )
    1 + swap [ [ 2dup digits>> key? ] [ dup next , ] until ] { }
    make [ digits>> delete-at ] dip but-last-slice ;

: .first50 ( seq -- )
    "First 50 humble numbers:" print 50 head [ pprint bl ] each
    nl ;

: .digit-breakdown ( humble-iterator -- )
    "The digit counts of humble numbers:" print digits>> [
        commas swap dup 1 = "" "s" ? "%9s have %2d digit%s\n"
        printf
    ] assoc-each ;

: humble-numbers ( -- )
    [ <humble-iterator> dup 95 upto-n-digits
    [ .first50 nl ] [ drop .digit-breakdown nl ] [
        "Total number of humble numbers found: " write length
        commas print
    ] tri ] time ;

MAIN: humble-numbers
