! Cipolla's algorithm
! 
! Solve x² ≡ n (mod p)
! 
! In computational number theory, Cipolla's algorithm is a technique for
! solving an equation of the form x² ≡ n (mod p), where p is an odd prime
! and x ,n ∊ Fp = {0, 1, ... p-1}.
! 
! To apply the algorithm we need the Legendre symbol, and arithmetic in
! Fp².
! 
! Legendre symbol
! 
! -   The Legendre symbol ( a | p) denotes the value of a ^ ((p-1)/2) (mod
!     p)
! -   (a | p) ≡ 1 if a is a square (mod p)
! -   (a | p) ≡ -1 if a is not a square (mod p)
! -   (a | p) ≡ 0 is a ≡ 0
! 
! Arithmetic in Fp²
! 
! Let ω a symbol such as ω² is a member of Fp and not a square, x and y
! members of Fp. The set Fp² is defined as {x + ω y }. The subset { x + 0
! ω} of Fp² is Fp. Fp² is somewhat equivalent to the field of complex
! number, with ω analoguous to i, and i² = -1 . Remembering that all
! operations are modulo p, addition, multiplication and exponentiation in
! Fp² are defined as :
! 
! -   (x1 + ω y1) + (x2 + ω y2) := (x1 + x2 + ω (y1 + y2))
! -   (x1 + ω y1) * (x2 + ω y2) := (x1*x2 + y1*y2*ω²) + ω (x1*y2 + x2*y1)
!     -   (0 + ω) * (0 + ω) := (ω² + 0 ω) ≡ ω² in Fp
! -   (x1 + ω y1) ^ n := (x + ω y) * (x + ω y) * ... ( n times) (1)
! 
! Algorithm pseudo-code
! 
! -   Input : p an odd prime, and n ≠ 0 in Fp
! -   Step 0. Check that n is indeed a square : (n | p) must be ≡ 1
! -   Step 1. Find, by trial and error, an a > 0 such as (a² - n) is not a
!     square : (a²-n | p) must be ≡ -1.
! -   Step 2. Let ω² = a² - n. Compute, in Fp2 : (a + ω) ^ ((p + 1)/2)
!     (mod p)
! 
! To compute this step, use a pair of numbers, initially [a,1], and use
! repeated "multiplication" which is defined such that [c,d] times [e,f]
! is (mod p) [ c*c + ω²*f*f, d*e + c*f ].
! 
! -   Step 3. Check that the result is ≡ x + 0 * ω in Fp2, that is x in
!     Fp.
! -   Step 4. Output the two positive solutions, x and p - x (mod p).
! -   Step 5. Check that x * x ≡ n (mod p)
! 
! Example from Wikipedia
! 
!     n := 10 , p := 13
!     Legendre(10,13) → 1         // 10 is indeed a square
!     a := 2                      // try
!     ω² := a*a - 10             // ≡ 7 ≡ -6
!     Legendre (ω² , 13) → -1    // ok - not square
!     (2 + ω) ^ 7 → 6 + 0 ω      // by modular exponentiation (1)
!                                 // 6 and (13 - 6) = 7 are solutions
!     (6 * 6) % 13 → 10           // = n . Checked.
! 
! Task
! 
! Implement the above.
! 
! Find solutions (if any) for
! 
! -   n = 10 p = 13
! -   n = 56 p = 101
! -   n = 8218 p = 10007
! -   n = 8219 p = 10007
! -   n = 331575 p = 1000003
! 
! Extra credit
! 
! -   n 665165880 p 1000000007
! -   n 881398088036 p 1000000000039
! -   n = 34035243914635549601583369544560650254325084643201 p = 10^50 +
!     151
! 
! See also:
! 
! -   Modular exponentiation
! -   Tonelli-Shanks algorithm

USING: accessors assocs interpolate io kernel literals locals
math math.extras math.functions ;

TUPLE: point x y ;
C: <point> point

:: (cipolla) ( n p -- m )
    0 0 :> ( a! ω2! )
    [ ω2 p legendere -1 = ]
    [ a sq n - p rem ω2! a 1 + a! ] do until a 1 - a!

    [| a b |
        a x>> b x>> * a y>> b y>> ω2 * * + p mod
        a x>> b y>> * b x>> a y>> * + p mod <point>
    ] :> [mul]

    1 0 <point> :> r!
    a 1 <point> :> s!
    p 1 + -1 shift :> n!

    [ n 0 > ] [
        n odd? [ r s [mul] call r! ] when
        s s [mul] call s!
        n -1 shift n!
    ] while

    r y>> zero? r x>> f ? ;
     

: cipolla ( n p -- m/f )
    2dup legendere 1 = [ (cipolla) ] [ 2drop f ] if ;

! Task
{
    { 10 13 }
    { 56 101 }
    { 8218 10007 }
    { 8219 10007 }
    { 331575 1000003 }
    { 665165880 1000000007 }
    { 881398088036 1000000000039 }
    ${
        34035243914635549601583369544560650254325084643201
        10 50 ^ 151 +
    }
}
[
    2dup cipolla
    [ 2dup - [I Roots of ${3} are (${1} ${0}) mod ${2}I] ]
    [ [I No solution for (${}, ${})I] ] if* nl
] assoc-each
