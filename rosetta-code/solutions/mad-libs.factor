! Mad Libs is a phrasal template word game where one player prompts
! another for a list of words to substitute for blanks in a story, usually
! with funny results.
! 
! Task;
! 
! Write a program to create a Mad Libs like story.
! 
! The program should read an arbitrary multiline story from input.
! 
! The story will be terminated with a blank line.
! 
! Then, find each replacement to be made within the story, ask the user
! for a word to replace it with, and make all the replacements.
! 
! Stop when there are none left and print the final story.
! 
! The input should be an arbitrary story in the form:
! 
!     <name> went for a walk in the park. <he or she>
!     found a <noun>. <name> decided to take it home.
! 
! Given this example, it should then ask for a name, a he or she and a
! noun (<name> gets replaced both times with the same value).

USING: formatting io kernel make regexp sequences sets splitting ;
IN: rosetta-code.mad-libs

: get-mad-lib ( -- str )
    "Enter a mad lib. A blank line signals end of input." print
    [
        [ "> " write flush readln dup , empty? f t ? ] loop
    ] { } make harvest "\n" join ;

: find-replacements ( str -- seq )
    R/ <[\w\s]+>/ all-matching-subseqs members ;

: query ( str -- str )
    rest but-last "Enter a(n) %s: " printf flush readln ;

: replacements ( str seq -- str )
    dup [ query ] map [ replace ] 2each ;

: mad-libs ( -- )
    get-mad-lib dup find-replacements replacements nl print ;

MAIN: mad-libs
