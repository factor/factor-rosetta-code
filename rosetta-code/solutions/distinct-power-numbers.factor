! Task:
! 
! Compute all combinations of a^(b) where a and b are integers between 2
! and 5 inclusive.
! 
! Place them in numerical order, with any repeats removed.
! 
! You should get the following sequence of 15 distinct terms:
! 
! 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

USING: kernel math.functions math.ranges prettyprint sequences
sets sorting ;

2 5 [a,b] dup [ ^ ] cartesian-map concat members natural-sort .
