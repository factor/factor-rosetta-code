! A truth table is a display of the inputs to, and the output of a Boolean
! function organized as a table where each row gives one combination of
! input values and the corresponding value of the function.
! 
! Task:
! 
! 1.  Input a Boolean function from the user as a string then calculate
!     and print a formatted truth table for the given function.
! 
! (One can assume that the user input is correct).
! 
! 1.  Print and show output for Boolean functions of two and three input
!     variables, but any program should not be limited to that many
!     variables in the function.
! 2.  Either reverse-polish or infix notation expressions are allowed.
! 
! Related tasks:
! 
! -   Boolean values
! -   Ternary logic
! 
! See also:
! 
! -   Wolfram MathWorld entry on truth tables.
! -   some "truth table" examples from Google.

USING: arrays combinators eval formatting io kernel listener
math.combinatorics prettyprint qw sequences splitting
vocabs.parser ;
IN: rosetta-code.truth-table

: prompt ( -- str )
    "Please enter a boolean expression using 1-long" print
    "variable names and postfix notation. Available" print
    "operators are and, or, not, and xor. Example:"  print
    "> a b and"                                      print nl
    "> " write readln nl ;

: replace-var ( str -- str' )
    dup length 1 = [ drop "%s" ] when ;
    
: replace-vars ( str -- str' )
    " " split [ replace-var ] map " " join ;
    
: extract-vars ( str -- seq )
    " " split [ length 1 = ] filter ;
    
: count-vars ( str -- n )
    " " split [ "%s" = ] count ;
    
: truth-table ( n -- seq )
    qw{ t f } swap selections ;
    
: print-row ( seq -- )
    [ write bl ] each ;
    
: print-table ( seq -- )
    [ print-row nl ] each ;
    
! Adds a column to the end of a two-dimensional array.
: add-col ( seq col -- seq' )
    [ flip ] dip 1array append flip ;
    
: header ( str -- )
    [ extract-vars ] [ ] bi
    [ print-row "| " write ] [ print ] bi*
    "=================" print ;

: solve-expr ( seq str -- ? )
    vsprintf [ "kernel" use-vocab ( -- x ) (eval) ]
    with-interactive-vocabs ;
    
: results ( str -- seq )
    replace-vars dup count-vars truth-table
    [ swap solve-expr unparse ] with map ;
    
: main ( -- )
    prompt
    [ header t ]
    [ replace-vars count-vars truth-table ]
    [ results [ "| " prepend ] map ] tri
    add-col print-table drop ;
    
MAIN: main
