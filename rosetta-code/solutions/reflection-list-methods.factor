! Task:
! 
! The goal is to get the methods of an object, as names, values or both.
! 
! Some languages offer dynamic methods, which in general can only be
! inspected if a class' public API includes a way of listing them.
! 
! Category:Programming Tasks Category:Object oriented

USING: io math prettyprint see ;

"The list of methods contained in the generic word + :" print
\ + methods . nl

"The list of methods specializing on the fixnum class:" print
fixnum methods .
