! In object-oriented programming a method is a function associated with a
! particular class or object. In most forms of object oriented
! implementations methods can be static, associated with the class itself;
! or instance, associated with an instance of a class.
! 
! Show how to call a static or class method, and an instance method of a
! class.
! 
! Category:Object oriented Category:Encyclopedia

USING: accessors io kernel literals math sequences ;
IN: rosetta-code.call-a-method

! Define some classes.
SINGLETON: dog
TUPLE: cat sassiness ;

! Define a constructor for cat.
C: <cat> cat

! Define a generic word that dispatches on the object at the top
! of the data stack.
GENERIC: speak ( obj -- )

! Define methods in speak which specialize on various classes.
M: dog speak drop "Woof!" print ;
M: cat speak sassiness>> 0.5 > "Hiss!" "Meow!" ? print ;
M: object speak drop "I don't know how to speak!" print ;

! Call speak on various objects.
! Despite being a method, it's called like any other word.
dog speak
0.75 <cat> speak
0.1 <cat> speak
"bird" speak
