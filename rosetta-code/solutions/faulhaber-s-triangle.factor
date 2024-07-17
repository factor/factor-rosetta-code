! Named after Johann Faulhaber, the rows of Faulhaber's triangle are the
! coefficients of polynomials that represent sums of integer powers, which
! are extracted from Faulhaber's formula:
! 
! $$\sum_{k=1}^n k^p = {1 \over p+1} \sum_{j=0}^p {p+1 \choose j} B_j n^{p+1-j}$$
! 
! where B_(n) is the nth-Bernoulli number.
! 
! The first 5 rows of Faulhaber's triangle, are:
! 
!         1
!       1/2  1/2
!       1/6  1/2  1/3
!         0  1/4  1/2  1/4
!     -1/30    0  1/3  1/2  1/5
! 
! Using the third row of the triangle, we have:
! 
! $\sum_{k=1}^n k^2 = {1 \over 6} n + {1 \over 2} n^2 + {1 \over 3} n^3$
! 
! Task
! 
! -   -   show the first 10 rows of Faulhaber's triangle.
!     -   using the 18th row of Faulhaber's triangle, compute the sum:
!         $\sum_{k=1}^{1000} k^{17}$ (extra credit).
! 
! See also:
! 
! -   Bernoulli numbers
! -   Evaluate binomial coefficients
! -   Faulhaber's formula (Wikipedia)
! -   Faulhaber's triangle (PDF)

USING: kernel math math.combinatorics math.extras math.functions
math.ranges prettyprint sequences ;

: faulhaber ( p -- seq )
    1 + dup recip swap dup 0 (a,b]
    [ [ nCk ] [ -1 swap ^ ] [ bernoulli ] tri * * * ] 2with map ;

10 [ faulhaber . ] each-integer
