! The following function, due to D. Hickerson, is said to generate "Almost
! integers" by the
! 
! "Almost Integer" page of Wolfram MathWorld, (December 31 2013). (See
! formula numbered 51.)
! 
! The function is: $h(n) = {\operatorname{n}!\over2(\ln{2})^{n+1}}$
! 
! It is said to produce "almost integers" for n between 1 and 17. The
! purpose of the task is to verify this assertion.
! 
! Assume that an "almost integer" has either a nine or a zero as its first
! digit after the decimal point of its decimal string representation
! 
! Task:
! 
! Calculate all values of the function checking and stating which are
! "almost integers".
! 
! Note: Use extended/arbitrary precision numbers in your calculation if
! necessary to ensure you have adequate precision of results as for
! example:
! 
!                h(18) = 3385534663256845326.39...

USING: formatting kernel math math.factorials math.functions
math.ranges sequences ;
IN: rosetta-code.hickerson

: ln2 ( -- x )
    99 [1,b] [ [ 2 swap ^ ] [ * ] bi recip ] map-sum ;

: hickerson ( n -- x ) [ n! ] [ 1 + ln2 swap ^ 2 * ] bi / ;

: almost-int? ( x -- ? ) 10 * truncate 10 mod { 0 9 } member? ;

: hickerson-demo ( -- )
    18 [1,b] [
        dup hickerson dup almost-int?
        "h(%02d) = %23.3f   almost integer? %u\n" printf
    ] each ;

MAIN: hickerson-demo
