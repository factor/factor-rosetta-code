!   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------
!   In a general Gaussian quadrature rule, an definite integral of f(x) is first approximated over the interval [−1, 1] by a polynomial approximable function g(x) and a known weighting function W(x).   ∫⁻¹¹f(x) dx = ∫⁻¹¹W(x)g(x) dx
!   Those are then approximated by a sum of function values at specified points x_(i) multiplied by some weights w_(i):                                                                                   $\int_{-1}^1 W(x) g(x) \, dx \approx \sum_{i=1}^n w_i g(x_i)$
!   In the case of Gauss-Legendre quadrature, the weighting function W(x) = 1, so we can approximate an integral of f(x) with:                                                                            $\int_{-1}^1 f(x)\,dx \approx \sum_{i=1}^n w_i f(x_i)$
!   ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------------------------------------------------
! 
! For this, we first need to calculate the nodes and the weights, but
! after we have them, we can reuse them for numerious integral
! evaluations, which greatly speeds up the calculation compared to more
! simple numerical integration methods.
! 
! +----------------------------------+----------------------------------+
! | The n evaluation points x_(i)    | P₀(x) = 1                        |
! | for a n-point rule, also called  | P₁(x) = x                        |
! | "nodes", are roots of n-th order | nP_(n)(x) = (2n − 1)xP_          |
! | Legendre Polynomials P_(n)(x).   | (n − 1)(x) − (n − 1)P_(n − 2)(x) |
! | Legendre polynomials are defined |                                  |
! | by the following recursive rule: |                                  |
! +----------------------------------+----------------------------------+
! | There is also a recursive        | $P                               |
! | equation for their derivative:   | _{n}'(x) = \frac{n}{x^2-1} \left |
! |                                  | ( x P_n(x) - P_{n-1}(x) \right)$ |
! +----------------------------------+----------------------------------+
! | The roots of those polynomials   | $x_{n+1}                         |
! | are in general not analytically  |  = x_n - \frac{f(x_n)}{f'(x_n)}$ |
! | solvable, so they have to be     |                                  |
! | approximated numerically, for    |                                  |
! | example by Newton-Raphson        |                                  |
! | iteration:                       |                                  |
! +----------------------------------+----------------------------------+
! | The first guess x₀ for the i-th  | $x_0 = \                         |
! | root of a n-order polynomial     | cos \left( \pi \, \frac{i - \fra |
! | P_(n) can be given by            | c{1}{4}}{n+\frac{1}{2}} \right)$ |
! +----------------------------------+----------------------------------+
! | After we get the nodes x_(i), we | $w_i = \frac{2}{\left(           |
! | compute the appropriate weights  |  1-x_i^2 \right) [P'_n(x_i)]^2}$ |
! | by:                              |                                  |
! +----------------------------------+----------------------------------+
! | After we have the nodes and the  | $\int_a^b                        |
! | weights for a n-point quadrature |  f(x)\,dx \approx \frac{b-a}{2}  |
! | rule, we can approximate an      | \sum_{i=1}^n w_i f\left(\frac{b- |
! | integral over any interval       | a}{2}x_i + \frac{a+b}{2}\right)$ |
! | [a, b] by                        |                                  |
! +----------------------------------+----------------------------------+
! 
! Task description
! 
! Similar to the task Numerical Integration, the task here is to calculate
! the definite integral of a function f(x), but by applying an n-point
! Gauss-Legendre quadrature rule, as described here, for example. The
! input values should be an function f to integrate, the bounds of the
! integration interval a and b, and the number of gaussian evaluation
! points n. An reference implementation in Common Lisp is provided for
! comparison.
! 
! To demonstrate the calculation, compute the weights and nodes for an
! 5-point quadrature rule and then use them to compute:
! 
!          $\int_{-3}^{3} \exp(x) \, dx \approx \sum_{i=1}^5 w_i \; \exp(x_i) \approx 20.036$
! 
! Category:Arithmetic Category:Mathematics


