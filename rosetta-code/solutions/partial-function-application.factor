! Partial function application is the ability to take a function of many
! parameters and apply arguments to some of the parameters to create a new
! function that needs only the application of the remaining arguments to
! produce the equivalent of applying all arguments to the original
! function.
! 
! E.g:
! 
!     Given values v1, v2
!     Given f(param1, param2)
!     Then partial(f, param1=v1) returns f'(param2)
!     And f(param1=v1, param2=v2) == f'(param2=v2) (for any value v2)
! 
! Note that in the partial application of a parameter, (in the above case
! param1), other parameters are not explicitly mentioned. This is a
! recurring feature of partial function application.
! 
! Task
! 
! -   Create a function fs( f, s ) that takes a function, f( n ), of one
!     value and a sequence of values s.
! 
! Function fs should return an ordered sequence of the result of applying function f to every value of s in turn.
! 
! -   Create function f1 that takes a value and returns it multiplied by
!     2.
! -   Create function f2 that takes a value and returns it squared.
! 
! -   Partially apply f1 to fs to form function fsf1( s )
! -   Partially apply f2 to fs to form function fsf2( s )
! 
! -   Test fsf1 and fsf2 by evaluating them with s being the sequence of
!     integers from 0 to 3 inclusive and then the sequence of even
!     integers from 2 to 8 inclusive.
! 
! Notes
! 
! -   In partially applying the functions f1 or f2 to fs, there should be
!     no explicit mention of any other parameters to fs, although
!     introspection of fs within the partial applicator to find its
!     parameters is allowed.
! -   This task is more about how results are generated rather than just
!     getting results.


