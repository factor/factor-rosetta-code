! The McNuggets version of the coin problem was introduced by Henri
! Picciotto,
! 
! who included it in his algebra textbook co-authored with Anita Wah. Picciotto
! thought of the application in the 1980s while dining with his son at
! McDonald's, working the problem out on a napkin. A McNugget number is
! the total number of McDonald's Chicken McNuggets in any number of boxes.
! In the United Kingdom, the original boxes (prior to the introduction of
! the Happy Meal-sized nugget boxes) were of 6, 9, and 20 nuggets.
! 
! Task:
! 
! Calculate (from 0 up to a limit of 100) the largest non-McNuggets number
! (a number n which cannot be expressed with 6x + 9y + 20z = n where x, y
! and z are natural numbers).

USING: backtrack kernel math.ranges prettyprint sequences sets ;
101 <iota> [ 0 6 9 20 [ 100 swap <range> amb-lazy ] tri@ ] bag-of diff last .
