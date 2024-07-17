! Task
! 
! Write a method (function, procedure etc.) in your language which
! calculates the length of the major arc of a circle of given radius
! between two angles.
! 
! In this diagram the major arc is colored green (note: this website
! leaves cookies).
! 
! Illustrate the use of your method by calculating the length of the major
! arc of a circle of radius 10 units, between angles of 10 and 120
! degrees.

USING: kernel math math.constants math.trig prettyprint ;

: arc-length ( radius angle angle -- x )
    - abs deg>rad 2pi swap - * ;

10 10 120 arc-length .
