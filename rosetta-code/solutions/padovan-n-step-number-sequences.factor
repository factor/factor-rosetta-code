! As the Fibonacci sequence expands to the Fibonacci n-step number
! sequences; We similarly expand the Padovan sequence to form these
! Padovan n-step number sequences.
! 
! The Fibonacci-like sequences can be defined like this:
! 
!    For n == 2:
!        start:      1, 1
!        Recurrence: R(n, x) = R(n, x-1) + R(n, x-2); for n == 2
!    For n == N:
!        start:      First N terms of R(N-1, x)
!        Recurrence: R(N, x) = sum(R(N, x-1) + R(N, x-2) + ... R(N, x-N))
! 
! For this task we similarly define terms of the first 2..n-step Padovan
! sequences as:
! 
!    For n == 2:
!        start:      1, 1, 1
!        Recurrence: R(n, x) = R(n, x-2) + R(n, x-3); for n == 2
!    For n == N:
!        start:      First N + 1 terms of R(N-1, x)
!        Recurrence: R(N, x) = sum(R(N, x-2) + R(N, x-3) + ... R(N, x-N-1))
! 
! The initial values of the sequences are:
! 
!     
! 
!         {| style="text-align: left;" border="4" cellpadding="2"
!         cellspacing="2"
! 
! |+ Padovan n-step sequences |- style="background-color: rgb(255, 204,
! 255);" ! n !! Values !! OEIS Entry |- | 2 ||
! 1,1,1,2,2,3,4,5,7,9,12,16,21,28,37, ... || A134816: 'Padovan's spiral
! numbers' |- | 3 || 1,1,1,2,3,4,6,9,13,19,28,41,60,88,129, ... ||
! A000930: 'Narayana's cows sequence' |- | 4 ||
! 1,1,1,2,3,5,7,11,17,26,40,61,94,144,221, ... || A072465: 'A
! Fibonacci-like model in which each pair of rabbits dies after the birth
! of their 4th litter' |- | 5 || 1,1,1,2,3,5,8,12,19,30,47,74,116,182,286,
! ... || A060961: 'Number of compositions (ordered partitions) of n into
! 1's, 3's and 5's' |- | 6 || 1,1,1,2,3,5,8,13,20,32,51,81,129,205,326,
! ... || |- | 7 || 1,1,1,2,3,5,8,13,21,33,53,85,136,218,349, ... ||
! A117760: 'Expansion of 1/(1 - x - x^3 - x^5 - x^7)' |- | 8 ||
! 1,1,1,2,3,5,8,13,21,34,54,87,140,225,362, ... || |- |}
! 
! Task:
! 
! 1.  Write a function to generate the first t terms, of the first
!     2..max_n Padovan n-step number sequences as defined above.
! 2.  Use this to print and show here at least the first t=15 values of
!     the first 2..8 n-step sequences.
! 
! (The OEIS column in the table above should be omitted).

USING: compiler.tree.propagation.call-effect io kernel math
math.ranges prettyprint sequences ;

: padn ( m n -- seq )
    V{ "|" 1 1 1 } over prefix clone over 2 -
    [ dup last2 + suffix! ] times rot pick 1 + -
    [ dup length 1 - pick [ - ] keepd pick <slice> sum suffix! ]
    times nip ;

"Padovan n-step sequences" print
2 8 [a..b] [ 15 swap padn ] map simple-table.
