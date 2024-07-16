! The task is to programmatically obtain the name used to invoke the
! program. (For example determine whether the user ran "python hello.py",
! or "python hellocaller.py", a program importing the code from
! "hello.py".)
! 
! Sometimes a multiline shebang is necessary in order to provide the
! script name to a language's internal ARGV.
! 
! See also Command-line arguments
! 
! Examples from GitHub.

#! /usr/bin/env factor
 
USING: namespaces io command-line ;
IN: scriptname
 
: main ( -- ) script get print ;
 
MAIN: main
