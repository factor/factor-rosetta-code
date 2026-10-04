! Task
! 
!     
! 
! Given an existing list of arguments (which may or may not be named)
! stored in a data structure, show how to apply a function to them.
! 
! There are two common tools that languages may have for doing this:
! 
! - - An "unpack"/"spread"/"splat" operator (which may be a function or a
!     method instead).
!   - A higher-order function which takes another function and a list (or
!     array, tuple, vector, whatever) as its two arguments.
! 
! Languages that do not have first-class functions or an "unpack"
! equivalent are exempt from this task, although if they have other ways
! of doing this you are free to demonstrate them.
! 
! Additional guidance
! 
!     
! 
! This task is NOT the same as Apply a callback to an array. If you are
! using higher-order functions, your language's equivalent of map will
! solve that task but not this one. Explicitly, map(f, [x, y, z]) returns
! [f(x), f(y), f(z)]; what this task asks for is a function apply (which
! need not have that name) for which apply(f, [x, y, z]) returns
! f(x, y, z).
! 
! Related tasks
! 
!     
! 
! - - Call a function
!   - Named parameters
!   - First-class functions
!   - Higher-order functions
!   - Variadic function
! 
! Category:Functions and subroutines Category:Simple Category:Basic
! language learning

USING: combinators.smart math prettyprint ;

{ 2 3 } [ + ] input<sequence .
