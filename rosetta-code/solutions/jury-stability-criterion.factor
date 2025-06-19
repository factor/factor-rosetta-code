! Jury Stability Criterion
! 
! The Jury stability criterion is a mathematical test used to determine
! whether all the roots of a polynomial lie inside the unit circle in the
! complex plane. It is particularly important in control systems theory
! for analyzing the stability of discrete-time systems.
! 
! Background
! 
! In discrete-time systems, stability requires that all poles of the
! system's transfer function (or equivalently, all roots of the
! characteristic equation) have magnitude less than unity. The Jury
! stability criterion provides a systematic method to verify this
! condition without explicitly calculating the roots.
! 
! Definition
! 
! Consider a discrete-time system with characteristic polynomial:
! 
! P(z) = a₀z^(n) + a₁z^(n − 1) + a₂z^(n − 2) + ⋯ + a_(n − 1)z + a_(n)
! 
! where a₀ ≠ 0 and all coefficients are real.
! 
! Necessary Conditions
! 
! Before applying the main criterion, the polynomial must satisfy these
! necessary (but not sufficient) conditions:
! 
! -   P(1) > 0
! -   P(−1) > 0 if n is even, or P(−1) < 0 if n is odd
! -   |a_(n)| < a₀
! 
! Jury Array Construction
! 
! The Jury stability test involves constructing a table (Jury array) as
! follows:
! 
! $\begin{array}{ccccccc}
! a_0 & a_1 & a_2 & \cdots & a_{n-1} & a_n \\
! a_n & a_{n-1} & a_{n-2} & \cdots & a_1 & a_0 \\
! b_0 & b_1 & b_2 & \cdots & b_{n-1} & \\
! b_{n-1} & b_{n-2} & b_{n-3} & \cdots & b_0 & \\
! c_0 & c_1 & c_2 & \cdots & & \\
! c_{n-2} & c_{n-3} & c_{n-4} & \cdots & & \\
! \vdots & \vdots & \vdots & & & \\
! \end{array}$
! 
! where:
! 
! -   $b_i = \begin{vmatrix} a_0 & a_n \\ a_n & a_0 \end{vmatrix} - \begin{vmatrix} a_0 & a_i \\ a_n & a_{n-i} \end{vmatrix} = a_0 a_0 - a_n a_n - (a_0 a_{n-i} - a_n a_i)$
! -   $c_i = \begin{vmatrix} b_0 & b_{n-1} \\ b_{n-1} & b_0 \end{vmatrix} - \begin{vmatrix} b_0 & b_i \\ b_{n-1} & b_{n-1-i} \end{vmatrix}$
! 
! This process continues, with each new row having one fewer element,
! until a row with just one element is reached.
! 
! Stability Criterion
! 
! The polynomial P(z) has all its roots inside the unit circle if and only
! if:
! 
! 1. P(1) > 0 2. (−1)^(n)P(−1) > 0 3. |a_(n)| < a₀ 4. |b₀| > |b_(n − 1)|
! 5. |c₀| > |c_(n − 2)| ...and so on for all rows of the Jury array.
! 
! Applications
! 
! The Jury stability criterion is widely used in:
! 
! -   Digital control systems analysis
! -   Digital filter design
! -   Stability analysis of discrete-time systems
! -   Analysis of numerical methods for solving differential equations
! 
! Advantages
! 
! -   Avoids the need to explicitly compute polynomial roots
! -   Provides a systematic algebraic procedure
! -   Well-suited for computer implementation
! 
! Limitations
! 
! -   Computational complexity increases rapidly with polynomial order
! -   Numerical issues may arise with high-order polynomials
! -   Alternative stability tests (like Schur-Cohn) may be preferable in
!     some cases
! 
! Example
! 
! For a second-order system with characteristic polynomial
! P(z) = z² + a₁z + a₂, the Jury stability criterion yields the following
! conditions for stability:
! 
! -   P(1) = 1 + a₁ + a₂ > 0
! -   P(−1) = 1 − a₁ + a₂ > 0
! -   |a₂| < 1


