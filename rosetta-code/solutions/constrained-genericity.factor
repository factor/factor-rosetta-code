! Constrained genericity or bounded quantification means that a
! parametrized type or function (see parametric polymorphism) can only be
! instantiated on types fulfilling some conditions, even if those
! conditions are not used in that function.
! 
! Say a type is called "eatable" if you can call the function eat on it.
! Write a generic type FoodBox which contains a collection of objects of a
! type given as parameter, but can only be instantiated on eatable types.
! The FoodBox shall not use the function eat in any way (i.e. without the
! explicit restriction, it could be instantiated on any type). The
! specification of a type being eatable should be as generic as possible
! in your language (i.e. the restrictions on the implementation of eatable
! types should be as minimal as possible). Also explain the restrictions,
! if any, on the implementation of eatable types, and show at least one
! example of an eatable type.


