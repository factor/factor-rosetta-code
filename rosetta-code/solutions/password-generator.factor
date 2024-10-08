! Create a password generation program which will generate passwords
! containing random ASCII characters from the following groups:
! 
!          lower-case letters:  a ──► z
!          upper-case letters:  A ──► Z
!                      digits:  0 ──► 9
!  other printable characters:  !"#$%&'()*+,-./:;<=>?@[]^_{|}~ 
!  (the above character list excludes white-space, backslash and grave) 
! 
! The generated password(s) must include at least one (of each of the four
! groups):
! 
!    lower-case letter, 
!    upper-case letter,
!    digit  (numeral),  and 
!    one  "other"  character. 
! 
! The user must be able to specify the password length and the number of
! passwords to generate.
! 
! The passwords should be displayed or written to a file, one per line.
! 
! The randomness should be from a system source or library.
! 
! The program should implement a help option or button which should
! describe the program and options when invoked.
! 
! You may also allow the user to specify a seed value, and give the option
! of excluding visually similar characters.
! 
! For example: Il1 O0 5S 2Z where the characters are:
! 
! -   -   capital eye, lowercase ell, the digit one
!     -   capital oh, the digit zero
!     -   the digit five, capital ess
!     -   the digit two, capital zee

USING: arrays assocs combinators command-line continuations io
kernel math math.parser multiline namespaces peg.ebnf
prettyprint random sequences ;
FROM: sets => without ;
IN: rosetta-code.password-generator

STRING: usage
password-generator generates random passwords.

 Commands:
   -l [int>=4]  Set password length (required)
   -c [int>0]   Set password count  (required)
   -s [int]     Set seed for random number generator
   -x           Exclude similar characters
      [empty]   Show this help
;

! Parse command line arguments into assoc
EBNF: parse-args [=[
  int  = "-"? [0-9]+ => [[ concat sift string>number ]]
  l    = "-l" " "~ int ?[ 4 >= ]?
  c    = "-c" " "~ int ?[ 0 >  ]?
  s    = "-s" " "~ int
  x    = "-x" => [[ 0 2array ]]
  arg  = l | c | s | x
  args = arg ((" "~ arg)+)?
       => [[ first2 [ 1array ] dip append ]]
]=]

CONSTANT: similar {
    "abcdefghijklmnopqrstuvwxyz"
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "0123456789"
    "!\"#$%&'()*+,-./:;<=>?@[]^_{|}~"
}

: dissimilar ( -- seq ) similar [ "Il1O05S2Z" without ] map ;

! Set seed if seed provided; otherwise use system rng.
: choose-rng ( args-assoc -- )
    "-s" of [ [ random-generator get ] dip seed-random drop ]
    [ system-random-generator get random-generator set ] if* ;

: choose-character-set ( args-assoc -- seq )
    "-x" of dissimilar similar ? ;

! Create a "base" for a password; one character from each
! category.
: <base> ( seq -- str ) [ random ] "" map-as ;

: password ( seq length -- str )
    4 - over concat [ random ] curry "" replicate-as
    [ <base> ] dip append randomize ;

: .passwords ( count seq length -- )
    [ password print ] 2curry times ;

: gen-pwds ( args-assoc -- )
    {
        [ choose-rng ]
        [ "-c" of ]
        [ choose-character-set ]
        [ "-l" of ]
    } cleave .passwords ;

: main ( -- )
    command-line get " " join
    [ parse-args gen-pwds ] [ 2drop usage print ] recover ;

MAIN: main
