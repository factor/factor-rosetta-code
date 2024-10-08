! Abstract type is a type without instances or without definition.
! 
! For example in object-oriented programming using some languages,
! abstract types can be partial implementations of other types, which are
! to be derived there-from. An abstract type may provide implementation of
! some operations and/or components. Abstract types without any
! implementation are called interfaces. In the languages that do not
! support multiple inheritance (Ada, Java), classes can, nonetheless,
! inherit from multiple interfaces. The languages with multiple
! inheritance (like C++) usually make no distinction between partially
! implementable abstract types and interfaces. Because the abstract type's
! implementation is incomplete, OO languages normally prevent
! instantiation from them (instantiation must derived from one of their
! descendant classes).
! 
! The term abstract datatype also may denote a type, with an
! implementation provided by the programmer rather than directly by the
! language (a built-in or an inferred type). Here the word abstract means
! that the implementation is abstracted away, irrelevant for the user of
! the type. Such implementation can and should be hidden if the language
! supports separation of implementation and specification. This hides
! complexity while allowing the implementation to change without
! repercussions on the usage. The corresponding software design practice
! is said to follow the information hiding principle.
! 
! It is important not to confuse this abstractness (of implementation)
! with one of the abstract type. The latter is abstract in the sense that
! the set of its values is empty. In the sense of implementation
! abstracted away, all user-defined types are abstract.
! 
! In some languages, like for example in Objective Caml which is strongly
! statically typed, it is also possible to have abstract types that are
! not OO related and are not an abstractness too. These are pure abstract
! types without any definition even in the implementation and can be used
! for example for the type algebra, or for some consistence of the type
! inference. For example in this area, an abstract type can be used as a
! phantom type to augment another type as its parameter.
! 
! Task: show how an abstract type can be declared in the language. If the
! language makes a distinction between interfaces and partially
! implemented types illustrate both.
! 
! Category:Object oriented Category:Type System


