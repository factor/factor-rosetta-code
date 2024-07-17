! Many people have heard of the Golden ratio, phi (φ). Phi is just one of
! a series of related ratios that are referred to as the "Metallic
! ratios".
! 
! The Golden ratio was discovered and named by ancient civilizations as it
! was thought to be the most pure and beautiful (like Gold). The Silver
! ratio was was also known to the early Greeks, though was not named so
! until later as a nod to the Golden ratio to which it is closely related.
! The series has been extended to encompass all of the related ratios and
! was given the general name Metallic ratios (or Metallic means). Somewhat
! incongruously as the original Golden ratio referred to the adjective
! "golden" rather than the metal "gold".
! 
! Metallic ratios are the real roots of the general form equation:
! 
!          x² - bx - 1 = 0 
! 
! where the integer b determines which specific one it is.
! 
! Using the quadratic equation:
! 
!          ( -b ± √(b² - 4ac) ) / 2a = x 
! 
! Substitute in (from the top equation) 1 for a, -1 for c, and recognising
! that -b is negated we get:
! 
!          ( b ± √(b² + 4) ) ) / 2 = x 
! 
! We only want the real root:
! 
!          ( b + √(b² + 4) ) ) / 2 = x 
! 
! When we set b to 1, we get an irrational number: the Golden ratio.
! 
!          ( 1 + √(1² + 4) ) / 2  =  (1 + √5) / 2 = ~1.618033989... 
! 
! With b set to 2, we get a different irrational number: the Silver ratio.
! 
!          ( 2 + √(2² + 4) ) / 2  =  (2 + √8) / 2 = ~2.414213562... 
! 
! When the ratio b is 3, it is commonly referred to as the Bronze ratio, 4
! and 5 are sometimes called the Copper and Nickel ratios, though they
! aren't as standard. After that there isn't really any attempt at
! standardized names. They are given names here on this page, but consider
! the names fanciful rather than canonical.
! 
! Note that technically, b can be 0 for a "smaller" ratio than the Golden
! ratio. We will refer to it here as the Platinum ratio, though it is
! kind-of a degenerate case.
! 
! Metallic ratios where b > 0 are also defined by the irrational continued
! fractions:
! 
!          [b;b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b...] 
! 
! So, The first ten Metallic ratios are:
! 
!     
! 
!         {| class="wikitable" style="text-align: center;"
! 
! |+ Metallic ratios !Name!!b!!Equation!!Value!!Continued fraction!!OEIS
! link |- |Platinum||0||(0 + √4) / 2|| 1||-||- |- |Golden||1||(1 + √5) /
! 2|| 1.618033988749895...||[1;1,1,1,1,1,1,1,1,1,1...]||OEIS:A001622 |-
! |Silver||2||(2 + √8) / 2||
! 2.414213562373095...||[2;2,2,2,2,2,2,2,2,2,2...]||OEIS:A014176 |-
! |Bronze||3||(3 + √13) / 2||
! 3.302775637731995...||[3;3,3,3,3,3,3,3,3,3,3...]||OEIS:A098316 |-
! |Copper||4||(4 + √20) / 2||
! 4.23606797749979...||[4;4,4,4,4,4,4,4,4,4,4...]||OEIS:A098317 |-
! |Nickel||5||(5 + √29) / 2||
! 5.192582403567252...||[5;5,5,5,5,5,5,5,5,5,5...]||OEIS:A098318 |-
! |Aluminum||6||(6 + √40) / 2||
! 6.16227766016838...||[6;6,6,6,6,6,6,6,6,6,6...]||OEIS:A176398 |-
! |Iron||7||(7 + √53) / 2||
! 7.140054944640259...||[7;7,7,7,7,7,7,7,7,7,7...]||OEIS:A176439 |-
! |Tin||8||(8 + √68) / 2||
! 8.123105625617661...||[8;8,8,8,8,8,8,8,8,8,8...]||OEIS:A176458 |-
! |Lead||9||(9 + √85) / 2||
! 9.109772228646444...||[9;9,9,9,9,9,9,9,9,9,9...]||OEIS:A176522 |}
! 
! There are other ways to find the Metallic ratios; one, (the focus of
! this task) is through successive approximations of Lucas sequences.
! 
! A traditional Lucas sequence is of the form:
! 
!    x_(n) = P * x_(n-1) - Q * x_(n-2)
! 
! and starts with the first 2 values 0, 1.
! 
! For our purposes in this task, to find the metallic ratios we'll use the
! form:
! 
!    x_(n) = b * x_(n-1) + x_(n-2)
! 
! ( P is set to b and Q is set to -1. ) To avoid "divide by zero" issues
! we'll start the sequence with the first two terms 1, 1. The initial
! starting value has very little effect on the final ratio or convergence
! rate. Perhaps it would be more accurate to call it a Lucas-like
! sequence.
! 
! At any rate, when b = 1 we get:
! 
!    x_(n) = x_(n-1) + x_(n-2)
! 
!    1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144...
! 
! more commonly known as the Fibonacci sequence.
! 
! When b = 2:
! 
!    x_(n) = 2 * x_(n-1) + x_(n-2)
! 
!    1, 1, 3, 7, 17, 41, 99, 239, 577, 1393...
! 
! And so on.
! 
! To find the ratio by successive approximations, divide the (n+1)th term
! by the nth. As n grows larger, the ratio will approach the b metallic
! ratio.
! 
! For b = 1 (Fibonacci sequence):
! 
!    1/1   = 1
!    2/1   = 2
!    3/2   = 1.5
!    5/3   = 1.666667
!    8/5   = 1.6
!    13/8  = 1.625
!    21/13 = 1.615385
!    34/21 = 1.619048
!    55/34 = 1.617647
!    89/55 = 1.618182
!    etc.
! 
! It converges, but pretty slowly. In fact, the Golden ratio has the
! slowest possible convergence for any irrational number.
! 
! Task
! 
! For each of the first 10 Metallic ratios; b = 0 through 9:
! 
! -   Generate the corresponding "Lucas" sequence.
! -   Show here, on this page, at least the first 15 elements of the
!     "Lucas" sequence.
! -   Using successive approximations, calculate the value of the ratio
!     accurate to 32 decimal places.
! -   Show the value of the approximation at the required accuracy.
! -   Show the value of n when the approximation reaches the required
!     accuracy (How many iterations did it take?).
! 
! Optional, stretch goal - Show the value and number of iterations n, to
! approximate the Golden ratio to 256 decimal places.
! 
! You may assume that the approximation has been reached when the next
! iteration does not cause the value (to the desired places) to change.
! 
! See also
! 
! -   Wikipedia: Metallic mean
! -   Wikipedia: Lucas sequence

USING: combinators decimals formatting generalizations io kernel
math prettyprint qw sequences ;
IN: rosetta-code.metallic-ratios

: lucas ( n a b -- n a' b' ) tuck reach * + ;

: lucas. ( n -- )
    1 pprint bl 1 1 14 [ lucas over pprint bl ] times 3drop nl ;

: approx ( a b -- d ) swap [ 0 <decimal> ] bi@ 32 D/ ;

: approximate ( n -- value iter )
    -1 swap 1 1 0 1 [ 2dup = ]
    [ [ 1 + ] 5 ndip [ lucas 2dup approx ] 2dip drop ] until
    4nip decimal>ratio swap ;

qw{
    Platinum Golden Silver Bronze Copper Nickel Aluminum Iron
    Tin Lead
}
[
    dup dup approximate {
        [ "Lucas sequence for %s ratio " printf ]
        [ "where b = %d:\n" printf ]
        [ "First 15 elements: " write lucas. ]
        [ "Approximated value: %.32f " printf ]
        [ "- reached after  %d  iteration(s)\n\n" printf ]
    } spread
] each-index
