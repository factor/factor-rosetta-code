! S-Expressions are one convenient way to parse and store data.
! 
! Task:
! 
! Write a simple reader and writer for S-Expressions that handles quoted
! and unquoted strings, integers and floats.
! 
! The reader should read a single but nested S-Expression from a string
! and store it in a suitable datastructure (list, array, etc).
! 
! Newlines and other whitespace may be ignored unless contained within a
! quoted string.
! 
! “()” inside quoted strings are not interpreted, but treated as part of
! the string.
! 
! Handling escaped quotes inside a string is optional; thus “(foo"bar)”
! maybe treated as a string “foo"bar”, or as an error.
! 
! For this, the reader need not recognize “\” for escaping, but should, in
! addition, recognize numbers if the language has appropriate datatypes.
! 
! Languages that support it may treat unquoted strings as symbols.
! 
! Note that with the exception of “()"” (“\” if escaping is supported) and
! whitespace there are no special characters. Anything else is allowed
! without quotes.
! 
! The reader should be able to read the following input
! 
!     ((data "quoted data" 123 4.5)
!      (data (!@# (4.5) "(more" "data)")))
! 
! and turn it into a native datastructure. (see the Pike, Python and Ruby
! implementations for examples of native data structures.)
! 
! The writer should be able to take the produced list and turn it into a
! new S-Expression. Strings that don't contain whitespace or parentheses
! () don't need to be quoted in the resulting S-Expression, but as a
! simplification, any string may be quoted.
! 
! Extra Credit:
! 
! Let the writer produce pretty printed output with indenting and
! line-breaks.

USING: formatting kernel math.parser multiline peg peg.ebnf
regexp sequences prettyprint words ;
IN: rosetta-code.s-expressions

STRING: input
((data "quoted data" 123 4.5)
 (data (!@# (4.5) "(more" "data)")))
;

EBNF: sexp>seq [=[
  ws     = [\n\t\r ]* => [[ drop ignore ]]
  digits = [0-9]+
  number = digits => [[ string>number ]]
  float  = digits:a "." digits:b => [[ a b "." glue string>number ]]
  string = '"'~ [^"]* '"'~ => [[ "" like ]]
  symbol = [!#-'*-~]+ => [[ "" like <uninterned-word> ]]
  object = ws ( float | number | string | symbol ) ws
  sexp   = ws "("~ ( object | sexp )* ")"~ ws => [[ { } like ]]
]=]

: seq>sexp ( seq -- str )
    unparse R/ {\s+/ "(" R/ \s+}/ ")" [ re-replace ] 2bi@ ;
    
input [ "Input:\n%s\n\n" printf ] [
    sexp>seq dup seq>sexp
    "Native:\n%u\n\nRound trip:\n%s\n" printf
] bi
