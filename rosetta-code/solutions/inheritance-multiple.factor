! Multiple inheritance allows to specify that one class is a subclass of
! several other classes.
! 
! Some languages allow multiple inheritance for arbitrary classes, others
! restrict it to interfaces, some don't allow it at all.
! 
! Task:
! 
! Write two classes (or interfaces) Camera and MobilePhone, then write a
! class CameraPhone which is both a Camera and a MobilePhone.
! 
! There is no need to implement any functions for those classes.
! 
! Category:Object oriented Category:Type System

TUPLE: camera ;
TUPLE: mobile-phone ;
UNION: camera-phone camera mobile-phone ;
