! Elliptic curves are sometimes used in cryptography as a way to perform
! digital signatures.
! 
! The purpose of this task is to implement a simplified (without modular
! arithmetic) version of the elliptic curve arithmetic which is required
! by the elliptic curve DSA protocol.
! 
! In a nutshell, an elliptic curve is a bi-dimensional curve defined by
! the following relation between the x and y coordinates of any point on
! the curve:
! 
!         y² = x³ + ax + b
! 
! a and b are arbitrary parameters that define the specific curve which is
! used.
! 
! For this particular task, we'll use the following parameters:
! 
!          a=0, b=7
! 
! The most interesting thing about elliptic curves is the fact that it is
! possible to define a group structure on it.
! 
! To do so we define an internal composition rule with an additive
! notation +, such that for any three distinct points P, Q and R on the
! curve, whenever these points are aligned, we have:
! 
!          P + Q + R = 0
! 
! Here 0 (zero) is the infinity point, for which the x and y values are
! not defined. It's basically the same kind of point which defines the
! horizon in projective geometry.
! 
! We'll also assume here that this infinity point is unique and defines
! the neutral element of the addition.
! 
! This was not the definition of the addition, but only its desired
! property. For a more accurate definition, we proceed as such:
! 
! Given any three aligned points P, Q and R, we define the sum S = P + Q
! as the point (possibly the infinity point) such that S, R and the
! infinity point are aligned.
! 
! Considering the symmetry of the curve around the x-axis, it's easy to
! convince oneself that two points S and R can be aligned with the
! infinity point if and only if S and R are symmetric of one another
! towards the x-axis (because in that case there is no other candidate
! than the infinity point to complete the alignment triplet).
! 
! S is thus defined as the symmetric of R towards the x axis.
! 
! The task consists in defining the addition which, for any two points of
! the curve, returns the sum of these two points. You will pick two random
! points on the curve, compute their sum and show that the symmetric of
! the sum is aligned with the two initial points.
! 
! You will use the a and b parameters of secp256k1, i.e. respectively zero
! and seven.
! 
! Hint: You might need to define a "doubling" function, that returns P+P
! for any given point P.
! 
! Extra credit: define the full elliptic curve arithmetic (still not
! modular, though) by defining a "multiply" function that returns,
! 
! for any point P and integer n, the point P + P + ... + P (n times).

