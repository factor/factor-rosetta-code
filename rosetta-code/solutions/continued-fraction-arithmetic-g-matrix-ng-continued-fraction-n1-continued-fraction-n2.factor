! This task performs the basic mathematical functions on 2 continued
! fractions. This requires the full version of matrix NG:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b 
!     \end{bmatrix}$
! 
! I may perform perform the following operations:
! 
!     Input the next term of continued fraction N₁
!     Input the next term of continued fraction N₂
!     Output a term of the continued fraction resulting from the
!     operation.
! 
! I output a term if the integer parts of $\frac{a}{b}$ and
! $\frac{a_1}{b_1}$ and $\frac{a_2}{b_2}$ and $\frac{a_{12}}{b_{12}}$ are
! equal. Otherwise I input a term from continued fraction N₁ or continued
! fraction N₂. If I need a term from N but N has no more terms I inject ∞.
! 
! When I input a term t from continued fraction N₁ I change my internal
! state:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b \end{bmatrix}$ is transposed thus
!     $\begin{bmatrix}   a_2+a_{12}*t & a+a_1*t & a_{12} & a_1 \\
!       b_2+b_{12}*t & b+b_1*t & b_{12} & b_1 
!     \end{bmatrix}$
! 
! When I need a term from exhausted continued fraction N₁ I change my
! internal state:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b \end{bmatrix}$ is transposed thus
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_{12} & a_1 \\
!       b_{12} & b_1 & b_{12} & b_1 
!     \end{bmatrix}$
! 
! When I input a term t from continued fraction N₂ I change my internal
! state:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b \end{bmatrix}$ is transposed thus
!     $\begin{bmatrix}
!       a_1+a_{12}*t & a_{12} & a+a_2*t & a_2 \\
!       b_1+b_{12}*t & b_{12} & b+b_2*t & b_2 
!     \end{bmatrix}$
! 
! When I need a term from exhausted continued fraction N₂ I change my
! internal state:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b \end{bmatrix}$ is transposed thus
!     $\begin{bmatrix}
!       a_{12} & a_{12} & a_2 & a_2 \\
!       b_{12} & b_{12} & b_2 & b_2 
!     \end{bmatrix}$
! 
! When I output a term t I change my internal state:
! 
!     $\begin{bmatrix}
!       a_{12} & a_1 & a_2 & a \\
!       b_{12} & b_1 & b_2 & b \end{bmatrix}$ is transposed thus
!     $\begin{bmatrix}
!       b_{12} & b_1 & b_2 & b \\
!       a_{12}-b_{12}*t & a_1-b_1*t & a_2-b_2*t & a-b*t 
!     \end{bmatrix}$
! 
! When I need to choose to input from N₁ or N₂ I act:
! 
!     if b and b2 are zero I choose N₁
!     if b is zero I choose N₂
!     if b2 is zero I choose N₂
!     if abs($\frac{a_1}{b_1}-\frac{a}{b})$ is greater than
!     abs($\frac{a_2}{b_2}-\frac{a}{b})$ I choose N₁
!     otherwise I choose N₂
! 
! When performing arithmetic operation on two potentially infinite
! continued fractions it is possible to generate a rational number. eg
! $\sqrt{2}$ * $\sqrt{2}$ should produce 2. This will require either that
! I determine that my internal state is approaching infinity, or limiting
! the number of terms I am willing to input without producing any output.


