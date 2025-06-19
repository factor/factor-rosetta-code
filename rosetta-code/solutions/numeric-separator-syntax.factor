! Several programming languages allow separators in numerals in order to
! group digits together.
! 
! Task:
! 
! Show the numeric separator syntax and describe its specification.
! 
! E.G.:
! 
! -   -   What separators are eligible?
!     -   Can there be multiple consecutive separators?
!     -   What position can a separator be in?
!     -   Etc.

USE: prettyprint

12,345 .   ! 12345

! commas may be used at arbitrary intervals
1,23,456,78910 .  ! 12345678910

! a comma at the beginning or end will parse as a word, likely causing an error
! ,123 .   ! No word named “,123” found in current vocabulary search path
! 123, .   ! No word named “123,” found in current vocabulary search path

! likewise, two commas in a row will parse as a word
! 1,,23 .   ! No word named “1,,23” found in current vocabulary search path

! There are no exceptions to which numbers may have separators
! binary/octal/decimal/hexadecimal integers and floats are supported
0b1,000,001 .   ! 65
-1,234e-4,5 .   ! -1.234e-42
0x1.4,4p3 .   ! 10.125

! as are ratios
45,2+1,1/43,2 .   ! 452+11/432
1,1/1,7 .   ! 11/17

! and complex numbers
C{ 5.225,312 2.0 } .   ! C{ 5.225312 2.0 }

USING: lexer math.parser prettyprint sequences sets ;

<< SYNTAX: PN: scan-token "_" without string>number suffix! ; >>

! permissive numbers
PN: _1_2_3_ .   ! 123
PN: 1__234___567 .   ! 1234567
PN: 0b0___10.100001p3 .   ! 20.125

USING: eval prettyprint ;

<<

"IN: math.parser.private
USE: combinators
: @pos-digit-or-punc ( i number-parse n char -- n/f )
    {
        { 95 [ [ @pos-digit ] require-next-digit ] }   ! normally 44
        { 43 [ ->numerator ] }
        { 47 [ ->denominator ] }
        { 46 [ ->mantissa ] }
        [ [ @pos-digit ] or-exponent ]
    } case ; inline" eval( -- )

>>

3_333_333 .   ! 3333333
