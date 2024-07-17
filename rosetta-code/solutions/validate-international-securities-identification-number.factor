! An International Securities Identification Number (ISIN) is a unique
! international identifier for a financial security such as a stock or
! bond.
! 
! Task:
! 
! Write a function or program that takes a string as input, and checks
! whether it is a valid ISIN.
! 
! It is only valid if it has the correct format, and the embedded checksum
! is correct.
! 
! Demonstrate that your code passes the test-cases listed below.
! 
! Details:
! 
! The format of an ISIN is as follows:
! 
! ┌───────────── a 2-character ISO country code (A-Z)
! 
! │┌─────────── a 9-character security code (A-Z, 0-9)
! 
! ││┌── a checksum digit (0-9)
! 
! AU0000XVGZA3
! 
! For this task, you may assume that any 2-character alphabetic sequence
! is a valid country code.
! 
! The checksum can be validated as follows:
! 
! 1.  Replace letters with digits, by converting each character from base
!     36 to base 10, e.g. AU0000XVGZA3 →1030000033311635103.
! 2.  Perform the Luhn test on this base-10 number.
! 
! There is a separate task for this test: Luhn test of credit card
! numbers. You don't have to replicate the implementation of this test
! here ─── you can just call the existing function from that task. (Add a
! comment stating if you did this.)
! 
! Test cases:
! 
!     
! 
!         {| class="wikitable"
! 
! ! ISIN ! Validity ! Comment |- | US0378331005 || valid || |- |
! US0373831005 || not valid || The transposition typo is caught by the
! checksum constraint. |- | U50378331005 || not valid || The substitution
! typo is caught by the format constraint. |- | US03378331005 || not valid
! || The duplication typo is caught by the format constraint. |- |
! AU0000XVGZA3 || valid || |- | AU0000VXGZA3 || valid || Unfortunately,
! not all transposition typos are caught by the checksum constraint. |- |
! FR0000988040 || valid || |}
! 
! (The comments are just informational. Your function should simply return
! a Boolean result. See #Raku for a reference solution.)
! 
! Related task:
! 
! -   Luhn test of credit card numbers
! 
! Also see:
! 
! -   Interactive online ISIN validator
! -   Wikipedia article: International Securities Identification Number

USING: combinators.short-circuit.smart formatting kernel luhn
math math.parser qw sequences strings unicode ;
IN: rosetta-code.isin

CONSTANT: test-cases qw{
    US0378331005 US0373831005 U50378331005 US03378331005
    AU0000XVGZA3 AU0000VXGZA3 FR0000988040
}

: valid-length? ( str -- ? ) length 12 = ;

: valid-country-code? ( str -- ? ) first2 [ Letter? ] both? ;

: valid-security-code? ( str -- ? )
    [ 2 11 ] dip subseq [ alpha? ] all? ;
    
: valid-checksum-digit? ( str -- ? ) last digit? ;
    
: valid-format? ( str -- ? ) {
        [ valid-length?         ]
        [ valid-country-code?   ]
        [ valid-security-code?  ]
        [ valid-checksum-digit? ]
    } && ;
    
: base36>base10 ( str -- n )
    >upper [ dup LETTER? [ 55 - number>string ] [ 1string ] if ]
    { } map-as concat string>number ;
    
: isin? ( str -- ? )
    { [ valid-format? ] [ base36>base10 luhn? ] } && ;
    
: main ( -- )
    test-cases [
        dup isin? "" " not" ? "%s is%s valid\n" printf
    ] each ;
    
MAIN: main
