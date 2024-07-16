! Write a program that accepts a name as input and outputs the lyrics to
! the Shirley Ellis song "The Name Game".
! 
! The regular verse
! 
! Unless your name begins with a vowel (A, E, I, O, U), 'B', 'F' or 'M'
! you don't have to care about special rules. The verse for the name
! 'Gary' would be like this:
! 
!    Gary, Gary, bo-bary
!    Banana-fana fo-fary
!    Fee-fi-mo-mary
!    Gary! 
! 
! At the end of every line, the name gets repeated without the first
! letter: Gary becomes ary If we take (X) as the full name (Gary) and (Y)
! as the name without the first letter (ary) the verse would look like
! this:
! 
!    (X), (X), bo-b(Y)
!    Banana-fana fo-f(Y)
!    Fee-fi-mo-m(Y)
!    (X)! 
! 
! Vowel as first letter of the name
! 
! If you have a vowel as the first letter of your name (e.g. Earl) you do
! not truncate the name. The verse looks like this:
! 
!    Earl, Earl, bo-bearl
!    Banana-fana fo-fearl
!    Fee-fi-mo-mearl
!    Earl! 
! 
! 'B', 'F' or 'M' as first letter of the name
! 
! In case of a 'B', an 'F' or an 'M' (e.g. Billy, Felix, Mary) there is a
! special rule. The line which would 'rebuild' the name (e.g. bo-billy) is
! sung without the first letter of the name. The verse for the name Billy
! looks like this:
! 
!    Billy, Billy, bo-illy
!    Banana-fana fo-filly
!    Fee-fi-mo-milly
!    Billy! 
! 
! For the name 'Felix', this would be right:
! 
!    Felix, Felix, bo-belix
!    Banana-fana fo-elix
!    Fee-fi-mo-melix
!    Felix!

USING: ascii combinators interpolate io kernel locals
pair-rocket qw sequences ;
IN: rosetta-code.name-game

: vowel? ( char -- ? ) "AEIOU" member? ;

:: name-game ( Name -- )

    Name first  :> L
    Name >lower :> name! L vowel? [ name rest name! ] unless
    "b"         :> B!
    "f"         :> F!
    "m"         :> M!
    
    L { CHAR: B => [ "" B! ]
        CHAR: F => [ "" F! ]
        CHAR: M => [ "" M! ] [ drop ] } case

[I ${Name}, ${Name}, bo-${B}${name}
Banana-fana fo-${F}${name}
Fee-fi-mo-${M}${name}
${Name}!I] nl nl ;

qw{ Gary Earl Billy Felix Milton Steve } [ name-game ] each
