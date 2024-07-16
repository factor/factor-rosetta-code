! Assume functions a and b return boolean values, and further, the
! execution of function b takes considerable resources without side
! effects, and is to be minimized.
! 
! If we needed to compute the conjunction (and):
! 
!         x = a() and b()
! 
! Then it would be best to not compute the value of b() if the value of
! a() is computed as false, as the value of x can then only ever be false.
! 
! Similarly, if we needed to compute the disjunction (or):
! 
!         y = a() or b()
! 
! Then it would be best to not compute the value of b() if the value of
! a() is computed as true, as the value of y can then only ever be true.
! 
! Some languages will stop further computation of boolean equations as
! soon as the result is known, so-called short-circuit evaluation of
! boolean expressions
! 
! Task:
! 
! Create two functions named a and b, that take and return the same
! boolean value.
! 
! The functions should also print their name whenever they are called.
! 
! Calculate and assign the values of the following equations to a variable
! in such a way that function b is only called when necessary:
! 
!         x = a(i) and b(j)
!         y = a(i) or b(j)
! 
! If the language does not have short-circuit evaluation, this might be
! achieved with nested if statements.

USING: combinators.short-circuit.smart io prettyprint ;
IN: rosetta-code.short-circuit

: a ( ? -- ? ) "(a)" write ;
: b ( ? -- ? ) "(b)" write ;

"f && f = " write { [ f a ] [ f b ] } && .
"f || f = " write { [ f a ] [ f b ] } || .
"f && t = " write { [ f a ] [ t b ] } && .
"f || t = " write { [ f a ] [ t b ] } || .
"t && f = " write { [ t a ] [ f b ] } && .
"t || f = " write { [ t a ] [ f b ] } || .
"t && t = " write { [ t a ] [ t b ] } && .
"t || t = " write { [ t a ] [ t b ] } || .
