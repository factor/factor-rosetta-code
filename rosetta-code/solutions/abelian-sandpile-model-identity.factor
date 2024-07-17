! Our sandpiles are based on a 3 by 3 rectangular grid giving nine areas
! that contain a number from 0 to 3 inclusive. (The numbers are said to
! represent grains of sand in each area of the sandpile).
! 
! E.g. s1 =
! 
!         
!         1 2 0
!         2 1 1
!         0 1 3
! 
! and s2 =
! 
!         2 1 3
!         1 0 1
!         0 1 0
! 
! Addition on sandpiles is done by adding numbers in corresponding grid
! areas, so for the above:
! 
!                   1 2 0     2 1 3     3 3 3
!         s1 + s2 = 2 1 1  +  1 0 1  =  3 1 2
!                   0 1 3     0 1 0     0 2 3
! 
! If the addition would result in more than 3 "grains of sand" in any area
! then those areas cause the whole sandpile to become "unstable" and the
! sandpile areas are "toppled" in an "avalanche" until the "stable" result
! is obtained.
! 
! Any unstable area (with a number >= 4), is "toppled" by loosing one
! grain of sand to each of its four horizontal or vertical neighbours.
! Grains are lost at the edge of the grid, but otherwise increase the
! number in neighbouring cells by one, whilst decreasing the count in the
! toppled cell by four in each toppling.
! 
! A toppling may give an adjacent area more than four grains of sand
! leading to a chain of topplings called an "avalanche". E.g.
! 
!         
!         4 3 3     0 4 3     1 0 4     1 1 0     2 1 0
!         3 1 2 ==> 4 1 2 ==> 4 2 2 ==> 4 2 3 ==> 0 3 3
!         0 2 3     0 2 3     0 2 3     0 2 3     1 2 3
! 
! The final result is the stable sandpile on the right.
! 
! Note: The order in which cells are toppled does not affect the final
! result.
! 
! Task:
! 
! -   Create a class or datastructure and functions to represent and
!     operate on sandpiles.
! -   Confirm the result of the avalanche of topplings shown above
! -   Confirm that s1 + s2 == s2 + s1 # Show the stable results
! -   If s3 is the sandpile with number 3 in every grid area, and s3_id is
!     the following sandpile:
! 
!         2 1 2  
!         1 0 1  
!         2 1 2
! 
! -   Show that s3 + s3_id == s3
! -   Show that s3_id + s3_id == s3_id
! 
! Show confirming output here, with your examples.
! 
! References:
! 
! -   https://www.youtube.com/watch?v=1MtEUErz7Gg
! -   https://en.wikipedia.org/wiki/Abelian_sandpile_model

USING: arrays grouping io kernel math math.vectors prettyprint
qw sequences ;

CONSTANT: neighbors {
    { 1 3 } { 0 2 4 } { 1 5 } { 0 4 6 } { 1 3 5 7 }
    { 2 4 8 } { 3 7 } { 4 6 8 } { 5 7 }
}

! Sandpile words
: find-tall ( seq -- n ) [ 3 > ] find drop ;
: tall? ( seq -- ? ) find-tall >boolean ;
: distribute ( ind seq -- ) [ [ 1 + ] change-nth ] curry each ;
: adjacent ( n seq -- ) [ neighbors nth ] dip distribute ;
: shrink ( n seq -- ) [ 4 - ] change-nth ;
: (topple) ( n seq -- ) [ shrink ] [ adjacent ] 2bi ;
: topple ( seq -- seq' ) [ find-tall ] [ (topple) ] [ ] tri ;
: avalanche ( seq -- ) [ dup tall? ] [ topple ] while drop ;
: s+ ( seq1 seq2 -- seq3 ) v+ dup avalanche ;

! Output words
: mappend ( seq1 seq2 -- seq3 ) [ flip ] bi@ append flip ;
: sym ( seq str -- seq ) 1array " " 1array tuck 3array mappend ;
: arrow ( seq -- new-seq ) ">" sym ;
: plus  ( seq -- new-seq ) "+" sym ;
: eq    ( seq -- new-seq ) "=" sym ;
: topple> ( seq seq -- seq seq ) arrow over topple 3 group mappend ;
: (.s+) ( seq seq seq -- seq ) [ plus ] [ mappend eq ] [ mappend ] tri* ;
: .s+ ( seq1 seq2 -- ) 2dup s+ [ 3 group ] tri@ (.s+) simple-table. ;

! Task
CONSTANT: s1 { 1 2 0 2 1 1 0 1 3 }
CONSTANT: s2 { 2 1 3 1 0 1 0 1 0 }
CONSTANT: s3 { 3 3 3 3 3 3 3 3 3 }
CONSTANT: id { 2 1 2 1 0 1 2 1 2 }

"Avalanche:" print nl
{ 4 3 3 3 1 2 0 2 3 }
dup 3 group topple> topple> topple> topple> nip simple-table. nl

"s1 + s2 = s2 + s1" print nl
s1 s2 .s+ nl s2 s1 .s+ nl

"s3 + s3_id = s3" print nl
s3 id .s+ nl

"s3_id + s3_id = s3_id" print nl
id id .s+
