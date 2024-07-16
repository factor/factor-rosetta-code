! Commatizing numbers (as used here, is a handy expedient made-up word) is
! the act of adding commas to a number (or string), or to the numeric part
! of a larger string.
! 
! Task:
! 
! Write a function that takes a string as an argument with optional
! arguments or parameters (the format of parameters/options is left to the
! programmer) that in general, adds commas (or some other characters,
! including blanks or tabs) to the first numeric part of a string (if it's
! suitable for commatizing as per the rules below), and returns that newly
! commatized string.
! 
! Some of the commatizing rules (specified below) are arbitrary, but
! they'll be a part of this task requirements, if only to make the results
! consistent amongst national preferences and other disciplines.
! 
! The number may be part of a larger (non-numeric) string such as:
! 
! -   -   «US$1744 millions» ──or──
!     -   ±25000 motes.
! 
! The string may possibly not have a number suitable for commatizing, so
! it should be untouched and no error generated.
! 
! If any argument (option) is invalid, nothing is changed and no error
! need be generated (quiet execution, no fail execution). Error message
! generation is optional.
! 
! The exponent part of a number is never commatized. The following string
! isn't suitable for commatizing: 9.7e+12000
! 
! Leading zeroes are never commatized. The string 0000000005714.882 after
! commatization is: 0000000005,714.882
! 
! Any period (.) in a number is assumed to be a decimal point.
! 
! The original string is never changed except by the addition of commas
! [or whatever character(s) is/are used for insertion], if at all.
! 
! To wit, the following should be preserved:
! 
! -   -   leading signs (+, -) ── even superfluous signs
!     -   leading/trailing/embedded blanks, tabs, and other whitespace
!     -   the case (upper/lower) of the exponent indicator, e.g.:
!         4.8903d-002
! 
! Any exponent character(s) should be supported:
! 
! -   -   1247e12
!     -   57256.1D-4
!     -   4444^60
!     -   7500∙10**35
!     -   8500x10**35
!     -   9500↑35
!     -   +55000↑3
!     -   1000**100
!     -   2048²
!     -   4096³²
!     -   10000pow(pi)
! 
! Numbers may be terminated with any non-digit character, including
! subscripts and/or superscript: 4142135624³ or 7320509076_((base 24)).
! 
! The character(s) to be used for the comma can be specified, and may
! contain blanks, tabs, and other whitespace characters, as well as
! multiple characters. The default is the comma (,) character.
! 
! The period length can be specified (sometimes referred to as "thousands"
! or "thousands separators"). The period length can be defined as the
! length (or number) of the decimal digits between commas. The default
! period length is 3.
! 
!         E.G.: in this example, the period length is five:
!         56789,12340,14148
! 
! The location of where to start the scanning for the target field (the
! numeric part) should be able to be specified. The default is 1.
! 
! The character strings below may be placed in a file (and read) or stored
! as simple strings within the program.
! 
! Strings to be used as a minimum:
! 
! The value of pi (expressed in base 10) should be separated with blanks
! every 5 places past the decimal point,
! 
! the Zimbabwe dollar amount should use a decimal point for the "comma"
! separator:
! 
! -   -   pi=3.14159265358979323846264338327950288419716939937510582097494459231
!     -   The author has two Z$100000000000000 Zimbabwe notes (100
!         trillion).
!     -   "-in Aus$+1411.8millions"
!     -   ===US$0017440 millions=== (in 2000 dollars)
!     -   123.e8000 is pretty big.
!     -   The land area of the earth is 57268900(29% of the surface)
!         square miles.
!     -   Ain't no numbers in this here words, nohow, no way, Jose.
!     -   James was never known as 0000000007
!     -   Arthur Eddington wrote: I believe there are
!         15747724136275002577605653961181555468044717914527116709366231425076185631031296
!         protons in the universe.
!     -   ␢␢␢$-140000±100 millions.
!     -   6/9/1946 was a good year for some.
! 
! where the penultimate string has three leading blanks (real blanks are
! to be used).
! 
! Also see:
! 
! -   The Wiki entry: (sir) Arthur Eddington's number of protons in the
!     universe.

USING: accessors grouping io kernel math regexp sequences
splitting strings unicode ;

: numeric ( str -- new-str )
    R/ [1-9][0-9]*/ first-match >string ;

: commas ( numeric-str period separator -- str )
    [ reverse ] [ group ] [ reverse join reverse ] tri* ;

: (commatize) ( text from period separator -- str )
    [ cut dup numeric dup ] 2dip commas replace append ;

: commatize* ( text from period separator -- str )
    reach [ digit? ] any? [ (commatize) ] [ 3drop ] if ;

: commatize ( text -- str ) 0 3 "," commatize* ;

"pi=3.14159265358979323846264338327950288419716939937510582097494459231"
5 5 " " commatize* print
    
"The author has two Z$100000000000000 Zimbabwe notes (100 trillion)."
0 3 "." commatize* print
    
{
    "\"-in Aus$+1411.8millions\""
    "===US$0017440 millions=== (in 2000 dollars)"
    "123.e8000 is pretty big."
    "The land area of the earth is 57268900(29% of the surface) square miles."
    "Ain't no numbers in this here words, nohow, no way, Jose."
    "James was never known as 0000000007"
    "Arthur Eddington wrote: I believe there are 15747724136275002577605653961181555468044717914527116709366231425076185631031296 protons in the universe."
    "   $-140000±100 millions."
    "6/9/1946 was a good year for some."
} [ commatize print ] each
