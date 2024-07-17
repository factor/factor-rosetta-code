! Let f be a uniformly-randomly chosen mapping from the numbers 1..N to
! the numbers 1..N (note: not necessarily a permutation of 1..N; the
! mapping could produce a number in more than one way or not at all). At
! some point, the sequence 1, f(1), f(f(1))... will contain a repetition,
! a number that occurring for the second time in the sequence.
! 
! Task:
! 
! Write a program or a script that estimates, for each N, the average
! length until the first such repetition.
! 
! Also calculate this expected length using an analytical formula, and
! optionally compare the simulated result with the theoretical one.
! 
! This problem comes from the end of Donald Knuth's Christmas tree lecture
! 2011.
! 
! Example of expected output:
! 
!      N    average    analytical    (error)
!     ===  =========  ============  =========
!       1     1.0000        1.0000  (  0.00%)
!       2     1.4992        1.5000  (  0.05%)
!       3     1.8784        1.8889  (  0.56%)
!       4     2.2316        2.2188  (  0.58%)
!       5     2.4982        2.5104  (  0.49%)
!       6     2.7897        2.7747  (  0.54%)
!       7     3.0153        3.0181  (  0.09%)
!       8     3.2429        3.2450  (  0.07%)
!       9     3.4536        3.4583  (  0.14%)
!      10     3.6649        3.6602  (  0.13%)
!      11     3.8091        3.8524  (  1.12%)
!      12     3.9986        4.0361  (  0.93%)
!      13     4.2074        4.2123  (  0.12%)
!      14     4.3711        4.3820  (  0.25%)
!      15     4.5275        4.5458  (  0.40%)
!      16     4.6755        4.7043  (  0.61%)
!      17     4.8877        4.8579  (  0.61%)
!      18     4.9951        5.0071  (  0.24%)
!      19     5.1312        5.1522  (  0.41%)
!      20     5.2699        5.2936  (  0.45%)

USING: formatting fry io kernel locals math math.factorials
math.functions math.ranges random sequences ;

: (analytical) ( m n -- x )
    [ drop factorial ] [ ^ /f ] [ - factorial / ] 2tri ;

: analytical ( n -- x )
    dup [1,b] [ (analytical) ] with map-sum ;

: loop-length ( n -- x )
    [ 0 0 1 [ 2dup bitand zero? ] ] dip
    '[ [ 1 + ] 2dip bitor 1 _ random shift ] while 2drop ;

:: average-loop-length ( n #tests -- x )
     0 #tests [ n loop-length + ] times #tests / ;

: stats ( n -- avg exp )
    [ 1,000,000 average-loop-length ] [ analytical ] bi ;

: .line ( n -- )
    dup stats 2dup / 1 - 100 *
    "%2d %8.4f %8.4f %6.3f%%\n" printf ;

" n\tavg\texp.\tdiff\n-------------------------------" print
20 [1,b] [ .line ] each
