! The n + 1 Bernstein basis polynomials of degree n are defined as
! 
! $$b_{k,n}(t) = \binom{n}{k} t^{k} \left( 1 - t \right)^{n - k},\quad k = 0,\ldots,n$$
! Any real polynomial can written as a linear combination of such
! Bernstein basis polynomials. Let us call the coefficients in such linear
! combinations Bernstein coefficients.
! 
! The goal of this task is to write subprograms for working with degree-2
! and degree-3 Bernstein coefficients. A programmer is likely to have to
! deal with such representations. For example, OpenType fonts store glyph
! outline data as as either degree-2 or degree-3 Bernstein coefficients.
! 
! The task is as follows:
! 
! 1.  Write a subprogram (which we will call Subprogram (1)) to transform
!     the ordinary monomial coefficients of a real polynomial, of degree 2
!     or less, to Bernstein coefficients for the degree-2 basis.
! 2.  Write Subprogram (2) to evaluate, at a given point, a real
!     polynomial written in degree-2 Bernstein coefficients. For this use
!     de Casteljau's algorithm.
! 3.  Write Subprogram (3) to transform the monomial coefficients of a
!     real polynomial, of degree 3 or less, to Bernstein coefficients for
!     degree 3.
! 4.  Write Subprogram (4) to evaluate, at a given point, a real
!     polynomial written in degree-3 Bernstein coefficients. Use de
!     Casteljau's algorithm.
! 5.  Write Subprogram (5) to transform Bernstein coefficients for degree
!     2 to Bernstein coefficients for degree 3.
! 6.  For the following polynomials, use Subprogram (1) to find Bernstein
!     coefficients for the degree-2 basis: p(x) = 1, q(x) = 1 + 2x + 3x².
!     Display the results.
! 7.  Use Subprogram (2) to evaluate p(x) and q(x) at x = 0.25 and at
!     x = 7.50. Display the results. Optionally also evaluate the
!     polynomials in the monomial basis and display the results. (For the
!     monomial basis it is best to use a Horner scheme.)
! 8.  Use Subprogram (3) to find degree-3 Bernstein coefficients for p(x)
!     and q(x), and additionally also for r(x) = 1 + 2x + 3x² + 4x³.
!     Display the results.
! 9.  Use Subprogram (4) to evaluate p(x), q(x), and r(x) at x = 0.25 and
!     x = 7.50. Display the results. Optionally also evaluate them in the
!     monomial basis and display the results. (You may have done that
!     already for p(x) and q(x).)
! 10. Use Subprogram (5) to get degree-3 Bernstein coefficients for p(x)
!     and q(x) from their degree-2 Bernstein coefficients. Display the
!     results.
! 
! ALGOL 60 and Python implementations are provided as initial examples.
! The latter does the optional monomial-basis evaluations.
! 
! You can use the following algorithms. They are written in unambiguous
! Algol 60 reference language instead of a made up pseudo-language. The
! ALGOL 60 example was necessary to check my work, but these reference
! versions are in the actual standard language designed for the printing
! of algorithms.
! 
! procedure tobern2 (a0, a1, a2, b0, b1, b2);
!  value a0, a1, a2; comment pass by value;
!  real a0, a1, a2;
!  real b0, b1, b2;
! comment Subprogram (1): transform monomial coefficients a0, a1, a2 to Bernstein coefficients b0, b1, b2;
! begin
!  b0 := a0;
!  b1 := a0 + ((1/2) × a1);
!  b2 := a0 + a1 + a2
! end tobern2;
! 
! real procedure evalbern2 (b0, b1, b2, t);
!  value b0, b1, b2, t;
!  real b0, b1, b2, t;
! comment Subprogram (2): evaluate, at t, the polynomial with Bernstein coefficients b0, b1, b2. Use de Casteljau’s algorithm;
! begin
!  real s, b01, b12, b012;
!  s := 1 - t;
!  b01 := (s × b0) + (t × b1);
!  b12 := (s × b1) + (t × b2);
!  b012 := (s × b01) + (t × b12);
!  evalbern2 := b012
! end evalbern2;
! 
! procedure tobern3 (a0, a1, a2, a3, b0, b1, b2, b3);
!  value a0, a1, a2, a3;
!  real a0, a1, a2, a3;
!  real b0, b1, b2, b3;
! comment Subprogram (3): transform monomial coefficients a0, a1, a2, a3 to Bernstein coefficients b0, b1, b2, b3;
! begin
!  b0 := a0;
!  b1 := a0 + ((1/3) × a1);
!  b2 := a0 + ((2/3) × a1) + ((1/3) × a2);
!  b3 := a0 + a1 + a2 + a3
! end tobern3;  
! 
! real procedure evalbern3 (b0, b1, b2, b3, t);
!  value b0, b1, b2, b3, t;
!  real b0, b1, b2, b3, t;
! comment Subprogram (4): evaluate, at t, the polynomial with Bernstein coefficients b0, b1, b2, b3. Use de Casteljau's algorithm;
! begin
!  real s, b01, b12, b23, b012, b123, b0123;
!  s := 1 - t;
!  b01 := (s × b0) + (t × b1);
!  b12 := (s × b1) + (t × b2);
!  b23 := (s × b2) + (t × b3);
!  b012 := (s × b01) + (t × b12);
!  b123 := (s × b12) + (t × b23);
!  b0123 := (s × b012) + (t × b123);
!  evalbern3 := b0123
! end evalbern3;
! 
! procedure bern2to3 (q0, q1, q2, c0, c1, c2, c3);
!  value q0, q1, q2;
!  real q0, q1, ''q2;
!  real c0, c1, c2, c3;
! comment Subprogram (5): transform the quadratic Bernstein coefficients q0, q1, q2 to the cubic Bernstein coefficients c0, c1, c2, c3;
! begin
!  c0 := q0;
!  c1 := ((1/3) × q0) + ((2/3) × q1);
!  c2 := ((2/3) × q1) + ((1/3) × q2);
!  c3 := q2
! end bern2to3;


