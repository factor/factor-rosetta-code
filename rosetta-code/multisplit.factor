! It is often necessary to split a string into pieces based on several
! different (potentially multi-character) separator strings, while still
! retaining the information about which separators were present in the
! input.
! 
! This is particularly useful when doing small parsing tasks.
! 
! The task is to write code to demonstrate this.
! 
! The function (or procedure or method, as appropriate) should take an
! input string and an ordered collection of separators.
! 
! The order of the separators is significant:
! 
! The delimiter order represents priority in matching, with the first
! defined delimiter having the highest priority. In cases where there
! would be an ambiguity as to which separator to use at a particular point
! (e.g., because one separator is a prefix of another) the separator with
! the highest priority should be used. Delimiters can be reused and the
! output from the function should be an ordered sequence of substrings.
! 
! Test your code using the input string “a!===b=!=c” and the separators
! “==”, “!=” and “=”.
! 
! For these inputs the string should be parsed as
! "a" (!=) "" (==) "b" (=) "" (!=) "c", where matched delimiters are shown
! in parentheses, and separated strings are quoted, so our resulting
! output is "a", empty string, "b", empty string, "c". Note that the
! quotation marks are shown for clarity and do not form part of the
! output.
! 
! Extra Credit: provide information that indicates which separator was
! matched at each separation point and where in the input string that
! separator was matched.

USING: arrays fry kernel make sequences ;

IN: rosetta-code.multisplit

: first-subseq ( seq separators -- n separator )
    tuck
    [ [ subseq-index ] dip 2array ] withd map-index sift-keys
    [ drop f f ] [ [ first ] infimum-by first2 rot nth ] if-empty ;

: multisplit ( string separators -- seq )
    '[
        [ dup _ first-subseq dup ] [
            length -rot cut-slice [ , ] dip swap tail-slice
        ] while 2drop ,
    ] { } make ;
