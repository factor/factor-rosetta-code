! In object-oriented programming class is a set (a transitive closure) of
! types bound by the relation of inheritance. It is said that all types
! derived from some base type T and the type T itself form a class T.
! 
! The first type T from the class T sometimes is called the root type of
! the class.
! 
! A class of types itself, as a type, has the values and operations of its
! own. The operations of are usually called methods of the root type. Both
! operations and values are called polymorphic.
! 
! A polymorphic operation (method) selects an implementation depending on
! the actual specific type of the polymorphic argument.
! 
! The action of choice the type-specific implementation of a polymorphic
! operation is called dispatch. Correspondingly, polymorphic operations
! are often called dispatching or virtual. Operations with multiple
! arguments and/or the results of the class are called multi-methods. A
! further generalization of is the operation with arguments and/or results
! from different classes.
! 
! -   single-dispatch languages are those that allow only one argument or
!     result to control the dispatch. Usually it is the first parameter,
!     often hidden, so that a prefix notation x.f() is used instead of
!     mathematical f(x).
! -   multiple-dispatch languages allow many arguments and/or results to
!     control the dispatch.
! 
! A polymorphic value has a type tag indicating its specific type from the
! class and the corresponding specific value of that type. This type is
! sometimes called the most specific type of a [polymorphic] value. The
! type tag of the value is used in order to resolve the dispatch. The set
! of polymorphic values of a class is a transitive closure of the sets of
! values of all types from that class.
! 
! In many OO languages the type of the class of T and T itself are
! considered equivalent. In some languages they are distinct (like in
! Ada). When class T and T are equivalent, there is no way to distinguish
! polymorphic and specific values.
! 
! Task:
! 
! Create a basic class with a method, a constructor, an instance variable
! and how to instantiate it.
! 
! Category:Object oriented Category:Type System Category:Encyclopedia

TUPLE: my-class foo bar baz ;
M: my-class quux foo>> 20 + ;
C: <my-class> my-class
10 20 30 <my-class> quux ! result: 30
TUPLE: my-child-class < my-class quxx ;
C: <my-child-class> my-child-class 
M: my-child-class foobar 20 >>quux ;
20 20 30 <my-child-class> foobar quux ! result: 30
