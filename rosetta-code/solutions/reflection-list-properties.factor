! Task:
! 
! The goal is to get the properties of an object, as names, values or
! both.
! 
! Some languages support dynamic properties, which in general can only be
! inspected if a class' public API includes a way of listing them.

USING: assocs kernel math mirrors prettyprint strings ;

TUPLE: foo
{ bar string }
{ baz string initial: "hi" }
{ baxx integer initial: 50 read-only } ;
C: <foo> foo

"apple" "banana" 200 <foo> <mirror>
[ >alist ] [ object-slots ] bi [ . ] bi@
