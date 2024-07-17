! The purpose of this task is to write a function r2cf(int N₁, int N₂), or
! r2cf(Fraction N), which will output a continued fraction assuming:
! 
! N₁
! is the numerator
! 
! N₂
! is the denominator
! 
! The function should output its results one digit at a time each time it
! is called, in a manner sometimes described as lazy evaluation.
! 
! To achieve this it must determine: the integer part; and remainder part,
! of N₁ divided by N₂. It then sets N₁ to N₂ and N₂ to the determined
! remainder part. It then outputs the determined integer part. It does
! this until abs(N₂) is zero.
! 
! Demonstrate the function by outputing the continued fraction for:
! 
!     1/2
!     3
!     23/8
!     13/11
!     22/7
!     -151/77
! 
! $\sqrt 2$ should approach [1; 2, 2, 2, 2, …] try ever closer rational
! approximations until boredom gets the better of you:
! 
!     14142,10000
!     141421,100000
!     1414214,1000000
!     14142136,10000000
! 
! Try :
! 
!     31,10
!     314,100
!     3142,1000
!     31428,10000
!     314285,100000
!     3142857,1000000
!     31428571,10000000
!     314285714,100000000
! 
! Observe how this rational number behaves differently to $\sqrt 2$ and
! convince yourself that, in the same way as 3.7 may be represented as
! 3.70 when an extra decimal place is required, [3; 7] may be represented
! as [3; 7, ∞] when an extra term is required.

USING: formatting kernel lists lists.lazy math math.parser qw
sequences ;
IN: rosetta-code.cf-arithmetic

: r2cf ( x -- lazy )
    [ >fraction [ /mod ] keep swap [ ] [ / ] if-zero nip ]
    lfrom-by [ integer? ] luntil [ >fraction /i ] lmap-lazy ;

: main ( -- )
    qw{
        1/2
        3
        23/8
        13/11
        22/7
        -151/77
        14142/10000
        141421/100000
        1414214/1000000
        14142136/10000000
        31/10
        314/100
        3142/1000
        31428/10000
        314285/100000
        3142857/1000000
        31428571/10000000
        314285714/100000000
    }
    [ dup string>number r2cf list>array "%19s -> %u\n" printf ]
    each ;
    
MAIN: main
