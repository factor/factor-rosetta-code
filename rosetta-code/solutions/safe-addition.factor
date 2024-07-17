! Implementation of interval arithmetic and more generally fuzzy number
! arithmetic require operations that yield safe upper and lower bounds of
! the exact result.
! 
! For example, for an addition, it is the operations +↑ and +↓ defined as:
! a +↓ b ≤ a + b ≤ a +↑ b.
! 
! Additionally it is desired that the width of the interval (a +↑ b) - (a
! +↓ b) would be about the machine epsilon after removing the exponent
! part.
! 
! Differently to the standard floating-point arithmetic, safe interval
! arithmetic is accurate (but still imprecise).
! 
! I.E.: the result of each defined operation contains (though does not
! identify) the exact mathematical outcome.
! 
! Usually a FPU's have machine +,-,*,/ operations accurate within the
! machine precision.
! 
! To illustrate it, let us consider a machine with decimal floating-point
! arithmetic that has the precision is 3 decimal points.
! 
! If the result of the machine addition is 1.23, then the exact
! mathematical result is within the interval ]1.22, 1.24[.
! 
! When the machine rounds towards zero, then the exact result is within
! [1.23,1.24[. This is the basis for an implementation of safe addition.
! 
! Task;
! 
! Show how +↓ and +↑ can be implemented in your language using the
! standard floating-point type.
! 
! Define an interval type based on the standard floating-point one, and
! implement an interval-valued addition of two floating-point numbers
! considering them exact, in short an operation that yields the interval
! [a +↓ b, a +↑ b].


