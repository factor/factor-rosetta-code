! It is often useful to find the common prefix of a set of strings, that
! is, the longest initial portion of all strings that are identical.
! 
! Given a set of strings, R, for a prefix S, it should hold that:
! 
! ∀x ∈ R: S≤
! _(pref)  x ~ "for all members x of set R, it holds true that string S is
! a prefix of x"
! 
!     (help here: does not express thatSis the longest common prefix ofx)
! 
! An example use case for this: given a set of phone numbers, identify a
! common dialing code. This can be accomplished by first determining the
! common prefix (if any), and then matching it against know dialing codes
! (iteratively dropping characters from rhs until a match is found, as the
! lcp function may match more than the dialing code).
! 
! Test cases
! 
! For a function, lcp, accepting a list of strings, the following should
! hold true (the empty string, ε, is considered a prefix of all strings):
! 
! lcp("interspecies","interstellar","interstate") = "inters"
! lcp("throne","throne") = "throne"
! lcp("throne","dungeon") = ε
! lcp("throne",ε,"throne") = ε
! lcp("cheese") = "cheese"
! lcp(ε) = ε
! lcp(∅) = ε
! lcp("prefix","suffix") = ε
! lcp("foo","foobar") = "foo"
! 
! Task inspired by this stackoverflow question: Find the longest common
! starting substring in a set of strings

USING: continuations formatting fry kernel sequences strings ;
IN: rosetta-code.lcp

! Find the longest common prefix of two strings.
: binary-lcp ( str1 str2 -- str3 )
    [ SBUF" " clone ] 2dip
    '[ _ _ [ over = [ suffix! ] [ drop return ] if ] 2each ]
    with-return >string ;

! Reduce a sequence of strings using binary-lcp.
: lcp ( seq -- str )
    [ "" ] [ dup first [ binary-lcp ] reduce ] if-empty ;

: lcp-demo ( -- )
    {
        { "interspecies" "interstellar" "interstate" }
        { "throne" "throne" }
        { "throne" "dungeon" }
        { "throne" "" "throne" }
        { "cheese" }
        { "" }
        { }
        { "prefix" "suffix" }
        { "foo" "foobar" }
    } [ dup lcp "%u lcp = %u\n" printf ] each ;

MAIN: lcp-demo
