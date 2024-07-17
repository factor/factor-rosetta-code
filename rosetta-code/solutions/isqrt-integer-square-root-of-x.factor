! Sometimes a function is needed to find the integer square root of X,
! where X can be a real non─negative number.
! 
! Often X is actually a non─negative integer.
! 
! For the purposes of this task, X can be an integer or a real number, but
! if it simplifies things in your computer programming language, assume
! it's an integer.
! 
! One of the most common uses of Isqrt is in the division of an integer by
! all factors (or primes) up to the √X of that integer, either to find the
! factors of that integer, or to determine primality.
! 
! An alternative method for finding the Isqrt of a number is to calculate:
! floor( sqrt(X) )
! 
! -   -   where sqrt is the square root function for non─negative real
!         numbers, and
!     -   where floor is the floor function for real numbers.
! 
! If the hardware supports the computation of (real) square roots, the
! above method might be a faster method for small numbers that don't have
! very many significant (decimal) digits.
! 
! However, floating point arithmetic is limited in the number of (binary
! or decimal) digits that it can support.
! 
! Pseudo─code using quadratic residue:
! 
! For this task, the integer square root of a non─negative number will be
! computed using a version of quadratic residue, which has the advantage
! that no floating point calculations are used, only integer arithmetic.
! 
! Furthermore, the two divisions can be performed by bit shifting, and the
! one multiplication can also be be performed by bit shifting or
! additions.
! 
! The disadvantage is the limitation of the size of the largest integer
! that a particular computer programming language can support.
! 
! Pseudo─code of a procedure for finding the integer square root of X (all
! variables are integers):
! 
!          q ◄── 1                                /*initialize  Q  to unity.  */
!                                   /*find a power of 4 that's greater than X.*/
!                   perform  while q <= x         /*perform while  Q <= X.    */
!                   q ◄── q * 4                   /*multiply  Q  by  four.    */
!                   end  /*perform*/
!                                                 /*Q  is now greater than  X.*/
!          z ◄── x                                /*set  Z  to the value of X.*/
!          r ◄── 0                                /*initialize  R  to zero.   */
!                   perform  while q > 1          /*perform while  Q > unity. */
!                   q ◄── q ÷ 4                   /*integer divide by  four.  */
!                   t ◄── z - r - q               /*compute value of  T.      */
!                   r ◄── r ÷ 2                   /*integer divide by  two.   */
!                   if t >= 0  then do            
!                                   z ◄── t       /*set  Z  to value of  T.   */
!                                   r ◄── r + q   /*compute new value of  R.  */
!                                   end
!                   end  /*perform*/
!                                                 /*R  is now the  Isqrt(X).  */
! 
!          /* Sidenote: Also, Z is now the remainder after square root (i.e.  */
!          /*           R^2 + Z = X, so if Z = 0 then X is a perfect square). */
! 
! Another version for the (above) 1^(st) perform is:
! 
!                   perform  until q > X          /*perform until  Q > X.     */
!                   q ◄── q * 4                   /*multiply  Q  by  four.    */
!                   end  /*perform*/
! 
! Integer square roots of some values:
! 
! Isqrt( 0)  is   0               Isqrt(60)  is  7                Isqrt( 99)  is   9
! Isqrt( 1)  is   1               Isqrt(61)  is  7                Isqrt(100)  is  10
! Isqrt( 2)  is   1               Isqrt(62)  is  7                Isqrt(102)  is  10
! Isqrt( 3)  is   1               Isqrt(63)  is  7
! Isqrt( 4)  is   2               Isqrt(64)  is  8                Isqet(120)  is  10
! Isqrt( 5)  is   2               Isqrt(65)  is  8                Isqrt(121)  is  11
! Isqrt( 6)  is   2               Isqrt(66)  is  8                Isqrt(122)  is  11
! Isqrt( 7)  is   2               Isqrt(67)  is  8
! Isqrt( 8)  is   2               Isqrt(68)  is  8                Isqrt(143)  is  11
! Isqrt( 9)  is   3               Isqrt(69)  is  8                Isqrt(144)  is  12
! Isqrt(10)  is   3               Isqrt(70)  is  8                Isqrt(145)  is  12
! 
! Task:
! 
! Compute and show all output here (on this page) for:
! 
! -   -   the Isqrt of the integers from 0 ───► 65 (inclusive), shown in a
!         horizontal format.
!     -   the Isqrt of the odd powers from 7¹ ───► 773 (inclusive), shown
!         in a vertical format.
!     -   use commas in the displaying of larger numbers.
! 
! You can show more numbers for the 2^(nd) requirement if the displays
! fits on one screen on Rosetta Code.
! 
! If your computer programming language only supports smaller integers,
! show what you can.
! 
! Related tasks:
! 
! -   -   sequence of non-squares
!     -   integer roots
!     -   square root by hand

USING: formatting io kernel locals math math.functions
math.ranges prettyprint sequences tools.memory.private ;

:: isqrt ( x -- n )
    1 :> q!
    [ q x > ] [ q 4 * q! ] until
    x 0 :> ( z! r! )    
    [ q 1 > ] [
        q 4 /i q!
        z r - q - :> t
        r -1 shift r!
        t 0 >= [
            t z!
            r q + r!
        ] when
    ] while
    r ;

"Integer square root for numbers 0 to 65 (inclusive):" print
66 <iota> [ bl ] [ isqrt pprint ] interleave nl nl

: align ( str str str -- ) "%2s%85s%44s\n" printf ;
: show ( n -- ) dup 7 swap ^ dup isqrt [ commas ] tri@ align ;

"x" "7^x" "isqrt(7^x)" align
"-" "---" "----------" align
1 73 2 <range> [ show ] each
