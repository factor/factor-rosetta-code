! Task:
! 
! Replace every occurring instance of a piece of text in a group of text
! files with another one.
! 
! For this task we want to replace the text "Goodbye London!" with "Hello
! New York!" for a list of files.

USING: fry io.encodings.utf8 io.files kernel qw sequences
splitting ;

: global-replace ( files old new -- )
    '[
        [ utf8 file-contents _ _ replace ]
        [ utf8 set-file-contents ] bi
    ] each ;


qw{ a.txt b.txt c.txt }
"Goodbye London!" "Hello New York!" global-replace
