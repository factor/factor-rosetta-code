! A traveler gets diverted and has to make an unscheduled stop in what
! turns out to be Shangri La. Opting to leave, he is allowed to take as
! much as he likes of the following items, so long as it will fit in his
! knapsack, and he can carry it.
! 
! He knows that he can carry no more than 25 'weights' in total; and that
! the capacity of his knapsack is 0.25 'cubic lengths'.
! 
! Looking just above the bar codes on the items he finds their weights and
! volumes. He digs out his recent copy of a financial paper and gets the
! value of each item.
! 
! Item
! 
! Explanation
! 
! Value (each)
! 
! weight
! 
! Volume (each)
! 
! panacea (vials of)
! 
! Incredible healing properties
! 
! 3000
! 
! 0.3
! 
! 0.025
! 
! ichor (ampules of)
! 
! Vampires blood
! 
! 1800
! 
! 0.2
! 
! 0.015
! 
! gold (bars)
! 
! Shiney shiney
! 
! 2500
! 
! 2.0
! 
! 0.002
! 
! Knapsack
! 
! For the carrying of
! 
! -
! 
! <=25
! 
! <=0.25 
! 
! He can only take whole units of any item, but there is much more of any
! item than he could ever carry
! 
! Task:
! 
! Show how many of each item does he take to maximize the value of items
! he is carrying away with him.
! 
! Note:
! 
! -   There are four solutions that maximize the value taken. Only one
!     need be given.
! 
! Related tasks:
! 
! -   Knapsack problem/Bounded
! -   Knapsack problem/Continuous
! -   Knapsack problem/0-1

USING: accessors combinators kernel locals math math.order
math.vectors sequences sequences.product combinators.short-circuit ;
IN: knapsack

CONSTANT: values { 3000 1800 2500 }
CONSTANT: weights { 0.3 0.2 2.0 }
CONSTANT: volumes { 0.025 0.015 0.002 }

CONSTANT: max-weight 25.0
CONSTANT: max-volume 0.25

TUPLE: bounty amounts value weight volume ;

: <bounty> ( items -- bounty )
    [ bounty new ] dip {
        [ >>amounts ]
        [ values v. >>value ]
        [ weights v. >>weight ]
        [ volumes v. >>volume ]
    } cleave ;

: valid-bounty? ( bounty -- ? )
    { [ weight>> max-weight <= ]
      [ volume>> max-volume <= ] } 1&& ;

M:: bounty <=> ( a b -- <=> )
    a valid-bounty? [
        b valid-bounty? [
            a b [ value>> ] compare
        ] [ +gt+ ] if
    ] [ b valid-bounty? +lt+ +eq+ ? ] if ;

: find-max-amounts ( -- amounts )
    weights volumes [
        [ max-weight swap / ]
        [ max-volume swap / ] bi* min >integer
    ] 2map ;

: best-bounty ( -- bounty )
    find-max-amounts [ 1 + iota ] map <product-sequence>
    [ <bounty> ] [ max ] map-reduce ;
