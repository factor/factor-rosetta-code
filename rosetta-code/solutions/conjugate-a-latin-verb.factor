! Task: Create a program that can take a Latin verb and conjugate it, displaying in the following order:
! 
!     1st person singular
!     2nd person singular
!     3rd person singular
!     1st person plural
!     2nd person plural
!     3rd person plural
! 
! -   Each should be on its own line.
! -   Have at least one example from each of the 4 conjugations.
! -   Irregular verbs are not required.
! -   Translation into English is optional.
! 
! See also:
! 
! -   Wikipedia: Latin conjugation.
! 
! Category: String manipulation Category:Simple

USING: formatting io kernel math qw sequences ;

CONSTANT: pronouns {
    "I"
    "you"
    "he, she, it"
    "we"
    "you all"
    "they"
}

CONSTANT: endings qw{ ō ās at āmus ātis ant }

: first-conjugation? ( str -- ? )
    qw{ are āre } [ tail? ] with any? ;

: check-first-conjugation ( str -- )
    first-conjugation?
    [ "Input must end with 'are' or 'āre'." throw ] unless ;

: check-length ( str -- )
    length 3 >
    [ "Input too short to conjugate." throw ] unless ;

: check-input ( str -- )
    [ check-first-conjugation ] [ check-length ] bi ;

: conjugate ( str -- seq )
    dup check-input 3 head* endings [ append ] with map ;

: he/she/it ( str -- newstr )
    "s" append dup dup "he %s, she %s, it %s" sprintf ;

: english ( str -- seq )
    pronouns [ 2 = [ nip he/she/it ] [ " " glue ] if ] with
    map-index ;

:: conjugate. ( la en -- )
    la en "Present active indicative conjugations of %s (%s):\n"
    printf la conjugate en english [ "  %-10s%s\n" printf ] 2each ;

"amāre" "love" conjugate. nl
"dāre" "give" conjugate.
