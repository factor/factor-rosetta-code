! There are several ways to generate a self-referential sequence. One very
! common one (the Look-and-say sequence) is to start with a positive
! integer, then generate the next term by concatenating enumerated groups
! of adjacent alike digits:
! 
!        0, 10, 1110, 3110, 132110, 1113122110, 311311222110 ...
! 
! The terms generated grow in length geometrically and never converge.
! 
! Another way to generate a self-referential sequence is to summarize the
! previous term.
! 
! Count how many of each alike digit there is, then concatenate the sum
! and digit for each of the sorted enumerated digits. Note that the first
! five terms are the same as for the previous sequence.
! 
!        0, 10, 1110, 3110, 132110, 13123110, 23124110 ... 
! 
! Sort the digits largest to smallest. Do not include counts of digits
! that do not appear in the previous term.
! 
! Depending on the seed value, series generated this way always either
! converge to a stable value or to a short cyclical pattern. (For our
! purposes, I'll use converge to mean an element matches a previously seen
! element.) The sequence shown, with a seed value of 0, converges to a
! stable value of 1433223110 after 11 iterations. The seed value that
! converges most quickly is 22. It goes stable after the first element.
! (The next element is 22, which has been seen before.)
! 
! Task:
! 
! Find all the positive integer seed values under 1000000, for the above
! convergent self-referential sequence, that takes the largest number of
! iterations before converging. Then print out the number of iterations
! and the sequence they return. Note that different permutations of the
! digits of the seed will yield the same sequence. For this task, assume
! leading zeros are not permitted.
! 
!     Seed Value(s): 9009 9090 9900
! 
!     Iterations: 21 
! 
!     Sequence: (same for all three seeds except for first element)
!     9009
!     2920
!     192210
!     19222110
!     19323110
!     1923123110
!     1923224110
!     191413323110
!     191433125110
!     19151423125110
!     19251413226110
!     1916151413325110
!     1916251423127110
!     191716151413326110
!     191726151423128110
!     19181716151413327110
!     19182716151423129110
!     29181716151413328110
!     19281716151423228110
!     19281716151413427110
!     19182716152413228110
! 
! Related tasks:
! 
! -   Fours is the number of letters in the ...
! -   Look-and-say sequence
! -   Number names
! -   Self-describing numbers
! -   Spelling of ordinal numbers
! 
! Also see:
! 
! -   The On-Line Encyclopedia of Integer Sequences.

USING: assocs grouping io kernel math math.combinatorics
math.functions math.ranges math.statistics math.text.utils
prettyprint sequences sets ;
IN: rosetta-code.self-referential-sequence

: next-term ( seq -- seq ) histogram >alist concat ;

! Output the self-referential sequence, given a seed value.
: srs ( seq -- seq n )
    V{ } clone [ 2dup member? ] [ 2dup push [ next-term ] dip ]
    until nip dup length ;

: digit-before? ( m n -- ? ) dup zero? [ 2drop t ] [ <= ] if ;

! The numbers from 1 rto n sans permutations.
: candidates ( n -- seq )
    [1,b] [ 1 digit-groups reverse ] map
    [ [ digit-before? ] monotonic? ] filter ;

: max-seed ( n -- seq ) candidates [ srs nip ] supremum-by ;

: max-seeds ( n -- seq )
    max-seed <permutations> members [ first zero? ] reject ;

: digits>number ( seq -- n ) [ 10^ * ] map-index sum ;

: >numbers ( seq -- seq ) [ digits>number ] map ;

: main ( -- )
    "Seed value(s): " write
    1,000,000 max-seeds
    [ [ reverse ] map >numbers . ]
    [ first srs ] bi
    "Iterations: " write .
    "Sequence:" print >numbers . ;

MAIN: main
