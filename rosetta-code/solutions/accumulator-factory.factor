! A problem posed by Paul Graham is that of creating a function that takes
! a single (numeric) argument and which returns another function that is
! an accumulator. The returned accumulator function in turn also takes a
! single numeric argument, and returns the sum of all the numeric values
! passed in so far to that accumulator (including the initial value passed
! when the accumulator was created).
! 
! Rules:
! 
! The detailed rules are at http://paulgraham.com/accgensub.html and are
! reproduced here for simplicity (with additions in small italic text).
! 
!     Before you submit an example, make sure the function
! 
! :# Takes a number n and returns a function (lets call it g), that takes
! a number i, and returns n incremented by the accumulation of i from
! every call of function g(i). Although these exact function and parameter
! names need not be used
! 
! :# Works for any numeric type-- i.e. can take both ints and floats and
! returns functions that can take both ints and floats. (It is not enough
! simply to convert all input to floats. An accumulator that has only seen
! integers must return integers.) (i.e., if the language doesn't allow for
! numeric polymorphism, you have to use overloading or something like
! that)
! 
! :# Generates functions that return the sum of every number ever passed
! to them, not just the most recent. (This requires a piece of state to
! hold the accumulated value, which in turn means that pure functional
! languages can't be used for this task.)
! 
! :# Returns a real function, meaning something that you can use wherever
! you could use a function you had defined in the ordinary way in the text
! of your program. (Follow your language's conventions here.)
! 
! :# Doesn't store the accumulated value or the returned functions in a
! way that could cause them to be inadvertently modified by other code.
! (No global variables or other such things.)
! 
!     E.g. if after the example, you added the following code (in a
!     made-up language) where the factory function is called foo:
!     :
! 
! x(5); foo(3); print x(2.3);
! 
!     It should print 8.3. (There is no need to print the form of the
!     accumulator function returned by foo(3); it's not part of the task
!     at all.)
! 
! Task:
! 
! Create a function that implements the described rules.
! 
! It need not handle any special error cases not described above. The
! simplest way to implement the task as described is typically to use a
! closure, providing the language supports them.
! 
! Where it is not possible to hold exactly to the constraints above,
! describe the deviations.

USE: locals
:: accumulator ( n! -- quot ) [ n + dup n! ] ;

1 accumulator
[ 5 swap call drop ]
[ drop 3 accumulator drop ]
[ 2.3 swap call ] tri .
