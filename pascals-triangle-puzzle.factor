! This puzzle involves a Pascals Triangle, also known as a Pyramid of
! Numbers.
! 
!                [ 151]
!               [  ][  ]
!             [40][  ][  ]
!           [  ][  ][  ][  ]
!         [ X][11][ Y][ 4][ Z]
! 
! Each brick of the pyramid is the sum of the two bricks situated below
! it.
! 
! Of the three missing numbers at the base of the pyramid, the middle one
! is the sum of the other two (that is, Y = X + Z).
! 
! Task:
! 
! Write a program to find a solution to this puzzle.

USING: arrays backtrack combinators.extras fry grouping.extras
interpolate io kernel math math.ranges sequences ;

: base ( ?x ?z -- seq ) 2dup + swap '[ _ 11 _ 4 _ ] >array ;

: up ( seq -- seq' ) [ [ + ] 2clump-map ] twice ;

: find-solution ( -- x z )
    10 [1,b] dup [ amb-lazy ] bi@ 2dup base
    up dup first 40 = must-be-true
    up first 151 = must-be-true ;

find-solution [I X = ${1}, Z = ${}I] nl
