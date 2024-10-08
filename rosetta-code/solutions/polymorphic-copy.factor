! An object is polymorphic when its specific type may vary. The types a
! specific value may take, is called class.
! 
! It is trivial to copy an object if its type is known:
! 
!     int x;
!     int y = x;
! 
! Here x is not polymorphic, so y is declared of same type (int) as x. But
! if the specific type of x were unknown, then y could not be declared of
! any specific type.
! 
! The task: let a polymorphic object contain an instance of some specific
! type S derived from a type T. The type T is known. The type S is
! possibly unknown until run time. The objective is to create an exact
! copy of such polymorphic object (not to create a reference, nor a
! pointer to). Let further the type T have a method overridden by S. This
! method is to be called on the copy to demonstrate that the specific type
! of the copy is indeed S.

USING: classes kernel prettyprint serialize ;
TUPLE: A ;
TUPLE: C < A ;
: serial-clone ( obj -- obj' ) object>bytes bytes>object ;

C new
[ clone ]
[ serial-clone ] bi [ class . ] bi@
