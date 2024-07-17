! Lyness's (1969) Modified Adaptive Simpson's method
! (doi:10.1145/321526.321537) is a numerical quadrature method that
! recursively bisects the interval until the precision is high enough.
! 
! Write an implementation of quadrature by adaptive Simpson’s method. Use
! the implementation to estimate the definite integral of sin(x) from 0
! to 1. Show your output.
! 
! You can use the following pseudocode, which includes Lyness's
! modifications 1, 2, and 3.
! 
! +----------------------------------------------------------------------+
! | ; Lyness's Adaptive Simpson's Rule, Modifications 1, 2, 3            |
! | procedure simpson_rule(f, a, fa, b, fb)                              |
! |     m := (a + b) / 2                                                 |
! |     fm := f(m)                                                       |
! |     h := b - a                                                       |
! |     return multiple [m, fm, (h / 6) * (fa + 4*fm + fb)]              |
! |                                                                      |
! | pr                                                                   |
! | ocedure recursive_simpson(f, a, fa, b, fb, tol, whole, m, fm, depth) |
! |     lm, flm, left  := simpson_rule(f, a, fa, m, fm)                  |
! |     rm, frm, right := simpson_rule(f, m, fm, b, fb)                  |
! |     delta := left + right - whole                                    |
! |     tol' := tol / 2                                                  |
! |     if depth <= 0 or tol' == tol or abs(delta) <= 15 * tol:          |
! |         return left + right + (delta / 15)                           |
! |     else:                                                            |
! |         return r                                                     |
! | ecursive_simpson(f, a, fa, m, fm, tol', left , lm, flm, depth - 1) + |
! |                                                                      |
! |  recursive_simpson(f, m, fm, b, fb, tol', right, rm, frm, depth - 1) |
! |                                                                      |
! | procedure quad_asr(f, a, b, tol, depth)                              |
! |    fa := f(a)                                                        |
! |    fb := f(b)                                                        |
! |    m, fm, whole := simpson_rule(f, a, fa, b, fb)                     |
! |                                                                      |
! |  return recursive_simpson(f, a, fa, b, fb, tol, whole, m, fm, depth) |
! +----------------------------------------------------------------------+
! 
! : Pseudocode: Simpson's method, adaptive

USING: formatting kernel locals math math.functions math.ranges
sequences ;
IN: rosetta-code.simpsons

:: simps ( f a b n -- x )
    n even?
    [ n "n must be even; %d was given" sprintf throw ] unless
    b a - n / :> h
    1 n 2 <range> 2 n 1 - 2 <range>
    [ [ a + h * f call ] map-sum ] bi@ [ 4 ] [ 2 ] bi*
    [ * ] 2bi@ a b [ f call ] bi@ + + + h 3 / * ; inline

[ sin ] 0 1 100 simps
"Simpson's rule integration of sin from 0 to 1 is: %u\n" printf
