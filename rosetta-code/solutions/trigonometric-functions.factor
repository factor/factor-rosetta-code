! Task:
! 
! If your language has a library or built-in functions for trigonometry,
! show examples of:
! 
! -   -   sine
!     -   cosine
!     -   tangent
!     -   inverses (of the above)
! 
! using the same angle in radians and degrees.
! 
! For the non-inverse functions, each radian/degree pair should use
! arguments that evaluate to the same angle (that is, it's not necessary
! to use the same angle for all three regular functions as long as the two
! sine calls use the same angle).
! 
! For the inverse functions, use the same number and convert its answer to
! radians and degrees.
! 
! If your language does not have trigonometric functions available or only
! has some available, write functions to calculate the functions based on
! any known approximation or identity.
! 
! Category:Mathematics

USING: kernel math math.constants math.functions math.trig
prettyprint ;

pi 4 / 45 deg>rad [ sin ] [ cos ] [ tan ]
[ [ . ] compose dup compose ] tri@ 2tri

.5 [ asin ] [ acos ] [ atan ] tri [ dup rad>deg [ . ] bi@ ] tri@
