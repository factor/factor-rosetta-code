! Task:
! 
! Create two classes Point(x,y) and Circle(x,y,r) with a polymorphic
! function print, accessors for (x,y,r), copy constructor, assignment and
! destructor and every possible default constructors
! 
! Category:Object oriented

QUALIFIED: io  ! there already is print in io

GENERIC: print ( shape -- )

TUPLE: point x y ;
C: <point> point  ! shorthand constructor definition

M: point print drop "Point" io:print ;

TUPLE: circle radius x y ;
C: <circle> circle

M: circle print drop "Circle" io:print ;
