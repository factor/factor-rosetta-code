USING: arrays assocs combinators.short-circuit continuations io io.directories
io.encodings.utf8 io.files io.files.unique io.launcher kernel
literals math mediawiki.api namespaces prettyprint regexp
sequences sets sorting splitting strings system unicode vectors ;

IN: rosetta-code

! Entries are { task stage error }; retained after a batch for inspection.
SYMBOL: task-failures
SYMBOL: current-task

:: record-task-failure ( error stage -- )
    task-failures get [
        current-task get stage error 3array swap push
    ] [ ] if* ;

MEMO: list-category ( title -- members )
    'H{ { "list" "categorymembers" } { "cmtitle" _ } }
    query [ "title" of ] map ;

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

:: extract-section-from ( from page begin end -- from'/f section/f )
    from page begin subseq-index-from [
        begin length +
        dup page end subseq-index-from
        [ page length ] unless*
        [ page subseq ] keep
        end length + swap
    ] [ f f ] if* ;

: extract-section ( page begin end -- section/f )
    [ 0 ] 3dip extract-section-from nip ;

: extract-sections ( page begin end -- sections/f ) 
    [ 0 ] 3dip '[ _ _ _ extract-section-from dup ] [ ] produce 2nip
    [ f ] [ "\n\n" join ] if-empty ;

:: get-code ( page lang -- code/f )
    page {
        [
            "<syntaxhighlight lang=\"" lang "\">" 3append
            "</syntaxhighlight>" extract-sections
        ] [
            "<syntaxhighlight lang=" lang ">" surround
            "</syntaxhighlight>" extract-sections
        ]
    } 1|| ;

: get-description ( page -- description/f )
    "=={{header" over subseq? [
        "" "=={{header" extract-section
        dup "{{task" head? [
            CHAR: \n over index [ 1 + tail ] when*
        ] when
    ] [ drop f ] if ;

: get-clean-description ( page -- description/f )
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

: get-plain-description ( page -- description/f )
    get-clean-description dup [
        [ [
            "raw.txt" utf8 set-file-contents
            ${
                os macos?
                "/opt/homebrew/bin/pandoc"
                "/usr/bin/pandoc" ?
                "-f" "mediawiki"
                "-t" "plain"
                "-o" "plain.txt"
                "raw.txt"
            } try-output-process
            "plain.txt" utf8 file-contents
        ] cleanup-unique-directory ] [
            dup output-process-error? [
                "description fallback" record-task-failure
            ] [ rethrow ] if
        ] recover
    ] when ;

: get-solution ( task -- solution/f )
    page-content [ get-plain-description ] keep over empty?
    [ 2drop f ] [
        [ string-lines [ "! " prepend ] map "\n" join ]
        [ "factor" get-code "\n\n" glue "\n" append ] bi*
    ] if ;

: task-path ( task -- path )
    [
        dup { [ Letter? ] [ digit? ] } 1||
        [ drop CHAR: - ] unless
    ] map >lower R/ --+/ "-" re-replace
    [ CHAR: - = ] trim ".factor" append ;

: save-task ( task -- )
    "vocab:rosetta-code/solutions" [
        [ get-solution ]
        [ task-path '[ _ utf8 set-file-contents ] when* ] bi
    ] with-directory ;

: report-task-failures ( -- )
    task-failures get dup empty? [ drop ] [
        "Articles needing attention ({ task stage error }):" print
        [ . ] each
    ] if ;

: save-tasks ( tasks -- )
    V{ } clone task-failures namespaces:set
    [
        dup . flush
        dup current-task [
            [ save-task ] [
                nip "save failed" record-task-failure
            ] recover
        ] with-variable
    ] each
    report-task-failures ;

: save-all-tasks ( -- )
    all-tasks save-tasks ;

: save-draft-tasks ( -- )
    draft-tasks save-tasks ;

: with-rosetta-code ( quot -- )
    [ "https://rosettacode.org/w/api.php" endpoint ] dip
    with-variable ; inline

! [ save-all-tasks ] with-rosetta-code
! [ save-draft-tasks ] with-rosetta-code
