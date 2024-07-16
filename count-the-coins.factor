! There are four types of common coins in US currency:
! 
! :::# quarters (25 cents)
! 
! :::# dimes (10 cents)
! 
! :::# nickels (5 cents), and
! 
! :::# pennies (1 cent)
! 
! There are six ways to make change for 15 cents:
! 
! :::# A dime and a nickel
! 
! :::# A dime and 5 pennies
! 
! :::# 3 nickels
! 
! :::# 2 nickels and 5 pennies
! 
! :::# A nickel and 10 pennies
! 
! :::# 15 pennies
! 
! Task:
! 
! How many ways are there to make change for a dollar using these common
! coins? (1 dollar = 100 cents).
! 
! Optional:
! 
! Less common are dollar coins (100 cents); and very rare are half dollars
! (50 cents). With the addition of these two coins, how many ways are
! there to make change for $1000?
! 
! (Note: the answer is larger than 2³²).
! 
! References:
! 
! -   an algorithm from the book Structure and Interpretation of Computer
!     Programs.
! -   an article in the algorithmist.
! -   Change-making problem on Wikipedia.

USE: math.ranges 

:: exchange-count ( seq val -- cnt )
  val 1 + 0 <array> :> tab
  0 :> old!
  1 0 tab set-nth
  seq length iota [
    seq nth old!
    old val [a,b] [| j |
      j old - tab nth
      j tab nth + 
      j tab set-nth
    ] each
  ] each
  val tab nth
;

[ { 1 5 10 25 50 100 } 100000 exchange-count . ] time
13398445413854501
Running time: 0.029163549 seconds
