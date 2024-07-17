! Description
! 
! In object oriented programming, the Visitor design pattern is a way of
! separating an algorithm from an object structure on which it operates. A
! practical result of this separation is the ability to add new operations
! to existing object structures without modifying the structures.
! 
! It is one way to follow the open/closed principle which states that:
! "software entities (classes, modules, functions, etc.) should be open
! for extension, but closed for modification".
! 
! The Visitor pattern is one of the twenty-three Gang of Four design
! patterns that facilitate the solution of recurring design problems in
! object-oriented software.
! 
! Operation
! 
! Consider two objects, each of some class type; one is termed the
! element, and the other is the visitor.
! 
! The visitor declares a visit method, which takes the element as an
! argument, for each class of element. Concrete visitors are derived from
! the visitor class and implement these visit methods, each of which
! implements part of the algorithm operating on the object structure. The
! state of the algorithm is maintained locally by the concrete visitor
! class.
! 
! The element declares an accept method to accept a visitor, taking the
! visitor as an argument. Concrete elements, derived from the element
! class, implement the accept method. Composite elements, which maintain a
! list of child objects, typically iterate over these, calling each
! child's accept method.
! 
! Having created the object structure, a program should first instantiate
! the concrete visitors. When an operation is to be performed which is
! implemented using the Visitor pattern, it should then call the accept
! method of the top-level element(s) passing the visitor(s) as arguments.
! 
! Examples
! 
! The Wikipedia article contains examples of the Visitor pattern written
! in: C#, Smalltalk, Go (partial), Java, Common Lisp and Python.
! 
! Task
! 
! Demonstrate the workings of the Visitor pattern in your language by
! translating one (or more) of the Wikipedia examples. If your language is
! one of those for which an example already exists, try to translate one
! of the other examples.
! 
! If you don't know any of the example languages or prefer to use your own
! example, then this is also acceptable.
! 
! If your language does not support the object oriented paradigm at all
! (or only to a limited extent), then try to emulate the intent of the
! pattern with the tools it does have by writing a program which produces
! the same output as one of the Wikipedia examples.
! 
! References
! 
! -   Wikipedia: Visitor pattern
! -   Code Project - The Visitor Pattern Explained


