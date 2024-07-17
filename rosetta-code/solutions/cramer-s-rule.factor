! Given
! 
!     $\left\{\begin{matrix}a_1x + b_1y + c_1z&= {\color{red}d_1}\\a_2x + b_2y + c_2z&= {\color{red}d_2}\\a_3x + b_3y + c_3z&= {\color{red}d_3}\end{matrix}\right.$
! 
! which in matrix format is
! 
!     $\begin{bmatrix} a_1 & b_1 & c_1 \\ a_2 & b_2 & c_2 \\ a_3 & b_3 & c_3 \end{bmatrix}\begin{bmatrix} x \\ y \\ z \end{bmatrix}=\begin{bmatrix} {\color{red}d_1} \\ {\color{red}d_2} \\ {\color{red}d_3} \end{bmatrix}.$
! 
! Then the values of x, y and z can be found as follows:
! 
! $$x = \frac{\begin{vmatrix} {\color{red}d_1} & b_1 & c_1 \\ {\color{red}d_2} & b_2 & c_2 \\ {\color{red}d_3} & b_3 & c_3 \end{vmatrix} } { \begin{vmatrix} a_1 & b_1 & c_1 \\ a_2 & b_2 & c_2 \\ a_3 & b_3 & c_3 \end{vmatrix}}, \quad y = \frac {\begin{vmatrix} a_1 & {\color{red}d_1} & c_1 \\ a_2 & {\color{red}d_2} & c_2 \\ a_3 & {\color{red}d_3} & c_3 \end{vmatrix}} {\begin{vmatrix} a_1 & b_1 & c_1 \\ a_2 & b_2 & c_2 \\ a_3 & b_3 & c_3 \end{vmatrix}}, \text{ and }z = \frac { \begin{vmatrix} a_1 & b_1 & {\color{red}d_1} \\ a_2 & b_2 & {\color{red}d_2} \\ a_3 & b_3 & {\color{red}d_3} \end{vmatrix}} {\begin{vmatrix} a_1 & b_1 & c_1 \\ a_2 & b_2 & c_2 \\ a_3 & b_3 & c_3 \end{vmatrix} }.$$
! 
! Task
! 
! Given the following system of equations:
! 
! $$\begin{cases}
! 2w-x+5y+z=-3 \\
! 3w+2x+2y-6z=-32 \\
! w+3x+3y-z=-47 \\
! 5w-2x-3y+3z=49 \\
! \end{cases}$$
! 
! solve for w, x, y and z, using Cramer's rule.

USING: kernel math math.matrices.laplace prettyprint sequences ;
IN: rosetta-code.cramers-rule

: replace-col ( elt n seq -- seq' ) flip [ set-nth ] keep flip ;

: solve ( m v -- seq )
    dup length <iota> [
        rot [ replace-col ] keep [ determinant ] bi@ /
    ] 2with map ;

: cramers-rule-demo ( -- )
    {
        { 2 -1  5  1 }
        { 3  2  2 -6 }
        { 1  3  3 -1 }
        { 5 -2 -3  3 }
    }
    { -3 -32 -47 49 } solve . ;

MAIN: cramers-rule-demo
