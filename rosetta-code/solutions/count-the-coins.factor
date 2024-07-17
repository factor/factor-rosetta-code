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

USING: combinators kernel locals math math.ranges sequences sets sorting ;
IN: rosetta.coins

<PRIVATE
! recursive-count uses memoization and local variables.
! coins must be a sequence.
MEMO:: recursive-count ( cents coins -- ways )
    coins length :> types
    {
        ! End condition: 1 way to make 0 cents.
        { [ cents zero? ] [ 1 ] }
        ! End condition: 0 ways to make money without any coins.
        { [ types zero? ] [ 0 ] }
        ! Optimization: At most 1 way to use 1 type of coin.
        { [ types 1 number= ] [
            cents coins first mod zero? [ 1 ] [ 0 ] if
        ] }
        ! Find all ways to use the first type of coin.
        [
            ! f = first type, r = other types of coins.
            coins unclip-slice :> f :> r
            ! Loop for 0, f, 2*f, 3*f, ..., cents.
            0 cents f <range> [
                ! Recursively count how many ways to make remaining cents
                ! with other types of coins.
                cents swap - r recursive-count
            ] [ + ] map-reduce          ! Sum the counts.
        ]
    } cond ;
PRIVATE>

! How many ways can we make the given amount of cents
! with the given set of coins?
: make-change ( cents coins -- ways )
    members [ ] inv-sort-with   ! Sort coins in descending order.
    recursive-count ;
