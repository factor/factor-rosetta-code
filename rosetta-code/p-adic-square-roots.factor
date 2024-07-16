! Task.
! 
! Convert rational a/b to its approximate p-adic square root. To check the
! result, square the root and construct rational m/n to compare with
! radicand a/b.
! 
! For rational reconstruction Lagrange's lattice basis reduction algorithm
! is used.
! 
! Recipe: find root and build a sequence of solutions ,
! using the lifting equation with .
! The multipliers are the successive p-adic digits to find.
! 
! If evaluation of overflows, the expansion is cut off and might be too
! short to retrieve the radicand. Setting a higher precision won't help,
! using a programming language with built-in large integer support will.
! 
! Related task.
! 
! p-Adic numbers, basic
! 
! Reference.
! 
! 1 Solving
! 
! __TOC__

