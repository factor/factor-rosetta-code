! This task is about expressing numbers with an attached (abutted) suffix
! multiplier(s), the suffix(es) could be:
! 
! -   -   an alphabetic (named) multiplier which could be abbreviated
!     -   metric multiplier(s) which can be specified multiple times
!     -   "binary" multiplier(s) which can be specified multiple times
!     -   explanation marks (!) which indicate a factorial or
!         multifactorial
! 
! The (decimal) numbers can be expressed generally as:
! 
!              {±}   {digits}   {.}   {digits}
!                                  ────── or ──────
!              {±}   {digits}   {.}   {digits}   {E or e}   {±}   {digits}
! 
! where:
! 
! -   -   numbers won't have embedded blanks (contrary to the expaciated
!         examples above where whitespace was used for readability)
!     -   this task will only be dealing with decimal numbers, both in the
!         mantissa and exponent
!     -   ± indicates an optional plus or minus sign (+ or -)
!     -   digits are the decimal digits (0 ──► 9)
!     -   the digits can have comma(s) interjected to separate the periods
!         (thousands) such as: 12,467,000
!     -   . is the decimal point, sometimes also called a dot
!     -   e or E denotes the use of decimal exponentiation (a number
!         multiplied by raising ten to some power)
! 
! This isn't a pure or perfect definition of the way we express decimal
! numbers, but it should convey the intent for this task.
! 
! The use of the word periods (thousands) is not meant to confuse, that
! word (as used above) is what the comma separates;
! 
! the groups of decimal digits are called periods, and in almost all
! cases, are groups of three decimal digits.
! 
! If an e or E is specified, there must be a legal number expressed before
! it, and there must be a legal (exponent) expressed after it.
! 
! Also, there must be some digits expressed in all cases, not just a sign
! and/or decimal point.
! 
! Superfluous signs, decimal points, exponent numbers, and zeros need not
! be preserved.
! 
! I.E.: +7 007 7.00 7E-0 7E000 70e-1 could all be expressed as 7
! 
! All numbers to be "expanded" can be assumed to be valid and there won't
! be a requirement to verify their validity.
! 
! Abbreviated alphabetic suffixes to be supported (where the capital letters signify the minimum abbreation that can be used):
! 
!      PAIRs         multiply the number by  2         (as in pairs of shoes or pants)
!      SCOres        multiply the number by  20        (as 3score would be 60)
!      DOZens        multiply the number by  12
!      GRoss         multiply the number by  144       (twelve dozen)
!      GREATGRoss    multiply the number by  1,728     (a dozen gross)
!      GOOGOLs       multiply the number by  10^100    (ten raised to the 100&sup>th power)
! 
! Note that the plurals are supported, even though they're usually used
! when expressing exact numbers (She has 2 dozen eggs, and dozens of
! quavas)
! 
! Metric suffixes to be supported (whether or not they're officially sanctioned):
! 
!      K     multiply the number by  10^3              kilo      (1,000)
!      M     multiply the number by  10^6              mega      (1,000,000)
!      G     multiply the number by  10^9              giga      (1,000,000,000)
!      T     multiply the number by  10^12             tera      (1,000,000,000,000)
!      P     multiply the number by  10^15             peta      (1,000,000,000,000,000)
!      E     multiply the number by  10^18             exa       (1,000,000,000,000,000,000)
!      Z     multiply the number by  10^21             zetta     (1,000,000,000,000,000,000,000)
!      Y     multiply the number by  10^24             yotta     (1,000,000,000,000,000,000,000,000)
!      X     multiply the number by  10^27             xenta     (1,000,000,000,000,000,000,000,000,000)
!      W     multiply the number by  10^30             wekta     (1,000,000,000,000,000,000,000,000,000,000)
!      V     multiply the number by  10^33             vendeka   (1,000,000,000,000,000,000,000,000,000,000,000)
!      U     multiply the number by  10^36             udekta    (1,000,000,000,000,000,000,000,000,000,000,000,000)
! 
! Binary suffixes to be supported (whether or not they're officially sanctioned):
! 
!      Ki    multiply the number by  2^10              kibi      (1,024)
!      Mi    multiply the number by  2^20              mebi      (1,048,576)
!      Gi    multiply the number by  2^30              gibi      (1,073,741,824)
!      Ti    multiply the number by  2^40              tebi      (1,099,571,627,776)
!      Pi    multiply the number by  2^50              pebi      (1,125,899,906,884,629)
!      Ei    multiply the number by  2^60              exbi      (1,152,921,504,606,846,976)
!      Zi    multiply the number by  2^70              zeb1      (1,180,591,620,717,411,303,424)
!      Yi    multiply the number by  2^80              yobi      (1,208,925,819,614,629,174,706,176)
!      Xi    multiply the number by  2^90              xebi      (1,237,940,039,285,380,274,899,124,224)
!      Wi    multiply the number by  2^100             webi      (1,267,650,600,228,229,401,496,703,205,376)
!      Vi    multiply the number by  2^110             vebi      (1,298,074,214,633,706,907,132,624,082,305,024)
!      Ui    multiply the number by  2^120             uebi      (1,329,227,995,784,915,872,903,807,060,280,344,576)
! 
! All of the metric and binary suffixes can be expressed in lowercase,
! uppercase, or mixed case.
! 
! All of the metric and binary suffixes can be stacked (expressed multiple
! times), and also be intermixed:
! 
! I.E.: 123k 123K 123GKi 12.3GiGG 12.3e-7T .78E100e
! 
! Factorial suffixes to be supported:
! 
!      !      compute the (regular) factorial product:   5!   is  5 × 4 × 3 × 2 × 1  =  120
!      !!     compute the  double   factorial product:   8!   is  8 × 6 × 4 × 2      =  384
!      !!!    compute the  triple   factorial product:   8!   is  8 × 5 × 2          =   80
!      !!!!   compute the quadruple factorial product:   8!   is  8 × 4              =   32
!      !!!!!  compute the quintuple factorial product:   8!   is  8 × 3              =   24
!      ··· the number of factorial symbols that can be specified is to be unlimited  (as per what can be entered/typed) ···
! 
! Factorial suffixes aren't, of course, the usual type of multipliers, but
! are used here in a similar vein.
! 
! Multifactorials aren't to be confused with super─factorials where (4!)!
! would be (24)!.
! 
! Task:
! 
! -   -   Using the test cases (below), show the "expanded" numbers here,
!         on this page.
!     -   For each list, show the input on one line, and also show the
!         output on one line.
!     -   When showing the input line, keep the spaces (whitespace) and
!         case (capitalizations) as is.
!     -   For each result (list) displayed on one line, separate each
!         number with two blanks.
!     -   Add commas to the output numbers were appropriate.
! 
! Test cases:
! 
!     2greatGRo   24Gros  288Doz  1,728pairs  172.8SCOre
!     1,567      +1.567k    0.1567e-2m
!     25.123kK    25.123m   2.5123e-00002G
!     25.123kiKI  25.123Mi  2.5123e-00002Gi  +.25123E-7Ei
!     -.25123e-34Vikki      2e-77gooGols
!     9!   9!!   9!!!   9!!!!   9!!!!!   9!!!!!!   9!!!!!!!   9!!!!!!!!   9!!!!!!!!!
! 
! where the last number for the factorials has nine factorial symbols (!)
! after the 9
! 
! Related tasks:
! 
! -   Multifactorial (which has a clearer and more succinct definition of
!     multifactorials.)
! -   Factorial

USING: combinators combinators.short-circuit formatting fry
grouping grouping.extras kernel literals math math.functions
math.parser math.ranges qw regexp sequences sequences.deep
sequences.extras sets splitting unicode ;
IN: rosetta-code.numerical-suffixes

CONSTANT: test-cases {
    qw{ 2greatGRo 24Gros 288Doz 1,728pairs 172.8SCOre }
    qw{ 1,567 +1.567k 0.1567e-2m }
    qw{ 25.123kK 25.123m 2.5123e-00002G }
    qw{ 25.123kiKI 25.123Mi 2.5123e-00002Gi +.25123E-7Ei }
    qw{ -.25123e-34Vikki 2e-77gooGols }
    qw{
        9! 9!! 9!!! 9!!!! 9!!!!! 9!!!!!! 9!!!!!!! 9!!!!!!!!
        9!!!!!!!!!
    }
}

CONSTANT: alpha {
    { "PAIRs" 2 } { "DOZens" 12 } { "SCOres" 20 }
    { "GRoss" 144 } { "GREATGRoss" 1,728 }
    ${ "GOOGOLs" 10 100 ^ }
}

CONSTANT: metric qw{ K M G T P E Z Y X W V U }

! Multifactorial
: m! ( n degree -- m ) neg 1 swap <range> product ;

! Separate a number from its suffix(es).
! e.g. "+1.567k" -> 1.567 "k"
: num/suffix ( str -- n suffix(es) )
    dup <head-clumps> <reversed> { } like "" map-like
    [ string>number ] map [ ] find [ tail* ] dip swap ;

! Checks whether str1 is an abbreviation of str2.
! e.g. "greatGRo" "GREATGRoss" -> t
: abbrev? ( str1 str2 -- ? )
    {
        [ [ >upper ] [ [ LETTER? ] take-while head? ] bi* ]
        [ [ length ] bi@ <= ]
    } 2&& ;

! Convert an alpha suffix to its multiplication function.
! e.g. "Doz" -> [ 12 * ]
: alpha>quot ( str -- quot )
    [ alpha ] dip '[ first _ swap abbrev? ] find nip second
    [ * ] curry ;

! Split a suffix composed of metric and binary suffixes into its
! constituent parts. e.g. "Vikki" -> { "Vi" "k" "ki" }
: split-compound ( str -- seq )
    R/ (.i|.)/i all-matching-subseqs ;

! Convert a metric or binary suffix to its multiplication
! function. e.g. "k" -> [ 10 3 ^ * ]
: suffix>quot ( str -- quot )
    dup [ [ 0 1 ] dip subseq >upper metric index 1 + ] dip
    length 1 = [ 3 * '[ 10 _ ^ * ] ] [ 10 * '[ 2 _ ^ * ] ] if ;

! Apply suffix>quot to each member of a sequence.
! e.g. { "Vi" "k" "ki" } ->
! [ [ 2 110 ^ * ] [ 10 3 ^ * ] [ 2 10 ^ * ] ]
: map-suffix ( seq -- seq' ) [ suffix>quot ] [ ] map-as ; 

! Tests whether a string is composed of metric and/or binary
! suffixes. e.g. "Vikki" -> t
: compound? ( str -- ? )
    >upper metric concat "I" append without empty? ;

! Convert a float to an integer if it is numerically equivalent
! to an integer. e.g. 1.0 -> 1, 1.23 -> 1.23
: ?f>i ( x -- y/n ) 
    dup >integer 2dup [ number= ] 2dip swap ? ;

! Convert a suffix string to a function that performs the
! calculations required by the suffix.
! e.g. "!!!" -> [ 3 m! ], "kiKI" -> [ 2 10 ^ * 2 10 ^ * ]
: parse-suffix ( str -- quot )
    {
        { [ dup empty? ] [ drop [ ] ] }
        { [ dup first CHAR: ! = ] [ length [ m! ] curry ] }
        { [ dup compound? ] [ split-compound map-suffix ] }
        [ alpha>quot ]
    } cond flatten ;

GENERIC: commas ( n -- str )

! Add commas to an integer in triplets.
! e.g. 1567 -> "1,567"
M: integer commas number>string <reversed> 3 group
    [ "," append ] map concat reverse rest ;

! Add commas to a float in triplets.
! e.g. 1567.12345 -> "1,567.12345"
M: float commas number>string "." split first2
    [ string>number commas ] dip "." glue ;

! Parse any number with any numerical or alphabetical suffix.
! e.g. "288Doz" -> "3,456", "9!!" -> "945"
: parse-alpha ( str -- str' )
    num/suffix parse-suffix curry call( -- x ) ?f>i commas ;

: main ( -- )
    test-cases [
        dup [ parse-alpha ] map
        "Numbers: %[%s, %]\n Result: %[%s, %]\n\n" printf
    ] each ;

MAIN: main
