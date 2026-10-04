! Mathematically,
! 
! - the integers Z are included in the rational numbers Q,
! - which are included in the real numbers R,
! - which can be generalized to the complex numbers C.
! 
! This means that each of those larger sets, and the data types used to
! represent them, include some integers.
! 
! Given a rational, real, or complex number of any type, test whether it
! is mathematically an integer.
! 
! Your code should handle all numeric data types commonly used in your
! programming language.
! 
! Discuss any limitations of your code.
! 
! For the purposes of this task, integerness means that a number could
! theoretically be represented as an integer at no loss of precision
! (given an infinitely wide integer type).
! 
! In other words:
! 
! +-----------------+-----------------+---------------+-----------------+
! | Set             | Common          | C++ type      | Considered an   |
! |                 | representation  |               | integer...      |
! +=================+=================+===============+=================+
! | rational        | fraction        | std::ratio    | ...if its       |
! | numbers Q       |                 |               | denominator is  |
! |                 |                 |               | 1 (in reduced   |
! |                 |                 |               | form)           |
! +-----------------+-----------------+---------------+-----------------+
! | real numbers Z  | fixed-point     |               | ...if it has no |
! | (approximated)  |                 |               | non-zero digits |
! |                 |                 |               | after the       |
! |                 |                 |               | decimal point   |
! |                 +-----------------+---------------+-----------------+
! |                 | floating-point  | float, double | ...if the       |
! |                 |                 |               | number of       |
! |                 |                 |               | significant     |
! |                 |                 |               | decimal places  |
! |                 |                 |               | of its mantissa |
! |                 |                 |               | isn't greater   |
! |                 |                 |               | than its        |
! |                 |                 |               | exponent        |
! +-----------------+-----------------+---------------+-----------------+
! | complex numbers | pair of real    | std::complex  | ...if its real  |
! | C               | numbers         |               | part is         |
! |                 |                 |               | considered an   |
! |                 |                 |               | integer and its |
! |                 |                 |               | imaginary part  |
! |                 |                 |               | is zero         |
! +-----------------+-----------------+---------------+-----------------+
! 
! Optionally, make your code accept a tolerance parameter for fuzzy
! testing. The tolerance is the maximum amount by which the number may
! differ from the nearest integer, to still be considered an integer.
! 
! This is useful in practice, because when dealing with approximate
! numeric types (such as floating point), there may already be round-off
! errors from previous calculations. For example, a float value of
! 0.9999999998 might actually be intended to represent the integer 1.
! 
! +----------------------------+-----------------------------+----------------+
! | Input                      | Output                      | Comment        |
! +================+===========+=======+=====================+================+
! | Type           | Value     | exact | tolerance = 0.00001 |                |
! +----------------+-----------+-------+---------------------+----------------+
! | decimal        | 25.000000 | true                        |                |
! |                +-----------+-------+---------------------+----------------+
! |                | 24.999999 | false | true                |                |
! |                +-----------+-------+---------------------+----------------+
! |                | 25.000100 | false                       |                |
! +----------------+-----------+-----------------------------+----------------+
! | floating-point | -2.1e120  | true                        | This one is    |
! |                |           |                             | tricky,        |
! |                |           |                             | because in     |
! |                |           |                             | most languages |
! |                |           |                             | it is too      |
! |                |           |                             | large to fit   |
! |                |           |                             | into a native  |
! |                |           |                             | integer type.  |
! |                |           |                             | It is,         |
! |                |           |                             | nonetheless,   |
! |                |           |                             | mathematically |
! |                |           |                             | an integer,    |
! |                |           |                             | and your code  |
! |                |           |                             | should         |
! |                |           |                             | identify it as |
! |                |           |                             | such.          |
! |                +-----------+-----------------------------+----------------+
! |                | -5e-2     | false                       |                |
! |                +-----------+-----------------------------+----------------+
! |                | NaN       | false                       |                |
! |                +-----------+-----------------------------+----------------+
! |                | Inf       | false                       | This one is    |
! |                |           |                             | debatable. If  |
! |                |           |                             | your code      |
! |                |           |                             | considers it   |
! |                |           |                             | an integer,    |
! |                |           |                             | that's okay    |
! |                |           |                             | too.           |
! +----------------+-----------+-----------------------------+----------------+
! | complex        | 5.0+0.0i  | true                        |                |
! |                +-----------+-----------------------------+----------------+
! |                | 5-5i      | false                       |                |
! +----------------+-----------+-----------------------------+----------------+
! 
! (The types and notations shown in these tables are merely examples – you
! should use the native data types and number literals of your programming
! language and standard library. Use a different set of test-cases, if
! this one doesn't demonstrate all relevant behavior.)

USING: formatting io kernel math math.functions sequences ;
IN: rosetta-code.test-integerness

GENERIC: integral? ( n -- ? )

M: real integral? [ ] [ >integer ] bi number= ;
M: complex integral? >rect [ integral? ] [ 0 number= ] bi* and ;
    
GENERIC# fuzzy-int? 1 ( n tolerance -- ? )

M: real fuzzy-int? [ dup round - abs ] dip <= ;
M: complex fuzzy-int? [ >rect ] dip swapd fuzzy-int? swap 0
    number= and ;

{
    25/1
    50+2/3
    34/73
    312459210312903/129381293812491284512951
    25.000000
    24.999999
    25.000100
    -2.1e120
    -5e-2
    0/0. ! NaN
    1/0. ! Infinity
    C{ 5.0 0.0 }
    C{ 5 -5 }
    C{ 5 0 }
}
"Number" "Exact int?" "Fuzzy int? (tolerance=0.00001)"
"%-41s %-11s %s\n" printf
[
   [ ] [ integral? ] [ 0.00001 fuzzy-int? ] tri
   "%-41u %-11u %u\n" printf
] each
