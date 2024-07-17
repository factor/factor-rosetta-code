! The multiplicative digital root (MDR) and multiplicative persistence
! (MP) of a number, n, is calculated rather like the Digital root except
! digits are multiplied instead of being added:
! 
! 1.  Set m to n and i to 0.
! 2.  While m has more than one digit:
!     -   Find a replacement m as the multiplication of the digits of the
!         current value of m.
!     -   Increment i.
! 3.  Return i (= MP) and m (= MDR)
! 
! Task:
! 
! -   Tabulate the MP and MDR of the numbers 123321, 7739, 893, 899998
! -   Tabulate MDR versus the first five numbers having that MDR,
!     something like:
! 
!     MDR: [n0..n4]
!     ===  ========
!       0: [0, 10, 20, 25, 30]
!       1: [1, 11, 111, 1111, 11111]
!       2: [2, 12, 21, 26, 34]
!       3: [3, 13, 31, 113, 131]
!       4: [4, 14, 22, 27, 39]
!       5: [5, 15, 35, 51, 53]
!       6: [6, 16, 23, 28, 32]
!       7: [7, 17, 71, 117, 171]
!       8: [8, 18, 24, 29, 36]
!       9: [9, 19, 33, 91, 119]
! 
! Show all output on this page.
! 
! Similar:
! 
! The Product of decimal digits of n page was redirected here, and had the
! following description
! 
! Find the product of the decimal digits of a positive integer  n,  where n <= 100
! 
! The three existing entries for Phix, REXX, and Ring have been moved
! here, under ===Similar=== headings, feel free to match or ignore them.
! 
! References:
! 
! -   Multiplicative Digital Root on Wolfram Mathworld.
! -   Multiplicative digital root on The On-Line Encyclopedia of Integer
!     Sequences.
! -   What's special about 277777788888899? - Numberphile video

USING: arrays formatting fry io kernel lists lists.lazy math
math.text.utils prettyprint sequences ;
IN: rosetta-code.multiplicative-digital-root

: mdr ( n -- {persistence,root} )
    0 swap
    [ 1 digit-groups dup length 1 > ] [ product [ 1 + ] dip ] while
    dup empty? [ drop { 0 } ] when first 2array ;

: print-mdr ( n -- )
    dup [ 1array ] dip mdr append
    "%-12d has multiplicative persistence %d and MDR %d.\n"
    vprintf ;

: first5 ( n -- seq ) ! first 5 numbers with MDR of n
    0 lfrom swap '[ mdr second _ = ] lfilter 5 swap ltake list>array ;

: print-first5 ( i n -- )
    "%-5d" printf bl first5 [ "%-5d " printf ] each nl ;

: header ( -- )
    "MDR | First five numbers with that MDR" print
    "--------------------------------------" print ;

: first5-table ( -- )
    header 10 iota [ print-first5 ] each-index ;

: main ( -- )
    { 123321 7739 893 899998 } [ print-mdr ] each nl first5-table ;

MAIN: main
