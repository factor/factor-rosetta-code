! The phrase "I before E, except after C" is a widely known mnemonic which
! is supposed to help when spelling English words.
! 
! Task:
! 
! Using the word list from
! http://wiki.puzzlers.org/pub/wordlists/unixdict.txt,
! 
! check if the two sub-clauses of the phrase are plausible individually:
! 
! :::# "I before E when not preceded by C"
! 
! :::# "E before I when preceded by C"
! 
! If both sub-phrases are plausible then the original phrase can be said
! to be plausible.
! 
! Something is plausible if the number of words having the feature is more
! than two times the number of words having the opposite feature (where
! feature is 'ie' or 'ei' preceded or not by 'c' as appropriate).
! 
! Stretch goal:
! 
! As a stretch goal use the entries from the table of Word Frequencies in
! Written and Spoken English: based on the British National Corpus,
! (selecting those rows with three space or tab separated words only), to
! see if the phrase is plausible when word frequencies are taken into
! account.
! 
! Show your output here as well as your program.
! 
! cf.:
! 
! -   Schools to rethink 'i before e' - BBC news, 20 June 2009
! -   I Before E Except After C - QI Series 8 Ep 14, (humorous)
! -   Companion website for the book: "Word Frequencies in Written and
!     Spoken English: based on the British National Corpus".

USING: combinators formatting generalizations io.encodings.utf8
io.files kernel literals math prettyprint regexp sequences ;
IN: rosetta-code.i-before-e

: correct ( #correct #incorrect rule-str -- )
    pprint " is correct for %d and incorrect for %d.\n" printf ;

: plausibility ( #correct #incorrect -- str )
    2 * > "plausible" "implausible" ? ;
    
: output ( #correct #incorrect rule-str -- )
    [ correct ] curry
    [ plausibility "This is %s.\n\n" printf ] 2bi ;
    
"unixdict.txt" utf8 file-lines ${
    R/ cei/ R/ cie/ R/ [^c]ie/ R/ [^c]ei/
    [ count-matches ]
    [ map-sum       ]
    [ 4 apply-curry ] bi@
} cleave

"I before E when not preceded by C"
"E before I when preceded by C" [ output ] bi@
