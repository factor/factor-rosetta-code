! The definition of the sequence is colloquially described as:
! 
! -   Starting with the list [1,1],
! -   Take the last number in the list so far: 1, I'll call it x.
! -   Count forward x places from the beginning of the list to find the
!     first number to add (1)
! -   Count backward x places from the end of the list to find the second
!     number to add (1)
! -   Add the two indexed numbers from the list and the result becomes the
!     next number in the list (1+1)
! -   This would then produce [1,1,2] where 2 is the third element of the
!     sequence.
! 
! Note that indexing for the description above starts from alternately the
! left and right ends of the list and starts from an index of one.
! 
! A less wordy description of the sequence is:
! 
!    a(1)=a(2)=1
!    a(n)=a(a(n-1))+a(n-a(n-1))
! 
! The sequence begins:
! 
!    1, 1, 2, 2, 3, 4, 4, 4, 5, ...
! 
! Interesting features of the sequence are that:
! 
! -   a(n)/n tends to 0.5 as n grows towards infinity.
! -   a(n)/n where n is a power of 2 is 0.5
! -   For n>4 the maximal value of a(n)/n between successive powers of 2
!     decreases.
! 
! [a(n) / n for n in 1..256]
! 
! The sequence is so named because John Conway offered a prize of $10,000
! to the first person who could find the first position, p in the sequence
! where
! 
!    │a(n)/n│ < 0.55  for all  n > p
! 
! It was later found that Hofstadter had also done prior work on the
! sequence.
! 
! The 'prize' was won quite quickly by Dr. Colin L. Mallows who proved the
! properties of the sequence and allowed him to find the value of n (which
! is much smaller than the 3,173,375,556 quoted in the NYT article).
! 
! Task:
! 
! 1.  Create a routine to generate members of the Hofstadter-Conway
!     $10,000 sequence.
! 2.  Use it to show the maxima of a(n)/n between successive powers of two
!     up to 2**20
! 3.  As a stretch goal: compute the value of n that would have won the
!     prize and confirm it is true for n up to 2**20
! 
! Also see:
! 
! -   Conways Challenge Sequence, Mallows' own account.
! -   Mathworld Article.

USING: combinators formatting io kernel locals math math.ranges
prettyprint sequences splitting ;

MEMO:: a ( n -- a(n) )  ! memoize the recurrence relation
    n {
        { 1 [ 1 ] }
        { 2 [ 1 ] }
        [ 1 - a a n n 1 - a - a + ]
    } case ;

20 2^ [1,b] [ [ a ] [ 1 + / ] bi* ] map-index
[
    { 1/2 } split harvest rest-slice
    [ supremum ] map 1 19 [a,b]
    [ dup 1 + [ 2^ ] bi@ "%f max in (%d, %d)\n" printf ]
    2each
]
[ "Mallow's number: " write [ 0.55 >= ] find-last drop 1 + . ]
bi
