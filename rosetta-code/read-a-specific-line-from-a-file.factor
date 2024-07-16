! Some languages have special semantics for obtaining a known line number
! from a file.
! 
! Task:
! 
! Demonstrate how to obtain the contents of a specific line within a file.
! 
! For the purpose of this task demonstrate how the contents of the seventh
! line of a file can be obtained, and store it in a variable or in memory
! (for potential future use within the program if the code were to become
! embedded).
! 
! If the file does not contain seven lines, or the seventh line is empty,
! or too big to be retrieved, output an appropriate message.
! 
! If no special semantics are available for obtaining the required line,
! it is permissible to read line by line.
! 
! Note that empty lines are considered and should still be counted.
! 
! Also note that for functional languages or languages without variables
! or storage, it is permissible to output the extracted data to standard
! output.

USING: continuations fry io io.encodings.utf8 io.files kernel
math ;
IN: rosetta-code.nth-line

: nth-line ( path encoding n -- str/f )
    [ f ] 3dip '[
        [ _ [ drop readln [ return ] unless* ] times ]
        with-return
    ] with-file-reader ;

: nth-line-demo ( -- )
    "input.txt" utf8 7 nth-line [ "line not found" ] unless*
    print ;

MAIN: nth-line-demo
