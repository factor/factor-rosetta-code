! The roots of a polynomial may be very sensitive for (small) changes in
! its coefficients. Such a polynomial is called ill-conditioned.
! 
! In 1963, Wilkinson gave an example of a nice looking polynomial showing
! this behaviour:
! $w(x) = \prod_{i=1}^{20} (x - i) = (x-1) (x-2) \cdots (x-20)$ Clearly,
! the roots of this polynomial are 1,2,3...20, all real and evenly
! separated. But a very small change in one of the first coefficients made
! some roots displace greatly and even become complex. See Wikipedia.
! 
! Task
! 
! Repeat the first example from the Wikipedia article in your language.
! 
! You will need about 20 digits precision and polynomial root solvers for
! real and complex roots. Use a library or refer to Sturm sequence for
! real roots and Roots of any polynomial for complex roots.
! 
! Extra kudos for comma's in numbers and sorted complex roots. See the
! REXX entry for a possible layout.
! 
! Stretch task
! 
! Wilkinson gave a second example of a much better conditioned polynomial:
! $w_2(x) = \prod_{i=1}^{20} (x - 2^{-i}) = (x-2^{-1})(x-2^{-2}) \cdots (x-2^{-20})$
! with 20 real roots in a geometric progression with ratio 2.
! 
! Show this example in your language. Use a correction of 2^-6 on the
! second coefficient. You will need about 70 digits precision, thus
! Bigfloat support. All roots remain real, so the complex root solver is
! not needed.


