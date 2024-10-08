! In algebra, a max tropical semiring (also called a max-plus algebra) is
! the semiring (ℝ ∪ -Inf, ⊕, ⊗) containing the ring of real numbers ℝ
! augmented by negative infinity, the max function (returns the greater of
! two real numbers), and addition.
! 
! In max tropical algebra, x ⊕ y = max(x, y) and x ⊗ y = x + y. The
! identity for ⊕ is -Inf (the max of any number with -infinity is that
! number), and the identity for ⊗ is 0.
! 
! Task:
! 
! -   Define functions or, if the language supports the symbols as
!     operators, operators for ⊕ and ⊗ that fit the above description. If
!     the language does not support ⊕ and ⊗ as operators but allows
!     overloading operators for a new object type, you may instead
!     overload + and * for a new min tropical albrbraic type. If you
!     cannot overload operators in the language used, define ordinary
!     functions for the purpose.
! 
! Show that 2 ⊗ -2 is 0, -0.001 ⊕ -Inf is -0.001, 0 ⊗ -Inf is -Inf, 1.5 ⊕
! -1 is 1.5, and -0.5 ⊗ 0 is -0.5.
! 
! -   Define exponentiation as serial ⊗, and in general that a to the
!     power of b is a * b, where a is a real number and b must be a
!     positive integer. Use either ↑ or similar up arrow or the carat ^,
!     as an exponentiation operator if this can be used to overload such
!     "exponentiation" in the language being used. Calculate 5 ↑ 7 using
!     this definition.
! 
! -   Max tropical algebra is distributive, so that
! 
!   a ⊗ (b ⊕ c) equals a ⊗ b ⊕ b ⊗ c, 
! 
! where ⊗ has precedence over ⊕. Demonstrate that 5 ⊗ (8 ⊕ 7) equals 5 ⊗ 8
! ⊕ 5 ⊗ 7.
! 
! -   If the language used does not support operator overloading, you may
!     use ordinary function names such as tropicalAdd(x, y) and
!     tropicalMul(x, y).
! 
! See also
! 
! :;*https://en.wikipedia.org/wiki/Tropical_semiring#tropical_algebra
! Tropical algebra
! 
! :;*https://arxiv.org/pdf/1908.07012.pdf Tropical geometry review article
! 
! :;*https://en.wikipedia.org/wiki/Operator_overloading Operator
! overloading

USING: io kernel math math.order present prettyprint sequences
typed ;

ALIAS: ⊕ max
ALIAS: ⊗ +
PREDICATE: posint < integer 0 > ;
TYPED: ↑ ( x: real n: posint -- y: real ) * ;

: show ( quot -- )
    dup present rest but-last "⟶ " append write call . ; inline

{
    [ 2 -2 ⊗ ]
    [ -0.001 -1/0. ⊕ ]
    [ 0 -1/0. ⊗ ]
    [ 1.5 -1 ⊕ ]
    [ -0.5 0 ⊗ ]
    [ 5 7 ↑ ]
    [ 8 7 ⊕ 5 ⊗ ]
    [ 5 8 ⊗ 5 7 ⊗ ⊕ ]
    [ 8 7 ⊕ 5 ⊗   5 8 ⊗ 5 7 ⊗ ⊕   = ]
} [ show ] each
