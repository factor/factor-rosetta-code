! Task:
! 
! Generate 100 <x,y> coordinate pairs such that x and y are integers
! sampled from the uniform distribution with the condition that
! $10 \leq \sqrt{ x^2 + y^2 } \leq 15$. Then display/plot them. The
! outcome should be a "fuzzy" circle. The actual number of points plotted
! may be less than 100, given that some pairs may be generated more than
! once.
! 
! There are several possible approaches to accomplish this. Here are two
! possible algorithms.
! 
! 1) Generate random pairs of integers and filter out those that don't
! satisfy this condition:
! 
! $$10 \leq \sqrt{ x^2 + y^2 } \leq 15$$
! .
! 
! 2) Precalculate the set of all possible points (there are 404 of them)
! and select randomly from this set.

USING: io kernel math.matrices math.order math.ranges
math.statistics math.vectors random sequences strings ;

CHAR: X -15 15 [a,b] dup cartesian-product concat
[ sum-of-squares 100 225 between? ] filter 100 sample
[ 15 v+n ] map 31 31 32 <matrix> [ matrix-set-nths ] keep
[ >string print ] each
