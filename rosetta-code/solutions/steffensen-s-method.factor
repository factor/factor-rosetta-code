! Steffensen's method is a numerical method to find the roots of
! functions. It is similar to Newton's method, but, unlike Newton's, does
! not require derivatives. Like Newton's, however, it is prone towards not
! finding a solution at all.
! 
! In this task we will do a root-finding problem that illustrates both the
! advantage—that no derivatives are required—and the disadvantage—that the
! method often gives no answer. We will try to find intersection points of
! two Bézier curves.
! 
! Steffensen's method
! 
! We will be using the variant of Steffensen's method that employs
! Aitken's extrapolation. Aitken's extrapolation is illustrated by the
! following ATS function:
! 
! fun aitken
!      (f  : double -> double,   (* function double to double *)
!       p0 : double)             (* initial fixed point estimate *)
!    : double =
!  let
!    val p1 = f(p0)
!    val p2 = f(p1)
!    val p1m0 = p1 - p0
!  in
!    p0 - (p1m0 * p1m0) / (p2 - (2.0 * p1) + p0)
!  end
! 
! The return value is a function of p0, p1 = f(p0), and p2 = f(f(p0)).
! What one is trying to find is a so-called fixed point of f: a value of p
! such that f(p) = p. Our implementation of Steffensen's method will be to
! repeat Aitken's extrapolation until either a tolerance is satisfied or
! too many iterations have been executed:
! 
! fun steffensen_aitken     (* finds fixed point p such that f(p) = p *)
!      (f       : double -> double, (* function double to double *)
!       pinit   : double,           (* initial estimate *)
!       tol     : double,           (* tolerance *)
!       maxiter : int)              (* maximum number of iterations *)
!    : Option (double) =     (* return a double, IF tolerance is met *)
!  let
!    var p0   : double = pinit
!    var p    : double = aitken (f, p0)
!    var iter : int = 1          (* iteration counter *)
!  in
!    while (abs (p - p0) > tol andalso iter < maxiter)
!      begin
!        p0 := p;
!        p := aitken (f, p0);
!        iter := iter + 1
!      end;
!    if abs (p - p0) > tol then None () else Some (p)
!  end
! 
! The function steffensen_aitken will find a fixed point for us, but how
! can we use that to find a root? In particular, suppose one wants to find
! t such that g(t) = 0. Then what one can do (and what we will try to do)
! is find a fixed point p of f(t) = g(t) + t. In that case,
! p = f(p) = g(p) + p, and therefore g(p) = 0.
! 
! The problem we wish to solve
! 
! Suppose we have two quadratic planar Bézier curves, with control points
! (−1, 0), (0, 10), (1, 0) and (2, 1), (−8, 2), (2, 3), respectively.
! These two parabolas are shown in the following figure. As you can see,
! they intersect at four points.
! 
!     
! 
!         []
! 
! We want to try to find the points of intersection.
! 
! The method we will use is implicitization. In this method, one first
! rewrites one of the curves as an implicit equation in x and y. For this
! we will use the parabola that is convex upwards: it has implicit
! equation 5x² + y − 5 = 0. Then what one does is plug the parametric
! equations of the other curve into the implicit equation. The resulting
! equation is 5(x(t))² + y(t) − 5 = 0, where t is the independent
! parameter for the curve that is convex leftwards. After expansion, this
! will be a degree-4 equation in t. Find its four roots and you have found
! the points of intersection of the two curves.
! 
! That is easier said than done.
! 
! There are excellent ways to solve this problem, but we will not be using
! those. Our purpose, after all, is to illustrate Steffensen's method:
! both its advantages and its drawbacks. Let us look at an advantage: to
! use Steffensen's method (which requires only function values, not
! derivatives), we do not actually have to expand that polynomial in t.
! Instead, we can evaluate x(t) and y(t) and plug the resulting numbers
! into the implicit equation. What is more, we do not even need to write
! x(t) and y(t) as polynomials, but instead can evaluate them directly
! from their control points, using de Casteljau's algorithm:
! 
! fun de_casteljau
!      (c0 : double,         (* control point coordinates (one axis) *)
!       c1 : double,
!       c2 : double,
!       t  : double)             (* the independent parameter *)
!    : double =                  (* value of x(t) or y(t) *)
!  let
!    val s = 1.0 - t
!    val c01 = (s * c0) + (t * c1)
!    val c12 = (s * c1) + (t * c2)
!    val c012 = (s * c01) + (t * c12)
!  in
!    c012
!  end
! 
! fun x_convex_left_parabola (t : double) : double =
!  de_casteljau (2.0, ~8.0, 2.0, t)
! 
! fun y_convex_left_parabola (t : double) : double =
!  de_casteljau (1.0, 2.0, 3.0, t)
! 
! Plugging x(t) and y(t) into the implicit equation, and writing f(t) as
! the function whose fixed points are to be found:
! 
! fun implicit_equation (x : double, y : double) : double =
!  (5.0 * x * x) + y - 5.0
! 
! fun f (t : double) : double = (* find fixed points of this function *)
!  let
!    val x = x_convex_left_parabola (t)
!    val y = y_convex_left_parabola (t)
!  in
!    implicit_equation (x, y) + t
!  end
! 
! What is left to be done is simple, but tricky: use the steffensen_aitken
! function to find those fixed points. This is where a huge disadvantage
! of Steffensen's method (shared with Newton's method) will be
! illustrated. What is likely to happen is that only some of the
! intersection points will be found. Furthermore, for most of our initial
! estimates, Steffensen's method will not give us an answer at all.
! 
! The task
! 
! Use the methods described above to try to find intersection points of
! the two parabolas. For initial estimates, use
! ${\it pinit}=t_{0}=0.0,0.1,0.2,\cdots,0.9,1.0$. Choose reasonable
! settings for tolerance and maximum iterations. (The ATS example has
! 0.00000001 and 1000, respectively.) For each initial estimate, if
! tolerance was not met before maximum iterations was reached, print that
! there was no answer. On the other hand, if there was an answer, plug the
! resulting value of t into x(t) and y(t) to find the intersection point
! (x, y). Check that that this answer is correct, by plugging (x, y) into
! the implicit equation. If it is not correct, print that Steffensen's
! method gave a spurious answer. Otherwise print the value of (x, y).
! 
! (The ATS example has purposely been written in a fashion to be readable
! as if it were pseudocode. You may use it as a reference implementation.)
! 
! See also
! 
! -   Bézier curves/Intersections


