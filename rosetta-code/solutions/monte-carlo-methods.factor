! A Monte Carlo Simulation is a way of approximating the value of a
! function where calculating the actual value is difficult or impossible.
! 
! It uses random sampling to define constraints on the value and then
! makes a sort of "best guess."
! 
! A simple Monte Carlo Simulation can be used to calculate the value for
! π.
! 
! If you had a circle and a square where the length of a side of the
! square was the same as the diameter of the circle, the ratio of the area
! of the circle to the area of the square would be π/4.
! 
! So, if you put this circle inside the square and select many random
! points inside the square, the number of points inside the circle divided
! by the number of points inside the square and the circle would be
! approximately π/4.
! 
! Task:
! 
! Write a function to run a simulation like this, with a variable number
! of random points to select.
! 
! Also, show the results of a few different sample sizes.
! 
! For software where the number π is not built-in, we give π as a number
! of digits:
! 
!             3.141592653589793238462643383280

USING: kernel math math.functions random sequences ;

: limit ( -- n ) 2 32 ^ ; inline
: in-circle ( x y -- ? ) limit [ sq ] tri@ [ + ] [ <= ] bi* ;
: rand ( -- r ) limit random ;
: pi ( n -- pi ) [ [ drop rand rand in-circle ] count ] keep / 4 * >float ;
