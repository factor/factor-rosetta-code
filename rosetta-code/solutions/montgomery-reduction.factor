! Implement the Montgomery reduction algorithm, as explained in "Handbook
! of Applied Cryptography, Section 14.3.2, page 600. Montgomery reduction
! calculates TR⁻¹modm, without having to divide by m.
! 
! -   Let M be a positive integer, and R and T integers such that R > m,
!     gcd(m, R) = 1, and 0 ≤ T < mR.
! -   R is usually chosen as b^(n), where b = base (radix) in which the
!     numbers in the calculation as represented in (so b = 10 in ‘normal’
!     paper arithmetic, b = 2 for computer implementations) and n = number
!     of digits in base m
! -   The numbers m (n digits long), T (2n digits long), R, b, n are known
!     entities, a number m′ (often represented as m_dash in code) =
!     −m⁻¹modb is precomputed.
! 
! See the Handbook of Applied Cryptography for brief introduction to
! theory and numerical example in radix 10. Individual chapters of the
! book can be viewed online as provided by the authors. The said algorithm
! can be found at 1 at page 600 (page 11 of pdf file)
! 
! Algorithm:
! 
! A ← T (temporary variable)
! For i from 0 to (n-1) do the following:
!    u_(i) ← a_(i)* m' mod b      // a_(i) is the ith digit of A, u_(i) is a single digit number in radix b
!    A ← A + u_(i)*m*b^(i)
! A ← A/b^(n)
! if A >= m,
!    A ← A - m
! Return (A)

USING: io kernel locals math math.bitwise math.functions
prettyprint ;

: montgomery-reduce ( m a -- n )
    over bit-length [ dup odd? [ over + ] when 2/ ] times
    swap mod ;

CONSTANT: m 750791094644726559640638407699
CONSTANT: t1 323165824550862327179367294465482435542970161392400401329100

CONSTANT: r1 440160025148131680164261562101
CONSTANT: r2 435362628198191204145287283255

CONSTANT: x1 540019781128412936473322405310
CONSTANT: x2 515692107665463680305819378593

"Original x1:       " write x1 .
"Recovered from r1: " write m r1 montgomery-reduce .
"Original x2:       " write x2 .
"Recovered from r2: " write m r2 montgomery-reduce .

nl "Montgomery computation of x1^x2 mod m:    " write

[let
    m t1 x1 / montgomery-reduce :> prod!
    m t1 montgomery-reduce :> base!
    x2 :> exponent!

    [ exponent zero? ] [
        exponent odd?
        [ m prod base * montgomery-reduce prod! ] when
        m base sq montgomery-reduce base! exponent 2/ exponent!
    ] until

    m prod montgomery-reduce .
    "Library-based computation of x1^x2 mod m: " write
    x1 x2 m ^mod .
]
