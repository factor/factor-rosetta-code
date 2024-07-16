! A Global Singleton is a class of which only one instance exists within a
! program.
! 
! Any attempt to use non-static members of the class involves performing
! operations on this one instance.

USING: classes.singleton kernel io prettyprint ;
IN: singleton-demo

SINGLETON: bar
GENERIC: foo ( obj -- )
M: bar foo drop "Hello!" print ;
