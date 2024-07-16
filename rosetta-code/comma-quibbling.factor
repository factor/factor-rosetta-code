! Comma quibbling is a task originally set by Eric Lippert in his blog.
! 
! Task:
! 
! Write a function to generate a string output which is the concatenation
! of input words from a list/sequence where:
! 
! 1.  An input of no words produces the output string of just the two
!     brace characters "{}".
! 2.  An input of just one word, e.g. ["ABC"], produces the output string
!     of the word inside the two braces, e.g. "{ABC}".
! 3.  An input of two words, e.g. ["ABC", "DEF"], produces the output
!     string of the two words inside the two braces with the words
!     separated by the string " and ", e.g. "{ABC and DEF}".
! 4.  An input of three or more words, e.g. ["ABC", "DEF", "G", "H"],
!     produces the output string of all but the last word separated by ",
!     " with the last word separated by " and " and all within braces;
!     e.g. "{ABC, DEF, G and H}".
! 
! Test your function with the following series of inputs showing your
! output here on this page:
! 
! -   [] # (No input words).
! -   ["ABC"]
! -   ["ABC", "DEF"]
! -   ["ABC", "DEF", "G", "H"]
! 
! Note: Assume words are non-empty strings of uppercase characters for
! this task.

USING: inverse qw sequences ;
 
: (quibble) ( seq -- seq' )
    {
        { [ { } ] [ "" ] }
        { [ 1array ] [ ] }
        { [ 2array ] [ " and " glue ] }
        [ unclip swap (quibble) ", " glue ]
    } switch ;

: quibble ( seq -- str ) (quibble) "{%s}" sprintf ;

{ } qw{ ABC } qw{ ABC DEF } qw{ ABC DEF G H }
[ quibble print ] 4 napply
