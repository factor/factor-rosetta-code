! Task:
! 
! Write a program that performs so-called canny edge detection on an
! image.
! 
! A possible algorithm consists of the following steps:
! 
! 1.  Noise reduction. May be performed by Gaussian filter.
! 
! 1.  Compute intensity gradient (matrices G_(x) and G_(y)) and its
!     magnitude G:
! 
! $G=\sqrt{G_x^2+G_y^2}$
! 
! May be performed by convolution of an image with Sobel operators.
! 
! 1.  Non-maximum suppression.
! 
! For each pixel compute the orientation of intensity gradient vector:
! $\theta = {\rm atan2}\left(G_y, \, G_x\right)$. Transform angle θ to one
! of four directions: 0, 45, 90, 135 degrees. Compute new array N: if
! G(p_(a)) < G(p) < G(p_(b)) where p is the current pixel, p_(a) and p_(b)
! are the two neighbour pixels in the direction of gradient, then
! N(p) = G(p), otherwise N(p) = 0. Nonzero pixels in resulting array
! correspond to local maxima of G in direction θ(p).
! 
! 1.  Tracing edges with hysteresis.
! 
! At this stage two thresholds for the values of G are introduced: T_(min)
! and T_(max). Starting from pixels with N(p) ≥ T_(max), find all paths of
! pixels with N(p) ≥ T_(min) and put them to the resulting image.

