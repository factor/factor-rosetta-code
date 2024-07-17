! The objective of this task is to parse in a difficult polynomial, and
! generate a "pretty" representation of the polynomial in Unicode.
! 
! In the target language define a "polynomial" object (or structure or
! record). Using this object also define the routines for parsing a
! polynomial as input, and generating a normalised Unicode representation
! of the polynomial as output.
! 
! Task details:
! 
! Given a string containing an untidy Unicode polynomial, e.g.
! 
!     -0.00x⁺¹⁰ + 1.0·x ** 5 + -2e0x^4 + +0,042.00 × x ⁺³ + +.0x² + 20.000 000 000x¹ - -1x⁺⁰ + .0x⁻¹ + 20.x¹
! 
! Coerce (or convert) the string into the "polynomial" object, at the same
! time normalise the polynomial to a canonical form. The ideal normalised
! output (in this example) would be:
! 
!     x⁵ - 2x⁴ + 42x³ + 40x + 1
! 
! +----------------------------------+----------------------------------+
! | Description                      | Input example test cases         |
! +==================================+==================================+
! | "Zero" coefficients are removed  | x⁵ - 2x⁴ + 42x³ + 0x² + 40x + 1  |
! +----------------------------------+----------------------------------+
! | The "0" polynomial case          | 0e+0x⁰⁰⁷+00e-00x+0x+.0           |
! |                                  | x⁰⁵-0.x⁴+0×x³+0x⁻⁰+0/x+0/x³+0x⁻⁵ |
! +----------------------------------+----------------------------------+
! | "One" coefficients are           | 1x⁵ - 2x⁴ + 42x³ + 40x + 1x⁰     |
! | normalised                       |                                  |
! +----------------------------------+----------------------------------+
! | Signs are normalised             | +x⁺⁵ + -2x⁻⁻⁴ + 42x⁺⁺³ + +40x -  |
! |                                  | -1                               |
! +----------------------------------+----------------------------------+
! | ASCII representations are parsed | x^5 - 2x**4 + 42x^3 + 40x + 1    |
! +----------------------------------+----------------------------------+
! | Non-ASCII representations are    | x↑5 - 2.00·x⁴ + 42.00·x³ +       |
! | parsed                           | 40.00·x + 1 (c.f. ↑ & ·)         |
! +----------------------------------+----------------------------------+
! | Specifically permit              | x⁻⁵ - 2⁄x⁴ + 42x⁻³ + 40/x + 1x⁻⁰ |
! | non-polynomials where terms have | (n.b. Unicode Fraction)          |
! | negative exponents               |                                  |
! +----------------------------------+----------------------------------+
! | Spaces in numbers and between    | x⁵ - 2x⁴ + 42.000 000x³ + 40x +  |
! | operators are ignored            | 1                                |
! +----------------------------------+----------------------------------+
! | Single commas are ignored in     | x⁵ - 2x⁴ + 0,042x³ +             |
! | numbers                          | 40.000,000x + 1                  |
! +----------------------------------+----------------------------------+
! | A coefficient may be duplicated, | 0x⁷ + 10x + 10x + x⁵ - 2x⁴ +     |
! | zero, or missing                 | 42x³ + 20x + 1                   |
! +----------------------------------+----------------------------------+
! | Support Scientific notation and  | 1E0x⁵ - 2,000,000.e-6x⁴ +        |
! | optionally                       | 4.2⏨1x³ + .40e+2x + 1            |
! | support Unicode Decimal Exponent |                                  |
! | Symbol U+23E8/⏨                  |                                  |
! +----------------------------------+----------------------------------+
! | Unicode characters that must be  | ⁰ ¹ ² ³ ⁴ ⁵ ⁶ ⁷ ⁸ ⁹ ⁻ ⁺ · × ⁄ ↑  |
! | specifically supported are:      | ⏨. Where · & × are               |
! |                                  | multiplication, and ⁄ is Unicode |
! |                                  | Fraction.                        |
! +----------------------------------+----------------------------------+
! | Support fractions for both input | x⁵ - x⁴⁄2 + 405x³⁄4 + 403x⁄4 +   |
! | and output.                      | 5⁄2                              |
! |                                  | On output round the decimal to   |
! |                                  | appropriate fraction.            |
! +----------------------------------+----------------------------------+
! | Optionally support Unicode       | x⁵ - ½x⁴ + 101¼x³ + 100¾x + 2½   |
! | Vulgar fractions for both input  | On output round the decimal to   |
! | and output.                      | appropriate fraction.            |
! | ¼ ½ ¾ ⅐ ⅑ ⅒ ⅓ ⅔ ⅕ ⅖ ⅗ ⅘ ⅙ ⅚ ⅛ ⅜  |                                  |
! | ⅝ ⅞ ↉                            |                                  |
! +----------------------------------+----------------------------------+
! 
! : Specific examples of Unicode and polynomial texts to be parsed as test
! cases.
! 
! There are (at least) three possible ways of achieving this task.
! 
! -   Using an external parsing library.
! -   Using a built-in parsing/formatting library.
! -   Coding a custom polynomial parsing routing.
! 
! Either one, or all of these approaches are accepted and appear as a
! subtitle.
! 
! Category:Mathematics


