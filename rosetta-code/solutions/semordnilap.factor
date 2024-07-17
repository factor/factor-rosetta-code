! A semordnilap is a word (or phrase) that spells a different word (or
! phrase) backward. "Semordnilap" is a word that itself is a semordnilap.
! 
! Example: lager and regal
! 
! Task
! 
! This task does not consider semordnilap phrases, only single words.
! Using only words from this list, report the total number of unique
! semordnilap pairs, and print 5 examples. Two matching semordnilaps, such
! as lager and regal, should be counted as one unique pair. (Note that the
! word "semordnilap" is not in the above dictionary.)

USING: assocs combinators.short-circuit formatting
io.encodings.utf8 io.files kernel literals locals make
prettyprint random sequences ;
IN: rosetta-code.semordnilap

CONSTANT: words $[ "unixdict.txt" utf8 file-lines ]

: semordnilap? ( str1 str2 -- ? )
    { [ = not ] [ nip words member? ] } 2&& ;

[
    [let
        V{ } clone :> seen words
        [
            dup reverse 2dup
            { [ semordnilap? ] [ drop seen member? not ] } 2&&
            [ 2dup [ seen push ] bi@ ,, ] [ 2drop ] if 
        ] each
    ]
] H{ } make >alist
[ length "%d semordnilap pairs.\n" printf ] [ 5 sample . ] bi
