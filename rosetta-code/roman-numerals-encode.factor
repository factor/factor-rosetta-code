! Task:
! 
! Create a function taking a positive integer as its parameter and
! returning a string containing the Roman numeral representation of that
! integer. Modern Roman numerals are written by expressing each digit
! separately, starting with the left most digit and skipping any digit
! with a value of zero.
! 
! In Roman numerals:
! 
! -   1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC
! -   2008 is written as 2000=MM, 8=VIII; or MMVIII
! -   1666 uses each Roman symbol in descending order: MDCLXVI

CONSTANT: roman-digits
    { "m" "cm" "d" "cd" "c" "xc" "l" "xl" "x" "ix" "v" "iv" "i" }

CONSTANT: roman-values
    { 1000 900 500 400 100 90 50 40 10 9 5 4 1 }

ERROR: roman-range-error n ;

: roman-range-check ( n -- n )
    dup 1 10000 between? [ roman-range-error ] unless ;

: >roman ( n -- str )
    roman-range-check
    roman-values roman-digits [
        [ /mod swap ] dip <repetition> concat
    ] 2map "" concat-as nip ;
