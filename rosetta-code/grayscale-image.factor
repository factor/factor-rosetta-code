! Many image processing algorithms are defined for grayscale (or else
! monochromatic) images.
! 
! Task:
! 
! Extend the data storage type defined on this page to support grayscale
! images.
! 
! Define two operations, one to convert a color image to a grayscale image
! and one for the backward conversion.
! 
! To get luminance of a color use the formula recommended by CIE:
! 
!  L  =  0.2126 × R   +   0.7152 × G   +   0.0722 × B 
! 
! When using floating-point arithmetic make sure that rounding errors
! would not cause run-time problems or else distorted results when
! calculated luminance is stored as an unsigned integer.

USING: arrays kernel math math.matrices math.vectors ;

: rgb>gray ( matrix -- new-matrix )
    [ { 0.2126 0.7152 0.0722 } vdot >integer ] matrix-map ;

: gray>rgb ( matrix -- new-matrix )
    [ dup dup 3array ] matrix-map ;
