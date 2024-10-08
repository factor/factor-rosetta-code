! Task:
! 
! Write a generic swap function or operator which exchanges the values of
! two variables (or, more generally, any two storage places that can be
! assigned), regardless of their types.
! 
! If your solution language is statically typed please describe the way
! your language provides genericity.
! 
! If variables are typed in the given language, it is permissible that the
! two variables be constrained to having a mutually compatible type, such
! that each is permitted to hold the value previously stored in the other
! without a type violation. That is to say, solutions do not have to be
! capable of exchanging, say, a string and integer value, if the
! underlying storage locations are not attributed with types that permit
! such an exchange.
! 
! Generic swap is a task which brings together a few separate issues in
! programming language semantics.
! 
! Dynamically typed languages deal with values in a generic way quite
! readily, but do not necessarily make it easy to write a function to
! destructively swap two variables, because this requires indirection upon
! storage places or upon the syntax designating storage places.
! 
! Functional languages, whether static or dynamic, do not necessarily
! allow a destructive operation such as swapping two variables regardless
! of their generic capabilities.
! 
! Some static languages have difficulties with generic programming due to
! a lack of support for (Parametric Polymorphism).
! 
! Do your best!

swap
