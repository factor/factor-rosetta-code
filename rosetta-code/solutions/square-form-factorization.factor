! Task.
! 
! Daniel Shanks's Square Form Factorization (SquFoF).
! 
! Invented around 1975, ‘On a 32-bit computer, SquFoF is the clear
! champion factoring algorithm for numbers between 10¹⁰ and 10¹⁸, and will
! likely remain so.’
! 
! An integral binary quadratic form is a polynomial with integer
! coefficients and discriminant . For each positive discriminant there are
! multiple forms .
! 
! The next form in a periodic sequence (cycle) of adjacent forms is found
! by applying a reduction operator rho, essentially a variant of Euclid's
! algorithm for finding the continued fraction of a square root. Using ,
! rho constructs a principal form with .
! 
! SquFoF is based on the existence of cycles containing ambiguous forms,
! with the property that a divides b. They come in pairs of associated
! forms called symmetry points. If an ambiguous form is found (there is
! one for each divisor of D), write the discriminant as and (if a is not
! equal to 1 or 2) N is split.
! 
! Shanks used square forms to jump to a random ambiguous cycle. Fact: if
! any form in an ambiguous cycle is squared, that square form will always
! land in the principal cycle. Conversely, the square root of any form in
! the principal cycle lies in an ambiguous cycle. (Possibly the principal
! cycle itself).
! 
! A square form is easy to find: the last coefficient c is a perfect
! square. This happens about once every ∜N-th cycle step and for even
! indices only. Let rho compute the inverse square root form and track the
! ambiguous cycle backward until the symmetry point is reached. (Taking
! the inverse reverses the cycle). Then a or a/2 divides D and therefore
! N.
! 
! To avoid trivial factorizations, Shanks created a list (queue) to hold
! small coefficients appearing early in the principal cycle, that may be
! roots of square forms found later on. If these forms are skipped, no
! roots land in the principal cycle itself and cases a = 1 or a = 2 do not
! happen.
! 
! Sometimes the cycle length is too short to find a proper square form.
! This is fixed by running five instances of SquFoF in parallel, with
! input N and 3, 5, 7, 11 times N; the discriminants then will have
! different periods. If N is prime or the cube of a prime, there are
! improper squares only and the program will duly report failure.
! 
! Reference.
! 
! 1 A detailed analysis of SquFoF (2007)
! 
! __TOC__
! 
! Category:Prime Numbers


