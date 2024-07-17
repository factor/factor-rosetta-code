! Task:
! 
! Get the text in a string that occurs between a start and end delimiter.
! Programs will be given a search string, a start delimiter string, and an
! end delimiter string. The delimiters will not be unset, and will not be
! the empty string.
! 
! The value returned should be the text in the search string that occurs
! between the first occurrence of the start delimiter (starting after the
! text of the start delimiter) and the first occurrence of the end
! delimiter after that.
! 
! If the start delimiter is not present in the search string, a blank
! string should be returned.
! 
! If the end delimiter is not present after the end of the first
! occurrence of the start delimiter in the search string, the remainder of
! the search string after that point should be returned.
! 
! There are two special values for the delimiters. If the value of the
! start delimiter is "start", the beginning of the search string will be
! matched. If the value of the end delimiter is "end", the end of the
! search string will be matched.
! 
! Example 1. Both delimiters set
! 
!                Text: "Hello Rosetta Code world"
!                Start delimiter: "Hello "
!                End delimiter: " world"
!                Output: "Rosetta Code"
! 
! Example 2. Start delimiter is the start of the string
! 
!                Text: "Hello Rosetta Code world"
!                Start delimiter: "start"
!                End delimiter: " world"
!                Output: "Hello Rosetta Code"
! 
! Example 3. End delimiter is the end of the string
! 
!                Text: "Hello Rosetta Code world"
!                Start delimiter: "Hello"
!                End delimiter: "end"
!                Output: "Rosetta Code world"
! 
! Example 4. End delimiter appears before and after start delimiter
! 
!                Text: "</div><div style=\"chinese\">你好嗎</div>"
!                Start delimiter: "<div style=\"chinese\">"
!                End delimiter: "</div>"
!                Output: "你好嗎"
! 
! Example 5. End delimiter not present
! 
!                Text: "<text>Hello <span>Rosetta Code</span> world</text><table style=\"myTable\">"
!                Start delimiter: "<text>"
!                End delimiter: "<table>"
!                Output: "Hello <span>Rosetta Code</span> world</text><table style=\"myTable\">"
! 
! Example 6. Start delimiter not present
! 
!                Text: "<table style=\"myTable\"><tr><td>hello world</td></tr></table>"
!                Start delimiter: "<table>"
!                End delimiter: "</table>"
!                Output: ""
! 
! Example 7. Multiple instances of end delimiter after start delimiter
! (match until the first one)
! 
!                Text: "The quick brown fox jumps over the lazy other fox"
!                Start delimiter: "quick "
!                End delimiter: " fox"
!                Output: "brown"
! 
! Example 8. Multiple instances of the start delimiter (start matching at
! the first one)
! 
!                Text: "One fish two fish red fish blue fish"
!                Start delimiter: "fish "
!                End delimiter: " red"
!                Output: "two fish"
! 
! Example 9. Start delimiter is end delimiter
! 
!                Text: "FooBarBazFooBuxQuux"
!                Start delimiter: "Foo"
!                End delimiter: "Foo"
!                Output: "BarBaz"
! 
! Category:Strings

USING: combinators formatting kernel locals math
prettyprint.config sequences ;
IN: rosetta-code.text-between

:: start ( sdelim text -- n )
    {
        { [ sdelim "start" = ] [ 0 ] }
        { [ sdelim text subseq-start ] [ sdelim text subseq-start sdelim length + ] }
        [ text length ]
    } cond ;

:: end ( edelim text i -- n )
    {
        { [ edelim "end" = ] [ text length ] }
        { [ edelim text i subseq-start-from ] [ edelim text i subseq-start-from ] }
        [ text length ]
    } cond ;

:: text-between ( text sdelim edelim -- seq )
    sdelim text start :> start-index
    edelim text start-index end :> end-index
    start-index end-index text subseq ;

: text-between-demo ( -- )
    {
        { "Hello Rosetta Code world" "Hello " " world" }
        { "Hello Rosetta Code world" "start" " world" }
        { "Hello Rosetta Code world" "Hello " "end" }
        { "</div><div style=\"chinese\">你好嗎</div>" "<div style=\"chinese\">" "</div>" }
        { "<text>Hello <span>Rosetta Code</span> world</text><table style=\"myTable\">" "<text>" "<table>" }
        { "<table style=\"myTable\"><tr><td>hello world</td></tr></table>" "<table>" "</table>" }
        { "The quick brown fox jumps over the lazy other fox" "quick " " fox" }
        { "One fish two fish red fish blue fish" "fish " " red" }
        { "FooBarBazFooBuxQuux" "Foo" "Foo" }
    }
    [
        first3 3dup text-between [
            "Text: %u\nStart delimiter: %u\nEnd delimiter: %u\nOutput: %u\n\n"
            printf
        ] without-limits  ! prevent the prettyprinter from culling output
    ] each ;

MAIN: text-between-demo
