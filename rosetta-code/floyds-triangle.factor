! Floyd's triangle lists the natural numbers in a right triangle aligned
! to the left where
! 
! -   the first row is 1 (unity)
! -   successive rows start towards the left with the next number followed
!     by successive naturals listing one more number than the line above.
! 
! The first few lines of a Floyd triangle looks like this:
! 
!      1
!      2  3
!      4  5  6
!      7  8  9 10
!     11 12 13 14 15
! 
! Task:
! 
! :# Write a program to generate and display here the first n lines of a
! Floyd triangle. (Use n=5 and n=14 rows).
! 
! :# Ensure that when displayed in a mono-space font, the numbers line up
! in vertical columns as shown and that only one space separates numbers
! of the last row.

USING: io kernel math math.functions math.ranges prettyprint
sequences ;
IN: rosetta-code.floyds-triangle

: floyd. ( n -- )
    [ dup 1 - * 2 / 1 + dup 1 ] [ [1,b] ] bi
    [
        [
            2dup [ log10 1 + >integer ] bi@ -
            [ " " write ] times dup pprint bl [ 1 + ] bi@
        ] times nl [ drop dup ] dip
    ] each nl 3drop ;

5 14 [ floyd. ] bi@
