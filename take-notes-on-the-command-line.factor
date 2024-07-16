! Invoking NOTES without commandline arguments displays the current
! contents of the local NOTES.TXT if it exists. If NOTES has arguments,
! the current date and time are appended to the local NOTES.TXT followed
! by a newline. Then all the arguments, joined with spaces, prepended with
! a tab, and appended with a trailing newline, are written to NOTES.TXT.
! If NOTES.TXT doesn't already exist in the current directory then a new
! NOTES.TXT file should be created.
! 
! Category:Basic language learning Category:Programming environment
! operations

#! /usr/bin/env factor
USING: kernel calendar calendar.format io io.encodings.utf8 io.files
sequences command-line namespaces ;

command-line get [
    "notes.txt" utf8 file-contents print
] [
    " " join "\t" prepend
    "notes.txt" utf8 [
        now timestamp>ymdhms print
        print flush
    ] with-file-appender
] if-empty
