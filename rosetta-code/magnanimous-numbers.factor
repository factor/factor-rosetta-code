! A magnanimous number is an integer where there is no place in the number
! where a + (plus sign) could be added between any two digits to give a
! non-prime sum.
! 
! E.G.
! 
! -   -   6425 is a magnanimous number. 6 + 425 == 431 which is prime;
!         64 + 25 == 89 which is prime; 642 + 5 == 647 which is prime.
! 
! -   -   3538 is not a magnanimous number. 3 + 538 == 541 which is prime;
!         35 + 38 == 73 which is prime; but 353 + 8 == 361 which is not
!         prime.
! 
! Traditionally the single digit numbers 0 through 9 are included as
! magnanimous numbers as there is no place in the number where you can add
! a plus between two digits at all. (Kind of weaselly but there you
! are...) Except for the actual value 0, leading zeros are not permitted.
! Internal zeros are fine though, 1001 -> 1 + 001 (prime), 10 + 01 (prime)
! 100 + 1 (prime).
! 
! There are only 571 known magnanimous numbers. It is strongly suspected,
! though not rigorously proved, that there are no magnanimous numbers
! above 97393713331910, the largest one known.
! 
! Task
! 
! -   -   Write a routine (procedure, function, whatever) to find
!         magnanimous numbers.
! 
! -   -   Use that function to find and display, here on this page the
!         first 45 magnanimous numbers.
! 
! -   -   Use that function to find and display, here on this page the
!         241st through 250th magnanimous numbers.
! 
! -   -   Stretch: Use that function to find and display, here on this
!         page the 391st through 400th magnanimous numbers
! 
! See also
! 
! * OEIS:A252996 - Magnanimous numbers: numbers such that the sum obtained by inserting a "+" anywhere between two digits gives a prime.

USING: grouping io kernel lists lists.lazy math math.functions
math.primes math.ranges prettyprint sequences ;

: magnanimous? ( n -- ? )
    dup 10 < [ drop t ] [
        dup log10 >integer [1,b] [ 10^ /mod + prime? not ] with
        find nip >boolean not
    ] if ;

: magnanimous ( n -- seq )
    0 lfrom [ magnanimous? ] lfilter ltake list>array ;

: show ( seq from to -- ) rot subseq 15 group simple-table. nl ;

400 magnanimous
[ "First 45 magnanimous numbers" print 0 45 show ]
[ "241st through 250th magnanimous numbers" print 240 250 show ]
[ "391st through 400th magnanimous numbers" print 390 400 show ]
tri
