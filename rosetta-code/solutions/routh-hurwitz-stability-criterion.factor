! Routh–Hurwitz stability criterion is a mathematical test that provides
! necessary and sufficient conditions for the stability of a linear
! time-invariant (LTI) system. It was independently discovered by Edward
! John Routh in 1876 and Adolf Hurwitz in 1895. The criterion determines
! whether all roots of the characteristic polynomial of a linear system
! have negative real parts, which is a requirement for the system to be
! stable.
! 
! Background
! 
! For a continuous-time system described by a differential equation, its
! stability depends on the location of the roots of its characteristic
! polynomial in the complex plane. The system is stable if and only if all
! roots lie in the left half of the complex plane (i.e., have negative
! real parts). The Routh–Hurwitz criterion provides a method to determine
! this without explicitly computing the roots.
! 
! Mathematical formulation
! 
! Consider a polynomial:
! 
! P(s) = a₀s^(n) + a₁s^(n − 1) + a₂s^(n − 2) + ⋯ + a_(n − 1)s + a_(n)
! 
! where all coefficients a_(i) are real and a₀ > 0.
! 
! The Routh array is formed as follows:
! 
! $\begin{array}{c|ccccc}
! s^n & a_0 & a_2 & a_4 & a_6 & \cdots \\
! s^{n-1} & a_1 & a_3 & a_5 & a_7 & \cdots \\
! s^{n-2} & b_1 & b_2 & b_3 & b_4 & \cdots \\
! s^{n-3} & c_1 & c_2 & c_3 & c_4 & \cdots \\
! \vdots & \vdots & \vdots & \vdots & \vdots & \ddots \\
! s^0 & ? & ? & ? & ? & \cdots
! \end{array}$
! 
! where each subsequent row is calculated using:
! 
! $b_1 = \frac{a_1 a_2 - a_0 a_3}{a_1}, \quad b_2 = \frac{a_1 a_4 - a_0 a_5}{a_1}, \quad \text{etc.}$
! 
! $c_1 = \frac{b_1 a_3 - a_1 b_2}{b_1}, \quad c_2 = \frac{b_1 a_5 - a_1 b_3}{b_1}, \quad \text{etc.}$
! 
! Stability theorem
! 
! The Routh–Hurwitz theorem states that the number of roots of the
! polynomial P(s) with positive real parts is equal to the number of sign
! changes in the first column of the Routh array. Therefore, for a stable
! system, all elements in the first column must have the same sign
! (usually positive if a₀ > 0).
! 
! Special cases
! 
! Zero in the first column: If an element in the first column is zero
! while other elements in the same row are not, it can be replaced with a
! small positive value ϵ and the computation continued.
! 
! Entire row is zero: If an entire row is zero, an auxiliary polynomial is
! formed using coefficients from the row above. The derivative of this
! auxiliary polynomial replaces the zero row.
! 
! Applications
! 
! The Routh–Hurwitz criterion is widely used in control theory to
! determine the stability of linear feedback systems. It is particularly
! useful in the design of control systems where stability is a primary
! concern. The criterion can be applied to:
! 
! -   Checking stability of closed-loop systems
! -   Determining the range of gain values for which a system remains
!     stable
! -   Analyzing the effect of parameter variations on system stability
! 
! Limitations
! 
! -   The criterion only applies to linear time-invariant systems
! -   It does not provide information about transient response or
!     performance
! -   For high-order systems, the calculations can become cumbersome
! -   The method only determines absolute stability, not relative
!     stability
! 
! Related techniques
! 
! Other methods for stability analysis include:
! 
! -   Nyquist stability criterion
! -   Bode plot analysis
! -   Root locus method
! -   Lyapunov stability theory


