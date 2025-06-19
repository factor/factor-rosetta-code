! Task:
! 
! Create a simple demonstrative example of Currying in a specific
! language.
! 
! Add any historic details as to how the feature made its way into the
! language.
! 
! Category:Functions and subroutines

IN: scratchpad 2 [ 3 + ] curry

--- Data stack:
[ 2 3 + ]
IN: scratchpad call

--- Data stack:
5

IN: scratchpad [ 3 4 ] [ 5 + ] compose

--- Data stack:
[ 3 4 5 + ]
IN: scratchpad call

--- Data stack:
3
9

IN: scratchpad { 1 2 3 4 5 } [ 1 + ] { 2 / } append map

--- Data stack:
{ 1 1+1/2 2 2+1/2 3 }

USE: fry
IN: scratchpad 2 3 '[ _ _ + ]

--- Data stack:
[ 2 3 + ]

IN: scratchpad { 1 2 3 4 5 } [ 1 + ] '[ 2 + @ ] map

--- Data stack:
{ 4 5 6 7 8 }
