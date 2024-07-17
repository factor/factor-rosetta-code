! Task:
! 
! Find and show sum of first n cubes, where n < 50 (ie show 50 entries for
! n=0..49)

USING: grouping math math.functions prettyprint sequences ;

50 <iota> 0 [ 3 ^ + ] accumulate* 10 group simple-table.
