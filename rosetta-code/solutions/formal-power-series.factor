! A power series is an infinite sum of the form
! 
! a₀ + a₁ ⋅ x + a₂ ⋅ x² + a₃ ⋅ x³ + ⋯
! 
! The a_(i) are called the coefficients of the series. Such sums can be
! added, multiplied etc., where the new coefficients of the powers of x
! are calculated according to the usual rules.
! 
! If one is not interested in evaluating such a series for particular
! values of x, or in other words, if convergence doesn't play a role, then
! such a collection of coefficients is called formal power series. It can
! be treated like a new kind of number.
! 
! Task: Implement formal power series as a numeric type. Operations should
! at least include addition, multiplication, division and additionally
! non-numeric operations like differentiation and integration (with an
! integration constant of zero). Take care that your implementation deals
! with the potentially infinite number of coefficients.
! 
! As an example, define the power series of sine and cosine in terms of
! each other using integration, as in
! 
! sin x = ∫₀^(x)cos t dt
! 
! cos x = 1 − ∫₀^(x)sin t dt
! 
! Goals: Demonstrate how the language handles new numeric types and
! delayed (or lazy) evaluation.


