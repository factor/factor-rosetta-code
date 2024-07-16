! The Partition Function P is the function P(n), where n∈ℤ, defined as the
! number of distinct ways in which n can be expressed as the sum of
! non-increasing positive integers.
! 
! Example:
! 
!  P(4) = 5   because   4 = Σ(4) = Σ(3,1) = Σ(2,2) = Σ(2,1,1) = Σ(1,1,1,1)
! 
! P(n) can be expressed as the recurrence relation:
! 
!  P(n) = P(n-1) +P(n-2) -P(n-5) -P(n-7) +P(n-12) +P(n-15) -P(n-22) -P(n-26) +P(n-35) +P(n-40) ...
! 
! The successive numbers in the above equation have the differences: 1, 3,
! 2, 5, 3, 7, 4, 9, 5, 11, 6, 13, 7, 15, 8 ...
! 
! This task may be of popular interest because Mathologer made the video,
! The hardest "What comes next?" (Euler's pentagonal formula), where he
! asks the programmers among his viewers to calculate P(666). The video
! was viewed more than 100,000 times in the first couple of weeks after
! its release.
! 
! In Wolfram Language, this function has been implemented as PartitionsP.
! 
! Task:
! 
! Write a function which returns the value of PartitionsP(n). Solutions
! can be iterative or recursive.
! 
! Bonus task: show how long it takes to compute PartitionsP(6666).
! 
! References:
! 
! -   The hardest "What comes next?" (Euler's pentagonal formula) The
!     explanatory video by Mathologer that makes this task a popular
!     interest.
! -   Partition Function P Mathworld entry for the Partition function.
! -   Partition function (number theory) Wikipedia entry for the Partition
!     function.
! 
! Related tasks:
! 
! -   9 billion names of God the integer

USING: kernel lists lists.lazy math sequences sequences.extras ;

! Compute the nth pentagonal number.
: penta ( n -- m ) [ sq 3 * ] [ - 2/ ] bi ;

! An infinite lazy list of indices to add and subtract in the
! sequence of partitions to find the next P.
: seq ( -- list )
    1 lfrom [ penta 1 - ] <lazy-map> 1 lfrom [ neg penta 1 - ]
    <lazy-map> lmerge ;

! Reduce a sequence by adding two, subtracting two, adding two,
! etc...
: ++-- ( seq -- n ) 0 [ 2/ odd? [ - ] [ + ] if ] reduce-index ;

! Find the next member of the partitions sequence.
: step ( seq pseq -- seq 'pseq )
    dup length [ < ] curry pick swap take-while over <reversed>
    nths ++-- suffix! ;

: partitions ( m -- n )
    [ seq swap [ <= ] curry lwhile list>array ]
    [ V{ 1 } clone swap [ step ] times last nip ] bi ;
