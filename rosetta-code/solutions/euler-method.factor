! Euler's method numerically approximates solutions of first-order
! ordinary differential equations (ODEs) with a given initial value. It is
! an explicit method for solving initial value problems (IVPs), as
! described in the wikipedia page.
! 
! The ODE has to be provided in the following form:
! 
!     
! 
!         $\frac{dy(t)}{dt} = f(t,y(t))$
! 
! with an initial value
! 
!     
! 
!         y(t₀) = y₀
! 
! To get a numeric solution, we replace the derivative on the LHS with a
! finite difference approximation:
! 
!     
! 
!         $\frac{dy(t)}{dt}  \approx \frac{y(t+h)-y(t)}{h}$
! 
! then solve for y(t + h):
! 
!     
! 
!         $y(t+h) \approx y(t) + h \, \frac{dy(t)}{dt}$
! 
! which is the same as
! 
!     
! 
!         y(t + h) ≈ y(t) + h f(t, y(t))
! 
! The iterative solution rule is then:
! 
!     
! 
!         y_(n + 1) = y_(n) + h f(t_(n), y_(n))
! 
! where h is the step size, the most relevant parameter for accuracy of
! the solution. A smaller step size increases accuracy but also the
! computation cost, so it has always has to be hand-picked according to
! the problem at hand.
! 
! Example: Newton's Cooling Law
! 
! Newton's cooling law describes how an object of initial temperature
! T(t₀) = T₀ cools down in an environment of temperature T_(R):
! 
!     
! 
!         $\frac{dT(t)}{dt} = -k \, \Delta T$
! 
! or
! 
!     
! 
!         $\frac{dT(t)}{dt} = -k \, (T(t) - T_R)$
! 
! It says that the cooling rate $\frac{dT(t)}{dt}$ of the object is
! proportional to the current temperature difference ΔT = (T(t) − T_(R))
! to the surrounding environment.
! 
! The analytical solution, which we will compare to the numerical
! approximation, is
! 
!     
! 
!         T(t) = T_(R) + (T₀ − T_(R)) e^(−kt)
! 
! Task:
! 
! Implement a routine of Euler's method and then to use it to solve the
! given example of Newton's cooling law with it for three different step
! sizes of:
! 
! -   -   2 s
!     -   5 s and
!     -   10 s
! 
! and to compare with the analytical solution.
! 
! Initial values:
! 
! -   -   initial temperature T₀ shall be 100 °C
!     -   room temperature T_(R) shall be 20 °C
!     -   cooling constant k shall be 0.07
!     -   time interval to calculate shall be from 0 s ──► 100 s
! 
! A reference solution (Common Lisp) can be seen below. We see that bigger
! step sizes lead to reduced approximation accuracy. []

USING: formatting fry io kernel locals math math.ranges
sequences ;
IN: rosetta-code.euler-method

:: euler ( quot y! a b h -- )
    a b h <range> [
        :> t
        t y "%7.3f %7.3f\n" printf
        t y quot call h * y + y!
    ] each ; inline

: cooling ( t y -- x ) nip 20 - -0.07 * ;

: euler-method-demo ( -- )
   2 5 10 [ '[ [ cooling ] 100 0 100 _ euler ] call nl ] tri@ ;

MAIN: euler-method-demo
