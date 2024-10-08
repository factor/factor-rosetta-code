! A Polyspiral is a spiral made of multiple line segments, whereby each
! segment is larger (or smaller) than the previous one by a given amount.
! Each segment also changes direction at a given angle.
! 
! Task
! 
! Animate a series of polyspirals, by drawing a complete spiral then
! incrementing the angle, and (after clearing the background) drawing the
! next, and so on. Every spiral will be a frame of the animation. The
! animation may stop as it goes full circle or continue indefinitely. The
! given input values may be varied.
! 
! If animation is not practical in your programming environment, you may
! show a single frame instead.
! 
! Pseudo code
! 
!         set incr to 0.0
! 
!         // animation loop
!         WHILE true 
! 
!             incr = (incr + 0.05) MOD 360
!             x = width / 2
!             y = height / 2
!             length = 5
!             angle = incr
! 
!             // spiral loop
!             FOR 1 TO 150
!                 drawline
!                 change direction by angle
!                 length = length + 3
!                 angle = (angle + incr) MOD 360
!             ENDFOR


