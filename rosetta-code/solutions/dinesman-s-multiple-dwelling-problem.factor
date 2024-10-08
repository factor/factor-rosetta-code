! Task
! 
! Solve Dinesman's multiple dwelling problem but in a way that most
! naturally follows the problem statement given below.
! 
! Solutions are allowed (but not required) to parse and interpret the
! problem text, but should remain flexible and should state what changes
! to the problem text are allowed. Flexibility and ease of expression are
! valued.
! 
! Examples may be be split into "setup", "problem statement", and "output"
! sections where the ease and naturalness of stating the problem and
! getting an answer, as well as the ease and flexibility of modifying the
! problem are the primary concerns.
! 
! Example output should be shown here, as well as any comments on the
! examples flexibility.
! 
! The problem
! 
! Baker, Cooper, Fletcher, Miller, and Smith live on different floors of
! an apartment house that contains only five floors.
! 
! -   -   Baker does not live on the top floor.
!     -   Cooper does not live on the bottom floor.
!     -   Fletcher does not live on either the top or the bottom floor.
!     -   Miller lives on a higher floor than does Cooper.
!     -   Smith does not live on a floor adjacent to Fletcher's.
!     -   Fletcher does not live on a floor adjacent to Cooper's.
! 
! Where does everyone live?

USING: kernel
    combinators.short-circuit
    math math.combinatorics math.ranges 
    sequences
    qw prettyprint ;
IN: rosetta.dinesman
 
: /= ( x y -- ? ) = not ;
: fifth ( seq -- elt ) 4 swap nth ;
  
: meets-constraints? ( seq -- ? )
    {  
        [ first 5 /= ]                          ! Baker does not live on the top floor.   
        [ second 1 /= ]                         ! Cooper does not live on the bottom floor.
        [ third { 1 5 } member? not ]           ! Fletcher does not live on either the top or bottom floor.
        [ [ fourth ] [ second ] bi > ]          ! Miller lives on a higher floor than does Cooper.
        [ [ fifth ] [ third ] bi - abs 1 /= ]   ! Smith does not live on a floor adjacent to Fletcher's.
        [ [ third ] [ second ] bi - abs 1 /= ]  ! Fletcher does not live on a floor adjacent to Cooper's.
    } 1&& ;
 
: solutions ( -- seq )
    5 [1,b] all-permutations [ meets-constraints? ] filter ;
    
: >names ( seq -- seq )
     [ qw{ baker cooper fletcher miller smith } nth swap 2array ] map-index ;

: dinesman ( -- )
    solutions [ >names . ] each ;
