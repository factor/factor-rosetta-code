! Definitions:
! 
! As used here, all unprimeable numbers (positive integers) are always
! expressed in base ten.
! 
! ───── Definition from OEIS ─────:
! 
! Unprimeable numbers are composite numbers that always remain composite
! when a single decimal digit of the number is changed.
! 
! ───── Definition from Wiktionary (referenced from Adam Spencer's book)
! ─────:
! 
! (arithmetic) that cannot be turned into a prime number by changing just
! one of its digits to any other digit. (sic)
! 
! Unprimeable numbers are also spelled: unprimable.
! 
! All one─ and two─digit numbers can be turned into primes by changing a
! single decimal digit.
! 
! Examples:
! 
! 190 isn't unprimeable, because by changing the zero digit into a three
! yields 193, which is a prime.
! 
! The number 200 is unprimeable, since none of the numbers 201, 202, 203,
! ··· 209 are prime, and all the other numbers obtained by changing a
! single digit to produce 100, 300, 400, ··· 900, or 210, 220, 230, ···
! 290 which are all even.
! 
! It is valid to change 189 into 089 by changing the 1 (one) into a 0
! (zero), which then the leading zero can be removed, and then treated as
! if the "new" number is 89.
! 
! Task:
! 
! -   -   show the first 35 unprimeable numbers (horizontally, on one
!         line, preferably with a title)
!     -   show the 600^(th) unprimeable number
!     -   (optional) show the lowest unprimeable number ending in a
!         specific decimal digit (0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
!     -   (optional) use commas in the numbers where appropriate
! 
! Show all output here, on this page.
! 
! Also see:
! 
! -   -   the OEIS entry: A118118 (unprimeable)
!     -   with some useful counts to compare unprimeable number
!     -   the Wiktionary entry (reference from below): (arithmetic
!         definition) unprimeable
!     -   from the Adam Spencer book (page 200): Adam Spencer's World of
!         Numbers (Xoum Publishing)

USING: assocs formatting io kernel lists lists.lazy
lists.lazy.examples math math.functions math.primes math.ranges
math.text.utils prettyprint sequences tools.memory.private ;

: one-offs ( n -- seq )
    dup 1 digit-groups [
        swapd 10^ [ * ] keep [ - ] dip
        2dup [ 9 * ] [ + ] [ <range> ] tri*
    ] with map-index concat ;

: (unprimeable?) ( n -- ? )
    [ f ] [ one-offs [ prime? ] none? ] if-zero ;

: unprimeable? ( n -- ? )
    dup prime? [ drop f ] [ (unprimeable?) ] if ;

: unprimeables ( -- list ) naturals [ unprimeable? ] lfilter ;

: ?set-at ( value key assoc -- )
    2dup key? [ 3drop ] [ set-at ] if ;

: first-digits ( -- assoc )
    unprimeables H{ } clone [ dup assoc-size 10 = ]
    [ [ unswons dup 10 mod ] dip [ ?set-at ] keep ] until nip ;

"The first 35 unprimeable numbers:" print bl bl
35 unprimeables ltake [ pprint bl ] leach nl nl

"The 600th unprimeable number:" print bl bl
599 unprimeables lnth commas print nl

"The first unprimeable number ending with" print
first-digits [ commas "  %d: %9s\n" printf ] assoc-each
