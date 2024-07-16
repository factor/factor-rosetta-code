! Task:
! 
! Show that the following remarkable formula gives the sequence of
! non-square natural numbers:
! 
!             n + floor(1/2 + sqrt(n)) 
! 
! -   Print out the values for n in the range 1 to 22
! -   Show that no squares occur for n less than one million
! 
! This is sequence A000037 in the OEIS database.

USING: kernel math math.functions math.ranges prettyprint
sequences ;

: non-sq ( n -- m ) dup sqrt 1/2 + floor + >integer ;

: print-first22 ( -- ) 22 [1,b] [ non-sq ] map . ;

: check-for-sq ( -- ) 1,000,000 [1,b)
    [ non-sq sqrt dup floor = [ "Square found." throw ] when ]
    each ;

print-first22 check-for-sq
