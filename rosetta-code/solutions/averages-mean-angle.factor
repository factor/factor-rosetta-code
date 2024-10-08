! When calculating the average or mean of an angle one has to take into
! account how angles wrap around so that any angle in degrees plus any
! integer multiple of 360 degrees is a measure of the same angle.
! 
! If one wanted an average direction of the wind over two readings where
! the first reading was of 350 degrees and the second was of 10 degrees
! then the average of the numbers is 180 degrees, whereas if you can note
! that 350 degrees is equivalent to -10 degrees and so you have two
! readings at 10 degrees either side of zero degrees leading to a more
! fitting mean angle of zero degrees.
! 
! To calculate the mean angle of several angles:
! 
! 1.  Assume all angles are on the unit circle and convert them to complex
!     numbers expressed in real and imaginary form.
! 2.  Compute the mean of the complex numbers.
! 3.  Convert the complex mean to polar coordinates whereupon the phase of
!     the complex mean is the required angular mean.
! 
! (Note that, since the mean is the sum divided by the number of numbers,
! and division by a positive real number does not affect the angle, you
! can also simply compute the sum for step 2.)
! 
! You can alternatively use this formula:
! 
!     Given the angles α₁, …, α_(n) the mean is computed by
! 
! $$\bar{\alpha} = \operatorname{atan2}\left(\frac{1}{n}\cdot\sum_{j=1}^n \sin\alpha_j, \frac{1}{n}\cdot\sum_{j=1}^n \cos\alpha_j\right)$$
! 
! Task
! 
! 1.  write a function/method/subroutine/... that given a list of angles
!     in degrees returns their mean angle.
! 
! (You should use a built-in function if you have one that does this for degrees or radians). 
! 
! 1.  Use the function to compute the means of these lists of angles (in
!     degrees):
!     -   [350, 10]
!     -   [90, 180, 270, 360]
!     -   [10, 20, 30]
! 2.  Show your output here.
! 
! Category:Geometry

USING: formatting kernel math math.functions math.libm math.trig
sequences ;

: mean-angle ( seq -- x )
    [ deg>rad ] map [ [ sin ] map-sum ] [ [ cos ] map-sum ]
    [ length ] tri recip [ * ] curry bi@ fatan2 rad>deg ;

: show ( seq -- )
    dup mean-angle "The mean angle of %u is: %f°\n" printf ;

{ { 350 10 } { 90 180 270 360 } { 10 20 30 } } [ show ] each
