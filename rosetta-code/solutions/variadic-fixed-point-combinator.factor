! A fixed-point combinator is a higher order function fix  that returns
! the fixed point of its argument function. If the function f has one or
! more fixed points, then fix f = f(fix f).
! 
! You can extend a fixed-point combinator to find the fixed point of the
! i-th function out of n given functions:
! fix_(i, n)f₁…f_(n) = f_(i)(fix_(1, n)f₁…f_(n))…(fix_(n, n)f₁…f_(n))
! 
! Task:
! 
! Your task is to implement a variadic fixed-point combinator fix^(*) that
! finds and returns the fixed points of all given functions:
! fix^(*)f₁…f_(n) = ⟨fix_(1, n)f₁…f_(n), …, fix_(n, n)f₁…f_(n)⟩
! 
! The variadic input and output may be implemented using any feature of
! the language (e.g. using lists).
! 
! If possible, try not to use explicit recursion and implement the
! variadic fixed-point combinator using a fixed-point combinator like the
! Y combinator.
! 
! Also try to come up with examples where fix^(*) could actually be
! somewhat useful.
! 
! Related tasks:
! 
! -   Y combinator
! -   Variadic function
! 
! See also:
! 
! -   Mayer Goldberg: A Variadic Extension of Curry’s Fixed-Point
!     Combinator
! 
! Category:Recursion


