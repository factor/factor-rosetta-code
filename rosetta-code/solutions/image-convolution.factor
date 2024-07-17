! One class of image digital filters is described by a rectangular matrix
! of real coefficients called kernel convoluted in a sliding window of
! image pixels. Usually the kernel is square K_(kl), where k, l are in the
! range -R,-R+1,..,R-1,R. W=2R+1 is the kernel width.
! 
! The filter determines the new value of a grayscale image pixel P_(ij) as
! a convolution of the image pixels in the window centered in i, j and the
! kernel values:
! 
!   $P_{ij}=\displaystyle\sum_{k=-R}^R \sum_{l=-R}^R P_{i+k\ j+l} K_{k l}$
! 
! Color images are usually split into the channels which are filtered
! independently. A color model can be changed as well, i.e. filtration is
! performed not necessarily in RGB. Common kernels sizes are 3x3 and 5x5.
! The complexity of filtrating grows quadratically (O(n²)) with the kernel
! width.
! 
! Task: Write a generic convolution 3x3 kernel filter. Optionally show
! some end user filters that use this generic one.
! 
! (You can use, to test the functions below, these input and output
! solutions.)


