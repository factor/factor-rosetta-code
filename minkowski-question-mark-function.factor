! The Minkowski question-mark function converts the continued fraction
! representation of a number into a binary decimal representation in which
! the integer part is unchanged and the become alternating runs of binary
! zeroes and ones of those lengths. The decimal point takes the place of
! the first zero.
! 
! Thus, (31/7) = 71/16 because 31/7 has the continued fraction
! representation giving the binary expansion .
! 
! Among its interesting properties is that it maps roots of quadratic
! equations, which have repeating continued fractions, to rational
! numbers, which have repeating binary digits.
! 
! The question-mark function is continuous and monotonically increasing,
! so it has an inverse.
! 
! -   Produce a function for . Be careful: rational numbers have two
!     possible continued fraction representations:
!     -   -   and
! 
!         -   
! -   Choose one of the above that will give a binary expansion ending
!     with a 1.
! -   Produce the inverse function
! -   Verify that = 5/3, where is the Greek golden ratio.
! -   Verify that = (√13 - 7)/6
! -   Verify that the two functions are inverses of each other by showing
!     that = and = for of your choice
! 
! Don't worry about precision error in the last few digits.
! 
! See also:
! 
! -   Wikipedia entry: Minkowski's question-mark function

USING: formatting kernel make math math.constants
math.continued-fractions math.functions math.parser
math.statistics sequences sequences.extras splitting.monotonic
vectors ;

CONSTANT: max-iter 151

: >continued-fraction ( x -- seq )
    0 swap 1vector
    [ dup last integer? pick max-iter > or ]
    [ dup next-approx [ 1 + ] dip ] until nip
    dup last integer? [ but-last-slice ] unless ;

: ? ( x -- y )
    >continued-fraction unclip swap cum-sum
    [ max-iter < ] take-while
    [ even? 1 -1 kernel:? swap 2^ / ] map-index
    sum 2 * + >float ;

: (float>bin) ( x -- y )
    [ dup 0 > ]
    [ 2 * dup >integer # dup 1 >= [ 1 - ] when ] while ;

: float>bin ( x -- n str )
    >float dup >integer [ - ] keep swap abs
    [ 0 # (float>bin) ] "" make nip ;

: ?⁻¹ ( x -- y )
    dup float>bin [ = ] monotonic-split
    [ length ] map swap prefix >ratio swap copysign ;

: compare ( x y -- ) "%-25u%-25u\n" printf ;

phi ? 5 3 /f compare
-5/9 ?⁻¹ 13 sqrt 7 - 6 /f compare
0.718281828 ?⁻¹ ? 0.1213141516171819 ? ?⁻¹ compare
