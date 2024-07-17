! Zumkeller numbers are the set of numbers whose divisors can be
! partitioned into two disjoint sets that sum to the same value. Each sum
! must contain divisor values that are not in the other sum, and all of
! the divisors must be in one or the other. There are no restrictions on
! how the divisors are partitioned, only that the two partition sums are
! equal.
! 
! E.G.
! 
!     6 is a Zumkeller number; The divisors {1 2 3 6} can be partitioned
!     into two groups {1 2 3} and {6} that both sum to 6.
! 
!     10 is not a Zumkeller number; The divisors {1 2 5 10} can not be
!     partitioned into two groups in any way that will both sum to the
!     same value.
! 
!     12 is a Zumkeller number; The divisors {1 2 3 4 6 12} can be
!     partitioned into two groups {1 3 4 6} and {2 12} that both sum to
!     14.
! 
! Even Zumkeller numbers are common; odd Zumkeller numbers are much less
! so. For values below 10^6, there is at least one Zumkeller number in
! every 12 consecutive integers, and the vast majority of them are even.
! The odd Zumkeller numbers are very similar to the list from the task
! Abundant odd numbers; they are nearly the same except for the further
! restriction that the abundance (A(n) = sigma(n) - 2n), must be even:
! A(n) mod 2 == 0
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to find
!         Zumkeller numbers.
!     -   Use the routine to find and display here, on this page, the
!         first 220 Zumkeller numbers.
!     -   Use the routine to find and display here, on this page, the
!         first 40 odd Zumkeller numbers.
!     -   Optional, stretch goal: Use the routine to find and display
!         here, on this page, the first 40 odd Zumkeller numbers that
!         don't end with 5.
! 
! See Also:
! 
! -   -   OEIS:A083207 - Zumkeller numbers to get an impression of
!         different partitions OEIS:A083206 Zumkeller partitions
!     -   OEIS:A174865 - Odd Zumkeller numbers
! 
! Related Tasks:
! 
! -   -   Abundant odd numbers
!     -   Abundant, deficient and perfect number classifications
!     -   Proper divisors , Factors of an integer

USING: combinators grouping io kernel lists lists.lazy math
math.primes.factors memoize prettyprint sequences ;

MEMO: psum? ( seq n -- ? )
    {
        { [ dup zero? ] [ 2drop t ] }
        { [ over length zero? ] [ 2drop f ] }
        { [ over last over > ] [ [ but-last ] dip psum? ] }
        [
            [ [ but-last ] dip psum? ]
            [ over last - [ but-last ] dip psum? ] 2bi or
        ]
    } cond ;

: zumkeller? ( n -- ? )
    dup divisors dup sum
    {
        { [ dup odd? ] [ 3drop f ] }
        { [ pick odd? ] [ nip swap 2 * - [ 0 > ] [ even? ] bi and ] }
        [ nipd 2/ psum? ]
    } cond ;

: zumkellers ( -- list )
    1 lfrom [ zumkeller? ] lfilter ;

: odd-zumkellers ( -- list )
    1 [ 2 + ] lfrom-by [ zumkeller? ] lfilter ;

: odd-zumkellers-no-5 ( -- list )
    odd-zumkellers [ 5 mod zero? not ] lfilter ;

: show ( count list row-len -- )
    [ ltake list>array ] dip group simple-table. nl ;

"First 220 Zumkeller numbers:" print
220 zumkellers 20 show

"First 40 odd Zumkeller numbers:" print
40 odd-zumkellers 10 show

"First 40 odd Zumkeller numbers not ending with 5:" print
40 odd-zumkellers-no-5 8 show
