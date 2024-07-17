! Given the example Differential equation:
! 
! $$y'(t) = t \times \sqrt {y(t)}$$
! With initial condition:
! 
! t₀ = 0
! and y₀ = y(t₀) = y(0) = 1 This equation has an exact solution:
! 
! $$y(t) = \tfrac{1}{16}(t^2 +4)^2$$
! 
! Task
! 
! Demonstrate the commonly used explicit fourth-order Runge–Kutta method
! to solve the above differential equation.
! 
! -   Solve the given differential equation over the range t = 0…10 with a
!     step value of δt = 0.1 (101 total points, the first being given)
! -   Print the calculated values of y at whole numbered t's
!     (0.0, 1.0, …10.0) along with error as compared to the exact
!     solution.
! 
! Method summary
! 
! Starting with a given y_(n) and t_(n) calculate:
! 
! δy₁ = δt × y′(t_(n), y_(n))  
! 
! $$\delta y_2 = \delta t\times y'(t_n + \tfrac{1}{2}\delta t , y_n + \tfrac{1}{2}\delta y_1)$$
! 
! $$\delta y_3 = \delta t\times y'(t_n + \tfrac{1}{2}\delta t , y_n + \tfrac{1}{2}\delta y_2)$$
! 
! δy₄ = δt × y′(t_(n) + δt, y_(n) + δy₃)  
! then:
! 
! $$y_{n+1} = y_n + \tfrac{1}{6} (\delta y_1 + 2\delta y_2 + 2\delta y_3 + \delta y_4)$$
! 
! t_(n + 1) = t_(n) + δt  


