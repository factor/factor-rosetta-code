! The numerical rank of competitors in a competition shows if one is
! better than, equal to, or worse than another based on their results in a
! competition.
! 
! The numerical rank of a competitor can be assigned in several different
! ways.
! 
! Task:
! 
! The following scores are accrued for all competitors of a competition
! (in best-first order):
! 
!     44 Solomon
!     42 Jason
!     42 Errol
!     41 Garry
!     41 Bernard
!     41 Barry
!     39 Stephen
! 
! For each of the following ranking methods, create a
! function/method/procedure/subroutine... that applies the ranking method
! to an ordered list of scores with scorers:
! 
! 1.  Standard. (Ties share what would have been their first ordinal
!     number).
! 2.  Modified. (Ties share what would have been their last ordinal
!     number).
! 3.  Dense. (Ties share the next available integer).
! 4.  Ordinal. ((Competitors take the next available integer. Ties are not
!     treated otherwise).
! 5.  Fractional. (Ties share the mean of what would have been their
!     ordinal numbers).
! 
! See the wikipedia article for a fuller description.
! 
! Show here, on this page, the ranking of the test scores under each of
! the numbered ranking methods.
! 
! Category:Sorting

USING: arrays assocs formatting fry generalizations io kernel
math math.ranges math.statistics math.vectors sequences
splitting.monotonic ;
IN: rosetta-code.ranking

CONSTANT: ranks {
    { 44 "Solomon" } { 42 "Jason" } { 42 "Errol" }
    { 41 "Garry" } { 41 "Bernard" } { 41 "Barry" }
    { 39 "Stephen" }
}

: rank ( seq quot -- seq' )
    '[ [ = ] monotonic-split [ length ] map dup @ [ <array> ]
    2map concat ] call ; inline

: standard ( seq -- seq' ) [ cum-sum0 1 v+n ] rank ;
: modified ( seq -- seq' ) [ cum-sum ] rank ;
: dense    ( seq -- seq' ) [ length [1,b] ] rank ;
: ordinal  ( seq -- seq' ) length [1,b] ;

: fractional ( seq -- seq' )
    [ dup cum-sum swap [ dupd - [a,b) mean ] 2map ] rank ;

: .rank ( quot -- )
    [ ranks dup keys ] dip call swap
    [ first2 "%5u %d %s\n" printf ] 2each ; inline

: ranking-demo ( -- )
    "Standard ranking"   [ standard   ]
    "Modified ranking"   [ modified   ]
    "Dense ranking"      [ dense      ]
    "Ordinal ranking"    [ ordinal    ]
    "Fractional ranking" [ fractional ]
    [ [ print ] [ .rank nl ] bi* ] 2 5 mnapply ;

MAIN: ranking-demo
