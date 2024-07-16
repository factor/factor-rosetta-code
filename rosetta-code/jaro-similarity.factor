! The Jaro distance is a measure of edit distance between two strings; its
! inverse, called the Jaro similarity, is a measure of two strings'
! similarity: the higher the value, the more similar the strings are. The
! score is normalized such that 0 equates to no similarities and 1 is an
! exact match.
! 
! ;Definition
! 
! The Jaro similarity d_(j) of two given strings s₁ and s₂ is
! 
!     $d_j = \left\{
! 
!     \begin{array}{l l}
!       0 & \text{if }m = 0\\
!       \frac{1}{3}\left(\frac{m}{|s_1|} + \frac{m}{|s_2|} + \frac{m-t}{m}\right) & \text{otherwise} \end{array} \right.$
! 
! Where:
! 
! -   m is the number of matching characters;
! -   t is half the number of transpositions.
! 
! Two characters from s₁ and s₂ respectively, are considered matching only
! if they are the same and not farther apart than
! $\left\lfloor\frac{\max(|s_1|,|s_2|)}{2}\right\rfloor-1$ characters.
! 
! Each character of s₁ is compared with all its matching characters in s₂.
! Each difference in position is half a transposition; that is, the number
! of transpositions is half the number of characters which are common to
! the two strings but occupy different positions in each one.
! 
! ;Example
! 
! Given the strings s₁ DWAYNE and s₂ DUANE we find:
! 
! -   m = 4
! -   |s₁| = 6
! -   |s₂| = 5
! -   t = 0
! 
! We find a Jaro score of:
! 
!     $d_j = \frac{1}{3}\left(\frac{4}{6} + \frac{4}{5} + \frac{4-0}{4}\right) = 0.822$
! 
! Task
! 
! Implement the Jaro algorithm and show the similarity scores for each of
! the following pairs:
! 
! -   ("MARTHA", "MARHTA")
! -   ("DIXON", "DICKSONX")
! -   ("JELLYFISH", "SMELLYFISH")
! 
! See also
! 
! -   Jaro–Winkler distance on Wikipedia.

USING: formatting fry generalizations kernel locals make math
math.order sequences sequences.extras ;
IN: rosetta-code.jaro-distance

: match? ( s1 s2 n -- ? )
    [ pick nth swap indices nip ] [ 2nip ]
    [ drop [ length ] bi@ max 2/ 1 - ] 3tri
    '[ _ - abs _ <= ] any? ;

: matches ( s1 s2 -- seq )
    over length <iota> [
        [ [ nip swap nth ] [ match? ] 3bi [ , ] [ drop ] if ]
        2with each
    ] "" make ;

: transpositions ( s1 s2 -- n )
    2dup swap [ matches ] 2bi@ [ = not ] 2count 2/ ;

:: jaro ( s1 s2 -- x )
    s1 s2 matches length :> m
    s1 length            :> |s1|
    s2 length            :> |s2|
    s1 s2 transpositions :> t
    m zero? [ 0 ] [ m |s1| / m |s2| / m t - m / + + 1/3 * ] if ;

: jaro-demo ( -- )
    "DWAYNE" "DUANE"
    "MARTHA" "MARHTA"
    "DIXON" "DICKSONX"
    "JELLYFISH" "SMELLYFISH" [
        2dup jaro dup >float "%u %u jaro -> %u (~%.5f)\n" printf
    ] 2 4 mnapply ;

MAIN: jaro-demo
