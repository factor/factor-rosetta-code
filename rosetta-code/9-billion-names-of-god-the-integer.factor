! This task is a variation of the short story by Arthur C. Clarke.
! 
! (Solvers should be aware of the consequences of completing this task.)
! 
! In detail, to specify what is meant by a “name”:
! 
!     The integer 1 has 1 name “1”.
!     The integer 2 has 2 names “1+1”, and “2”.
!     The integer 3 has 3 names “1+1+1”, “2+1”, and “3”.
!     The integer 4 has 5 names “1+1+1+1”, “2+1+1”, “2+2”, “3+1”, “4”.
!     The integer 5 has 7 names “1+1+1+1+1”, “2+1+1+1”, “2+2+1”, “3+1+1”,
!     “3+2”, “4+1”, “5”.
! 
! Task
! 
! Display the first 25 rows of a number triangle which begins:
! 
!                                           1
!                                         1   1
!                                       1   1   1 
!                                     1   2   1   1
!                                   1   2   2   1   1
!                                 1   3   3   2   1   1
! 
! Where row n corresponds to integer n, and each column C in row m from
! left to right corresponds to the number of names beginning with C.
! 
! A function G(n) should return the sum of the n-th row.
! 
! Demonstrate this function by displaying: G(23), G(123), G(1234), and
! G(12345).
! 
! Optionally note that the sum of the n-th row P(n) is the integer
! partition function.
! 
! Demonstrate this is equivalent to G(n) by displaying: P(23), P(123),
! P(1234), and P(12345).
! 
! Extra credit
! 
! If your environment is able, plot P(n) against n for n = 1…999.
! 
! Related tasks
! 
! -   Partition function P

USING: combinators io kernel math math.ranges memoize prettyprint
sequences ;

MEMO: p ( m n -- o )
    {
        { [ dup zero? ] [ nip ] }
        { [ 2dup = ] [ 2drop 1 ] }
        { [ 2dup < ] [ 2drop 0 ] }
        [ [ [ 1 - ] bi@ p ] [ [ - ] [ ] bi p + ] 2bi ]
    } cond ;

: row ( n -- seq ) dup [1,b] [ p ] with map ;

: .row ( n -- ) row [ pprint bl ] each nl ;

: .triangle ( n -- ) [1,b] [ .row ] each ;

: G ( n -- sum ) row sum ;

25 .triangle nl
"Sums:" print { 23 123 1234 12345 } [ dup pprint bl G . ] each
