! This task is based on Kronecker product of two matrices.
! 
! If your language has no a built-in function for such product then you
! need to implement it first.
! 
! The essence of fractals is self-replication (at least, self-similar
! replications).
! 
! So, using n times self-product of the matrix (filled with 0/1) we will
! have a fractal of the n^(th) order.
! 
! Actually, "self-product" is a Kronecker power of the matrix.
! 
! In other words: for a matrix M and a power n create a function like
! matkronpow(M, n),
! 
! which returns MxMxMx... (n times product).
! 
! A formal recurrent algorithm of creating Kronecker power of a matrix is
! the following:
! 
! Algorithm:
! 
! -   Let M is an initial matrix, and Rn is a resultant block matrix of
!     the Kronecker power, where n is the power (a.k.a. order).
! -   Self-product of M, i.e., M x M producing R2 (resultant matrix with
!     order/power 2).
! -   To receive the next order/power matrix use this recurrent formula:
!     Rn = R(n-1) x M.
! -   Plot this Rn matrix to produce the nth order fractal.
! 
! Even just looking at the resultant matrix you can see what will be
! plotted.
! 
! There are virtually infinitely many fractals of this type. You are
! limited only by your creativity and the power of your computer.
! 
! Task:
! 
! Using Kronecker product implement and show two popular and well-known
! fractals, i.e.:
! 
! -    Vicsek fractal;
! -    Sierpinski carpet fractal.
! 
! The last one ( Sierpinski carpet) is already here on RC, but built using
! different approaches.
! 
! Test cases:
! 
! These 2 fractals (each order/power 4 at least) should be built using the
! following 2 simple matrices:
! 
!               │ 0 1 0 │    and    │ 1 1 1 │
!               │ 1 1 1 │           │ 1 0 1 │
!               │ 0 1 0 │           │ 1 1 1 │
! 
! Note:
! 
! -   Output could be a graphical or ASCII-art representation, but if an
!     order is set > 4 then printing is not suitable.
! -   The orientation and distortion of the fractal could be your
!     language/tool specific.
! -   It would be nice to see one additional fractal of your choice, e.g.,
!     based on using a single (double) letter(s) of an alphabet, any
!     sign(s) or already made a resultant matrix of the Kronecker product.
! 
! See implementations and results below in JavaScript, PARI/GP and R
! languages. They have additional samples of "H", "+" and checkerboard
! fractals.

USING: io kernel math math.matrices.extras sequences ;

: mat-kron-pow ( m n -- m' )
    1 - [ dup kronecker-product ] times ;

: print-fractal ( m -- )
    [ [ 1 = "*" " " ? write ] each nl ] each ;
    
{ { 0 1 0 } { 1 1 1 } { 0 1 0 } }
{ { 1 1 1 } { 1 0 1 } { 1 1 1 } }
{ { 0 1 1 } { 0 1 0 } { 1 1 0 } }
[ 3 mat-kron-pow print-fractal ] tri@
