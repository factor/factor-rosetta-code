! Task
! 
! This is admittedly a trivial task but I thought it would be interesting
! to see how succinctly (or otherwise) different languages can handle it.
! 
! Given the string: "abracadabra", replace programatically:
! 
! -   the first 'a' with 'A'
! -   the second 'a' with 'B'
! -   the fourth 'a' with 'C'
! -   the fifth 'a' with 'D'
! -   the first 'b' with 'E'
! -   the second 'r' with 'F'
! 
! Note that there is no replacement for the third 'a', second 'b' or first
! 'r'.
! 
! The answer should, of course, be : "AErBcadCbFD".
! 
! Category: String manipulation Category:Simple Category:Strings

USING: assocs formatting grouping kernel random sequences ;

CONSTANT: instrs {
    CHAR: a 1 CHAR: A
    CHAR: a 2 CHAR: B
    CHAR: a 4 CHAR: C
    CHAR: a 5 CHAR: D
    CHAR: b 1 CHAR: E
    CHAR: r 2 CHAR: F
}

: counts ( seq -- assoc )
    H{ } clone swap [ 2dup swap inc-at dupd of ] zip-with nip ;

: replace-nths ( seq instrs -- seq' )
    [ counts ] dip 3 group [ f suffix 2 group ] map substitute keys ;

: test ( str -- )
    dup instrs replace-nths "" like "%s -> %s\n" printf ;


"abracadabra" test
"abracadabra" randomize test
