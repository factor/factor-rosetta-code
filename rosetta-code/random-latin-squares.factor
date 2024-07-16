! A Latin square of size n is an arrangement of n symbols in an n-by-n
! square in such a way that each row and column has each symbol appearing
! exactly once.
! 
! For the purposes of this task, a random Latin square of size n is a
! Latin square constructed or generated by a probabilistic procedure such
! that the probability of any particular Latin square of size n being
! produced is non-zero.
! 
! Example n=4 randomised Latin square:
! 
!     0 2 3 1
!     2 1 0 3
!     3 0 1 2
!     1 3 2 0
! 
! Task:
! 
! 1.  Create a function/routine/procedure/method/... that given n
!     generates a randomised Latin square of size n.
! 2.  Use the function to generate and show here, two randomly generated
!     squares of size 5.
! 
! Note:
! 
! Strict uniformity in the random generation is a hard problem and not a
! requirement of the task.
! 
! Related tasks:
! 
! -   Latin Squares in reduced form/Randomizing using Jacobson and
!     Matthews’ Technique
! -   Latin Squares in reduced form
! 
! Reference:
! 
! -   Wikipedia: Latin square
! -   OEIS: A002860

USING: arrays combinators.extras fry io kernel math.matrices
prettyprint random sequences sets ;
IN: rosetta-code.random-latin-squares

: rand-permutation ( n -- seq ) <iota> >array randomize ;
: ls? ( n -- ? ) [ all-unique? ] column-map t [ and ] reduce ;
: (ls) ( n -- m ) dup '[ _ rand-permutation ] replicate ;
: ls ( n -- m ) dup (ls) dup ls? [ nip ] [ drop ls ] if ;
: random-latin-squares ( -- ) [ 5 ls simple-table. nl ] twice ;

MAIN: random-latin-squares