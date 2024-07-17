! Task:
! 
! Display the complete lyrics for the song: 99 Bottles of Beer on the
! Wall.
! 
! The beer song:
! 
! The lyrics follow this form:
! 
!   
! 
!       
! 
!           99 bottles of beer on the wall
!           99 bottles of beer
!           Take one down, pass it around
!           98 bottles of beer on the wall
! 
!       
! 
!           98 bottles of beer on the wall
!           98 bottles of beer
!           Take one down, pass it around
!           97 bottles of beer on the wall
! 
! ... and so on, until reaching 0 (zero).
! 
! Grammatical support for 1 bottle of beer is optional.
! 
! As with any puzzle, try to do it in as creative/concise/comical a way as
! possible (simple, obvious solutions allowed, too).
! 
! See also:
! 
! -   http://99-bottles-of-beer.net/
! -   :Category:99_Bottles_of_Beer
! -   :Category:Programming language families
! -   Wikipedia 99 bottles of beer

USING: io kernel make math math.parser math.ranges sequences ;

: bottle ( -- quot )
    [
        [
            [
                [ # " bottles of beer on the wall,\n" % ]
                [ # " bottles of beer.\n" % ] bi
            ] keep
            "Take one down, pass it around,\n" %
            1 - # " bottles of beer on the wall\n" %
        ] " " make print
    ] ; inline

: last-verse ( -- )
    "Go to the store and buy some more," 
    "no more bottles of beer on the wall!" [ print ] bi@ ;

: bottles ( n -- )
    1 [a,b] bottle each last-verse ;

! Usage: 99 bottles
