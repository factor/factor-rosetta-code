! Task:
! 
! Show how to explicitly allocate and deallocate blocks of memory in your
! language.
! 
! Show access to different types of memory (i.e., heap, stack, shared,
! foreign) if applicable.

STRUCT: foo { a int } { b foo* } ;

[
    foo malloc-struct &free ! gets freed at end of the current with-destructors scope
    ! do stuff
] with-destructors
