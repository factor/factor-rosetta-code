! An Abundant number is a number n for which the sum of divisors σ(n) >
! 2n,
! 
! or, equivalently, the sum of proper divisors (or aliquot sum) s(n) > n.
! 
! E.G.:
! 
! 12 is abundant, it has the proper divisors 1,2,3,4 & 6 which sum to 16
! ( > 12 or n);
! 
!   or alternately,  has the sigma sum of  1,2,3,4,6 & 12  which sum to  28  ( > 24 or 2n).
! 
! Abundant numbers are common, though even abundant numbers seem to be
! much more common than odd abundant numbers.
! 
! To make things more interesting, this task is specifically about finding
! odd abundant numbers.
! 
! Task
! 
! -   Find and display here: at least the first 25 abundant odd numbers
!     and either their proper divisor sum or sigma sum.
! -   Find and display here: the one thousandth abundant odd number and
!     either its proper divisor sum or sigma sum.
! -   Find and display here: the first abundant odd number greater than
!     one billion (10⁹) and either its proper divisor sum or sigma sum.
! 
! References:
! 
! -   -   OEIS:A005231: Odd abundant numbers (odd numbers n whose sum of
!         divisors exceeds 2n)
!     -   American Journal of Mathematics, Vol. 35, No. 4 (Oct., 1913),
!         pp. 413-422 - Finiteness of the Odd Perfect and Primitive
!         Abundant Numbers with n Distinct Prime Factors (LE Dickson)

USING: arrays formatting io kernel lists lists.lazy math
math.primes.factors sequences tools.memory.private ;
IN: rosetta-code.abundant-odd-numbers

: σ ( n -- sum ) divisors sum ;
: abundant? ( n -- ? ) [ σ ] [ 2 * ] bi > ;
: abundant-odds-from ( n -- list )
    dup even? [ 1 + ] when
    [ 2 + ] lfrom-by [ abundant? ] lfilter ;

: first25 ( -- seq ) 25 1 abundant-odds-from ltake list>array ;
: 1,000th ( -- n ) 999 1 abundant-odds-from lnth ;
: first>10^9 ( -- n ) 1,000,000,001 abundant-odds-from car ;

GENERIC: show ( obj -- )
M: integer show dup σ [ commas ] bi@ "%-6s σ = %s\n" printf ;
M: array show [ show ] each ;

: abundant-odd-numbers-demo ( -- )
    first25 "First 25 abundant odd numbers:"
    1,000th "1,000th abundant odd number:"
    first>10^9 "First abundant odd number > one billion:"
    [ print show nl ] 2tri@ ;

MAIN: abundant-odd-numbers-demo
