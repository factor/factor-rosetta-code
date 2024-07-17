! Task:
! 
! Find odd and square numbers (>99) under 1.000

USING: io math math.functions math.ranges prettyprint sequences ;

11 1000 sqrt 2 <range> [ bl ] [ sq pprint ] interleave nl
