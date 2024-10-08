! f The Babylonian spiral is a sequence of points in the plane that are
! created so as to continuously minimally increase in vector length and
! minimally bend in vector direction, while always moving from point to
! point on strictly integral coordinates. Of the two criteria of length
! and angle, the length has priority.
! 
! Examples
! 
! P(1) and P(2) are defined to be at (x = 0, y = 0) and (x = 0, y = 1).
! The first vector is from P(1) to P(2). It is vertical and of length 1.
! Note that the square of that length is 1.
! 
! Next in sequence is the vector from P(2) to P(3). This should be the
! smallest distance to a point with integral (x, y) which is longer than
! the last vector (that is, 1). It should also bend clockwise more than
! zero radians, but otherwise to the least degree.
! 
! The point chosen for P(3) that fits criteria is (x = 1, y = 2). Note the
! length of the vector from P(2) to P(3) is √2, which squared is 2. The
! lengths of the vectors thus determined can be given by a sorted list of
! possible sums of two integer squares, including 0 as a square.
! 
! Task
! 
! Find and show the first 40 (x, y) coordinates of the Babylonian spiral.
! 
! Stretch task
! 
! Show in your program how to calculate and plot the first 10000 points in
! the sequence. Your result should look similar to the graph shown at the
! OEIS: []
! 
! See also
! 
! * OEIS:A256111 - squared distance to the origin of the n-th vertex on a Babylonian Spiral.
! * OEIS:A297346 - List of successive x-coordinates in the Babylonian Spiral.
! * OEIS:A297347 - List of successive y-coordinates in the Babylonian Spiral.


