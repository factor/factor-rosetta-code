! A number wheel has:
! 
! -   A name which is an uppercase letter.
! -   A set of ordered values which are either numbers or names.
! 
! A number is generated/yielded from a named wheel by:
! 
!     1. Starting at the first value of the named wheel and advancing
!     through subsequent values and wrapping around to the first value to
!     form a "wheel":
! 
!         1.a If the value is a number, yield it.
!         1.b If the value is a name, yield the next value from the named
!         wheel
!         1.c Advance the position of this wheel.
! 
! Given the wheel
! 
!     A: 1 2 3
! 
! the number 1 is first generated, then 2, then 3, 1, 2, 3, 1, ...
! 
! Note: When more than one wheel is defined as a set of intersecting
! wheels then the first named wheel is assumed to be the one that values
! are generated from.
! 
! Examples:
! 
! Given the wheels:
! 
!    A: 1 B 2
!    B: 3 4
! 
! The series of numbers generated starts:
! 
!    1, 3, 2, 1, 4, 2, 1, 3, 2, 1, 4, 2, 1, 3, 2...
! 
! The intersections of number wheels can be more complex, (and might loop
! forever), and wheels may be multiply connected.
! 
! Note: If a named wheel is referenced more than once by one or many other
! wheels, then there is only one position of the wheel that is advanced by
! each and all references to it.
! 
! E.g.
! 
!  A:  1 D D
!  D:  6 7 8
!  Generates:
!    1 6 7 1 8 6 1 7 8 1 6 7 1 8 6 1 7 8 1 6 ...    
! 
! Task:
! 
! Generate and show the first twenty terms of the sequence of numbers
! generated from these groups:
! 
!    Intersecting Number Wheel group:
!      A:  1 2 3
!    
!    Intersecting Number Wheel group:
!      A:  1 B 2
!      B:  3 4
!    
!    Intersecting Number Wheel group:
!      A:  1 D D
!      D:  6 7 8
!    
!    Intersecting Number Wheel group:
!      A:  1 B C
!      B:  3 4
!      C:  5 B
! 
! Show your output here, on this page.

USING: generalizations io kernel prettyprint
rosetta-code.number-wheels ;

NUMBER-WHEELS:
A: 1 2 3
;

NUMBER-WHEELS:
A: 1 B 2
B: 3 4
;

NUMBER-WHEELS:
A: 1 D D
D: 6 7 8
;

NUMBER-WHEELS:
A: 1 B C
B: 3 4
C: 5 B
;

[ 
    "Intersecting number wheel group:" print
    [ . ] [ "Generates:" print 20 swap .take nl ] bi
] 4 napply
