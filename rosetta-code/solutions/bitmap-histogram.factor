! Extend the basic bitmap storage defined on this page to support dealing
! with image histograms. The image histogram contains for each luminance
! the count of image pixels having this luminance. Choosing a histogram
! representation take care about the data type used for the counts. It
! must have range of at least 0..NxM, where N is the image width and M is
! the image height.
! 
! Test task
! 
! Histogram is useful for many image processing operations. As an example,
! use it to convert an image into black and white art. The method works as
! follows:
! 
! -   Convert image to grayscale;
! -   Compute the histogram
! -   Find the median: defined as the luminance such that the image has an
!     approximately equal number of pixels with lesser and greater
!     luminance.
! -   Replace each pixel of luminance lesser than the median to black, and
!     others to white.
! 
! Use read/write ppm file, and grayscale image solutions.


