! Ordinal numbers (as used in this Rosetta Code task), are numbers that
! describe the position of something in a list.
! 
! It is this context that ordinal numbers will be used, using an
! English-spelled name of an ordinal number.
! 
! The ordinal numbers are (at least, one form of them):
! 
!   1st  2nd  3rd  4th  5th  6th  7th  ···  99th  100th  ···  1000000000th  ···  etc
! 
! sometimes expressed as:
! 
!   1^(st)  2^(nd)  3^(rd)  4^(th)  5^(th)  6^(th)  7^(th)  ···  99^(th)  100^(th)  ···  1000000000^(th)  ···
! 
! For this task, the following (English-spelled form) will be used:
! 
!   first second third fourth fifth sixth seventh ninety-nineth one hundredth one billionth
! 
! Furthermore, the short scale numbering system (i.e. 2,000,000,000 is two
! billion) will be used here. wp:Long and short scales
! 
! 2,000,000,000 is two billion, not two milliard.
! 
! Task:
! 
! Write a driver and a function (subroutine/routine ···) that returns the
! English-spelled ordinal version of a specified number (a positive
! integer).
! 
! Optionally, try to support as many forms of an integer that can be
! expressed: 123 00123.0 1.23e2 all are forms of the same integer.
! 
! Show all output here.
! 
! Test cases:
! 
! Use (at least) the test cases of:
! 
!   1  2  3  4  5  11  65  100  101  272  23456  8007006005004003
! 
! Related tasks:
! 
! -   Number names
! -   N'th

USING: assocs formatting grouping kernel literals locals math
math.parser math.text.english qw regexp sequences
splitting.extras ;
IN: rosetta-code.spelling-ordinal-numbers

<PRIVATE

! Factor supports the arbitrary use of commas in integer
! literals, as some number systems (e.g. Indian) don't solely
! break numbers up into triplets.

CONSTANT: test-cases qw{
    1 2 3 4 5 11 65 100 101 272 23456 8007006005004003 123
    00123.0 1.23e2 1,2,3 0b1111011 0o173 0x7B 2706/22
}

CONSTANT: replacements $[
    qw{
        one    first
        two    second
        three  third
        five   fifth
        eight  eighth
        nine   ninth
        twelve twelfth
    } 2 group
]

: regular-ordinal ( n -- str )
    [ number>text ] [ ordinal-suffix ] bi append ;

! Since Factor's number>text word contains commas and "and",
! strip them out with a regular expression.
  
: text>ordinal-text ( str -- str' ) R/ \sand|,/ "" re-replace ;

PRIVATE>
    
:: number>ordinal-text ( n! -- str )
    n >integer n!
    n number>text " ,-" split* dup last replacements at
    [ [ but-last ] dip suffix "" join ]
    [ drop n regular-ordinal          ] if* text>ordinal-text ;

<PRIVATE
    
: print-ordinal-pair ( str x -- )
    number>ordinal-text "%16s => %s\n" printf ;
    
PRIVATE>

: ordinal-text-demo ( -- )
    test-cases [ dup string>number print-ordinal-pair ] each
    "C{ 123 0 }" C{ 123 0 } print-ordinal-pair ;
    
MAIN: ordinal-text-demo
