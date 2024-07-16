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

( scratchpad ) CONSTANT: trits { t m f }
( scratchpad ) trits [ tnot ] map .
{ f m t }
( scratchpad ) trits [ trits swap [ tand ] curry map ] map .
{ { t m f } { m m f } { f f f } }
( scratchpad ) trits [ trits swap [ tor ] curry map ] map .
{ { t t t } { t m m } { t m f } }
( scratchpad ) trits [ trits swap [ txor ] curry map ] map .
{ { f m t } { m m m } { t m f } }
( scratchpad ) trits [ trits swap [ t= ] curry map ] map .
{ { t m f } { m m m } { f m t } }
