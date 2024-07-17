! In logic, a three-valued logic (also trivalent, ternary, or trinary
! logic, sometimes abbreviated 3VL) is any of several many-valued logic
! systems in which there are three truth values indicating true, false and
! some indeterminate third value.
! 
! This is contrasted with the more commonly known bivalent logics (such as
! classical sentential or boolean logic) which provide only for true and
! false.
! 
! Conceptual form and basic ideas were initially created by Łukasiewicz,
! Lewis and Sulski.
! 
! These were then re-formulated by Grigore Moisil in an axiomatic
! algebraic form, and also extended to n-valued logics in 1945.
! 
! +----------------------+----------------------+----------------------+
! |   ¬                  |   ∧       T          |   ∨                  |
! |   -------            | rue    Maybe   False | True   Maybe   False |
! |   True               |   ------- ---        |   ------- --         |
! |   Maybe              | ---- ------- ------- | ---- ------- ------- |
! |   False              |   True    T          |   True               |
! |                      | rue    Maybe   False |  True   True    True |
! |   : not a            |   Maybe   M          |   Maybe              |
! |                      | aybe   Maybe   False | True   Maybe   Maybe |
! |                      |   False   F          |   False              |
! |                      | alse   False   False | True   Maybe   False |
! |                      |                      |                      |
! |                      |   : a and b          |   : a or b           |
! +----------------------+----------------------+----------------------+
! |   ⊃                  |   ≡       T          |                      |
! | True   Maybe   False | rue    Maybe   False |                      |
! |   ------- --         |   ------- ---        |                      |
! | ---- ------- ------- | ---- ------- ------- |                      |
! |   True               |   True    T          |                      |
! | True   Maybe   False | rue    Maybe   False |                      |
! |   Maybe              |   Maybe   M          |                      |
! | True   Maybe   Maybe | aybe   Maybe   Maybe |                      |
! |   False              |   False              |                      |
! |  True   True    True | False   Maybe   True |                      |
! |                      |                      |                      |
! |   : if a then b      |   : a is equivalent  |                      |
! |                      |   to b               |                      |
! +----------------------+----------------------+----------------------+
! 
! : Example Ternary Logic Operators in Truth Tables:
! 
! Task:
! 
! -   Define a new type that emulates ternary logic by storing data trits.
! -   Given all the binary logic operators of the original programming
!     language, reimplement these operators for the new Ternary logic type
!     trit.
! -   Generate a sampling of results using trit variables.
! -   Kudos for actually thinking up a test case algorithm where ternary
!     logic is intrinsically useful, optimises the test case algorithm and
!     is preferable to binary logic.
! 
! Note: Setun (Сетунь) was a balanced ternary computer developed in 1958
! at Moscow State University. The device was built under the lead of
! Sergei Sobolev and Nikolay Brusentsov. It was the only modern ternary
! computer, using three-valued ternary logic

! rosettacode/ternary/ternary.factor
! http://rosettacode.org/wiki/Ternary_logic
USING: combinators kernel ;
IN: rosettacode.ternary

SINGLETON: m
UNION: trit t m POSTPONE: f ;

GENERIC: >trit ( object -- trit )
M: trit >trit ;

: tnot ( trit1 -- trit )
    >trit { { t [ f ] } { m [ m ] } { f [ t ] } } case ;

: tand ( trit1 trit2 -- trit )
    >trit {
        { t [ >trit ] }
        { m [ >trit { { t [ m ] } { m [ m ] } { f [ f ] } } case ] }
        { f [ >trit drop f ] }
    } case ;

: tor ( trit1 trit2 -- trit )
    >trit {
        { t [ >trit drop t ] }
        { m [ >trit { { t [ t ] } { m [ m ] } { f [ m ] } } case ] }
        { f [ >trit ] }
    } case ;

: txor ( trit1 trit2 -- trit )
    >trit {
        { t [ tnot ] }
        { m [ >trit drop m ] }
        { f [ >trit ] }
    } case ;

: t= ( trit1 trit2 -- trit )
    {
        { t [ >trit ] }
        { m [ >trit drop m ] }
        { f [ tnot ] }
    } case ;
