! Create a sequence (array, list, whatever) consisting of n distinct,
! initialized items of the same type. n should be determined at runtime.
! 
! By distinct we mean that if they are mutable, changes to one do not
! affect all others; if there is an appropriate equality operator they are
! considered unequal; etc. The code need not specify a particular kind of
! distinction, but do not use e.g. a numeric-range generator which does
! not generalize.
! 
! By initialized we mean that each item must be in a well-defined state
! appropriate for its type, rather than e.g. arbitrary previous memory
! contents in an array allocation. Do not show only an initialization
! technique which initializes only to "zero" values (e.g. calloc() or
! int a[n] = {}; in C), unless user-defined types can provide definitions
! of "zero" for that type.
! 
! This task was inspired by the common error of intending to do this, but
! instead creating a sequence of n references to the same mutable object;
! it might be informative to show the way to do that as well, both as a
! negative example and as how to do it when that's all that's actually
! necessary.
! 
! This task is most relevant to languages operating in the
! pass-references-by-value style (most object-oriented, garbage-collected,
! and/or 'dynamic' languages).
! 
! See also: Closures/Value capture

1000 [ { 1 } clone ] replicate
