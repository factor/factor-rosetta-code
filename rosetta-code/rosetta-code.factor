USING: assocs combinators.short-circuit io.directories
io.encodings.utf8 io.files io.files.unique io.launcher kernel
math mediawiki.api namespaces prettyprint regexp sequences sets
sorting splitting strings unicode ;

IN: rosetta-code

MEMO: list-category ( title -- members )
    'H{ { "list" "categorymembers" } { "cmtitle" _ } }
    query [ "title" of ] map ;

MEMO: cached-page-content ( title -- content )
    page-content ;

: list-categories ( title -- tasks )
    list-category
    [ "User:" head? ] reject
    [ "Talk:" head? ] reject
    [ "Rosetta Code" head? ] reject
    [ "Category:" head? ] partition swap [ list-categories ] map
    concat append harvest members sort ;

: all-tasks ( -- tasks )
    "Category:Solutions_by_Programming_Task" list-categories ;

: draft-tasks ( -- tasks )
    "Category:Draft_Programming_Tasks" list-categories ;

: extract-section ( page-content start end -- section/f )
    [
        '[
            _ [ subseq-index ] [ length dupd '[ _ + ] when ] bi
        ] keep over
    ] dip '[
        [ dupd _ subseq-index-from ] [ subseq ] bi
    ] [ 2drop f ] if ;

:: get-code ( task lang -- code/f )
    task cached-page-content {
        [
            "<syntaxhighlight lang=\"" lang "\">" 3append
            "</syntaxhighlight>" extract-section
        ] [
            "<syntaxhighlight lang=" lang ">" surround
            "</syntaxhighlight>" extract-section
        ]
    } 1|| ;

: get-description ( task -- description/f )
    cached-page-content "=={{header" over subseq? [
        "" "=={{header" extract-section
        dup "{{task" head? [
            CHAR: \n over index [ 1 + tail ] when*
        ] when
    ] [ drop f ] if ;

: get-clean-description ( task -- description/f )
    get-description dup [
        "<br>" "\n" replace
        "&nbsp;" "" replace
        split-lines [
            dup ":" head? [
                CHAR: * over index [
                    [ CHAR: : <string> "*" append ]
                    [ 1 + CHAR: * <string> ] bi replace
                ] when*
            ] [
                dup [ blank? ] all? [ drop "" ] when
            ] if
        ] map! "\n" join [ blank? ] trim
    ] when ;

: get-plain-description ( task -- description/f )
    get-clean-description dup [
        [
            "raw.txt" utf8 set-file-contents
            {
                "/opt/homebrew/bin/pandoc"
                "-f" "mediawiki"
                "-t" "plain"
                "-o" "plain.txt"
                "raw.txt"
            } try-output-process
            "plain.txt" utf8 file-contents
        ] cleanup-unique-directory
    ] when ;

: get-solution ( task -- solution/f )
    [ get-plain-description ] keep over empty? [ 2drop f ] [
        [ string-lines [ "! " prepend ] map "\n" join ]
        [ "factor" get-code "\n\n" glue "\n" append ] bi*
    ] if ;

: task-path ( task -- path )
    [
        dup { [ Letter? ] [ digit? ] } 1||
        [ drop CHAR: - ] unless
    ] map >lower R/ --+/ "-" re-replace "-" ?tail drop ".factor" append ;

: save-task ( task -- )
    "vocab:rosetta-code/solutions" [
        [ get-solution ]
        [ task-path '[ _ utf8 set-file-contents ] when* ] bi
    ] with-directory ;

: save-all-tasks ( -- )
    all-tasks [ dup . save-task ] each ;

: save-draft-tasks ( -- )
    draft-tasks [ dup . save-task ] each ;

: with-rosetta-code ( quot -- )
    [ "https://rosettacode.org/w/api.php" endpoint ] dip
    with-variable ; inline

! [ save-all-tasks ] with-rosetta-code
! [ save-draft-tasks ] with-rosetta-code
