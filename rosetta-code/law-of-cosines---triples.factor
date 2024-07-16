! The Law of cosines states that for an angle γ, (gamma) of any triangle,
! if the sides adjacent to the angle are A and B and the side opposite is
! C; then the lengths of the sides are related by this formula:
! 
!            A² + B² - 2ABcos(γ) = C² 
! 
! Specific angles:
! 
! For an angle of of 90º this becomes the more familiar "Pythagoras
! equation":
! 
!            A² + B² = C²           
! 
! For an angle of 60º this becomes the less familiar equation:
! 
!            A² + B² - AB = C²       
! 
! And finally for an angle of 120º this becomes the equation:
! 
!            A² + B² + AB = C²      
! 
! Task:
! 
! -   Find all integer solutions (in order) to the three specific cases,
!     distinguishing between each angle being considered.
! -   Restrain all sides to the integers 1..13 inclusive.
! -   Show how many results there are for each of the three angles
!     mentioned above.
! -   Display results on this page.
! 
! Note: Triangles with the same length sides but different order are to be
! treated as the same.
! 
! Optional Extra credit:
! 
! -   How many 60° integer triples are there for sides in the range
!     1..10_000 where the sides are not all of the same length.
! 
! Related Task
! 
! -   Pythagorean triples
! 
! See also:
! 
! -   Visualising Pythagoras: ultimate proofs and crazy contortions
!     Mathlogger Video

USING: backtrack formatting kernel locals math math.ranges
sequences sets sorting ;
IN: rosetta-code.law-of-cosines

:: triples ( quot -- seq )
    [
        V{ } clone :> seen        
        13 [1,b] dup dup [ amb-lazy ] tri@ :> ( a b c )
        a sq b sq + a b quot call( x x x -- x ) c sq =
        { b a c } seen member? not and
        must-be-true { a b c } dup seen push
    ] bag-of ;

: show-solutions ( quot angle -- )
    [ triples { } like dup length ] dip rot
    "%d solutions for %d degrees:\n%u\n\n" printf ;

[ * + ] 120
[ 2drop 0 - ] 90
[ * - ] 60 [ show-solutions ] 2tri@
