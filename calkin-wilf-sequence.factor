! The Calkin-Wilf sequence contains every nonnegative rational number
! exactly once.
! 
! It can be calculated recursively as follows:
! 
!           =   
!          =   for n > 1 
! 
! Task part 1:
! 
! -   Show on this page terms 1 through 20 of the Calkin-Wilf sequence.
! 
! To avoid floating point error, you may want to use a rational number
! data type.
! 
! It is also possible, given a non-negative rational number, to determine
! where it appears in the sequence without calculating the sequence. The
! procedure is to get the continued fraction representation of the
! rational and use it as the run-length encoding of the binary
! representation of the term number, beginning from the end of the
! continued fraction. It only works if the number of terms in the
! continued fraction is odd- use either of the two equivalent
! representations to achieve this:
! 
!          =   
! 
! Example:
! 
! The fraction 9/4 has odd continued fraction representation , giving a
! binary representation of 100011,
! 
! which means 9/4 appears as the 35th term of the sequence.
! 
! Task part 2:
! 
! -   Find the position of the number ⁸³¹¹⁶/₅₁₆₃₉ in the Calkin-Wilf
!     sequence.
! 
! Related tasks:
! 
! -   -   Fusc sequence.
! 
! See also:
! 
! -   Wikipedia entry: Calkin-Wilf tree
! -   Continued fraction
! -   Continued fraction/Arithmetic/Construct from rational number

USING: formatting io kernel lists lists.lazy math
math.continued-fractions math.functions math.parser prettyprint
sequences strings vectors ;

: next-cw ( x -- y ) [ floor dup + ] [ 1 swap - + recip ] bi ;

: calkin-wilf ( -- list ) 1 [ next-cw ] lfrom-by ;

: >continued-fraction ( x -- seq )
    1vector [ dup last integer? ] [ dup next-approx ] until
    dup length even? [ unclip-last 1 - suffix! 1 suffix! ] when ;

: cw-index ( x -- n )
    >continued-fraction <reversed>
    [ even? CHAR: 1 CHAR: 0 ? <string> ] map-index concat bin> ;

! Task
"First 20 terms of the Calkin-Wilf sequence:" print
20 calkin-wilf ltake [ pprint bl ] leach nl nl

83116/51639 cw-index "83116/51639 is at index %d.\n" printf
