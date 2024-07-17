! A Walsh matrix is a specific square matrix of dimensions 2^(n), where n
! is some particular natural number. The elements of the matrix are either
! +1 or −1 and its rows as well as columns are orthogonal, i.e. dot
! product is zero. Each row of a Walsh matrix corresponds to a Walsh
! function.
! 
! Walsh matrices are a special case of Hadamard matrices. The naturally
! ordered Hadamard (Walsh) matrix is defined by the recursive formula
! below, and the sequency-ordered Hadamard (Walsh) matrix is formed by
! rearranging the rows so that the number of sign changes in a row is in
! increasing order.
! 
! To generate a naturally ordered Walsh matrix
! 
! Matrices of dimension 2^(k) for k∈N are given by the recursive formula:
! 
! $$\begin{align}
!   W\left(2^1\right) &= \begin{bmatrix}
!     1 &  1 \\
!     1 & -1
!   \end{bmatrix}, \\
!   W\left(2^2\right) &= \begin{bmatrix}
!     1 &  1 &  1 &  1 \\
!     1 & -1 &  1 & -1 \\
!     1 &  1 & -1 & -1 \\
!     1 & -1 & -1 &  1 \\
!   \end{bmatrix},
! \end{align}$$
! 
! and in general
! 
! $$W\left(2^k\right) = \begin{bmatrix}
!     W\left(2^{k-1}\right) &  W\left(2^{k-1}\right) \\
!     W\left(2^{k-1}\right) & -W\left(2^{k-1}\right)
!   \end{bmatrix} =
!   W(2) \otimes W\left(2^{k-1}\right),$$
! 
! for 2≤k∈N, where ⊗ denotes the Kronecker product.
! 
! Task
! * Write a routine that, given a natural number k, returns a naturally ordered Walsh matrix of order 2^(k).
! * Display a few sample generated matrices.
! 
!     
! 
!         Traditionally, Walsh matrices use 1 & -1 to denote the different
!         cell values in text mode, or green and red blocks in image mode.
!         You may use whichever display mode is most convenient for your
!         particular language.
! 
! Stretch
! * Also, optionally generate sequency ordered Walsh matrices.
! 
!     
! 
!         A sequency ordered Walsh matrix has the rows sorted by number of
!         sign changes.
! 
! See also
! * Wikipedia: Walsh matrix
! * Related task: Kronecker product

USING: accessors formatting images.processing images.testing
images.viewer kernel math math.matrices math.matrices.extras
sequences sequences.extras sorting.extras ui ui.gadgets
ui.gadgets.borders ui.gadgets.labeled ui.gadgets.packs ;
IN: walsh

CONSTANT: walsh1 { { 1 1 } { 1 -1 } }
CONSTANT: red B{ 0 255 0 }
CONSTANT: green B{ 255 0 0 }

: walsh ( n -- seq )
    1 - walsh1 tuck '[ _ kronecker-product ] times ;

: sequency ( n -- seq )
    walsh [ dup rest-slice [ = not ] 2count ] map-sort ;

: seq>bmp ( seq -- newseq )
    concat [ 1 = red green ? ] B{ } map-concat-as ;

: seq>img ( seq -- image )
    dup dimension <rgb-image> swap >>dim swap seq>bmp >>bitmap ;

: <img> ( seq -- gadget )
    dup length 256 swap / matrix-zoom seq>img <image-gadget> ;

: info ( seq -- str )
    length dup log2 swap dup "Order %d  (%d x %d)" sprintf ;

: <info-img> ( seq -- gadget )
    [ <img> ] [ info ] bi <labeled-gadget> ;

: <pile-by> ( seq quot -- gadget )
    <pile> -rot [ <info-img> add-gadget ] compose each ; inline

: <natural> ( -- gadget )
    { 2 4 5 } [ walsh ] <pile-by> "Natural ordering"
    <labeled-gadget> ;

: <sequency> ( -- gadget )
    { 2 4 5 } [ sequency ] <pile-by> "Sequency ordering"
    <labeled-gadget> ;

: <walsh> ( -- gadget )
    <shelf> <natural> { 3 0 } <border> add-gadget
    <sequency> { 3 0 } <border> add-gadget ;

MAIN: [ <walsh> "Walsh matrices" open-window ]
