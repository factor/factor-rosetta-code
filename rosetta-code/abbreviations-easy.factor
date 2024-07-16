! This task is an easier (to code) variant of the Rosetta Code task:
! Abbreviations, simple.
! 
! For this task, the following command table will be used:
! 
!    Add ALTer  BAckup Bottom  CAppend Change SCHANGE  CInsert CLAst COMPress COpy
!    COUnt COVerlay CURsor DELete CDelete Down DUPlicate Xedit EXPand EXTract Find
!    NFind NFINDUp NFUp CFind FINdup FUp FOrward GET Help HEXType Input POWerinput
!    Join SPlit SPLTJOIN  LOAD  Locate CLocate  LOWercase UPPercase  LPrefix MACRO
!    MErge MODify MOve MSG Next Overlay PARSE PREServe PURge PUT PUTD  Query  QUIT
!    READ  RECover REFRESH RENum REPeat  Replace CReplace  RESet  RESTore  RGTLEFT
!    RIght LEft  SAVE  SET SHift SI  SORT  SOS  STAck STATus  TOP TRAnsfer Type Up
! 
! Notes concerning the above command table:
! 
! -   -   it can be thought of as one long literal string (with blanks at
!         end-of-lines)
!     -   it may have superfluous blanks
!     -   it may be in any case (lower/upper/mixed)
!     -   the order of the words in the command table must be preserved as
!         shown
!     -   the user input(s) may be in any case (upper/lower/mixed)
!     -   commands will be restricted to the Latin alphabet (A ──► Z, a
!         ──► z)
!     -   A valid abbreviation is a word that has:
!         -   at least the minimum length of the number of capital letters
!             of the word in the command table
!         -   compares equal (regardless of case) to the leading
!             characters of the word in the command table
!         -   a length not longer than the word in the command table
!             -   ALT, aLt, ALTE, and ALTER are all abbreviations of ALTer
!             -   AL, ALF, ALTERS, TER, and A aren't valid abbreviations
!                 of ALTer
!             -   The number of capital letters in ALTer indicates that
!                 any abbreviation for ALTer must be at least three
!                 letters
!             -   Any word longer than five characters can't be an
!                 abbreviation for ALTer
!             -   o, ov, oVe, over, overL, overla are all acceptable
!                 abbreviations for Overlay
!     -   if there isn't any lowercase letters in the word in the command
!         table, then there isn't an abbreviation permitted
! 
! Task:
! 
! -   -   The command table needn't be verified/validated.
!     -   Write a function to validate if the user "words" (given as
!         input) are valid (in the command table).
!     -   If the word is valid, then return the full uppercase version of
!         that "word".
!     -   If the word isn't valid, then return the lowercase string:
!         *error* (7 characters).
!     -   A blank input (or a null input) should return a null string.
!     -   Show all output here.
! 
! An example test case to be used for this task:
! 
! For a user string of:
! 
!  riG   rePEAT copies  put mo   rest    types   fup.    6       poweRin
! 
! the computer program should return the string:
! 
!  RIGHT REPEAT *error* PUT MOVE RESTORE *error* *error* *error* POWERINPUT

USING: arrays ascii assocs combinators.short-circuit io kernel
literals math qw sequences sequences.extras splitting.extras ;
IN: rosetta-code.abbreviations-easy

CONSTANT: commands qw{
Add ALTer  BAckup Bottom  CAppend Change SCHANGE  CInsert CLAst
COMPress COpy COUnt COVerlay CURsor DELete CDelete Down
DUPlicate Xedit EXPand EXTract Find NFind NFINDUp NFUp CFind
FINdup FUp FOrward GET Help HEXType Input POWerinput Join SPlit
SPLTJOIN  LOAD  Locate CLocate  LOWercase UPPercase  LPrefix
MACRO MErge MODify MOve MSG Next Overlay PARSE PREServe PURge
PUT PUTD  Query  QUIT READ  RECover REFRESH RENum REPeat
Replace CReplace  RESet  RESTore  RGTLEFT RIght LEft  SAVE  SET
SHift SI  SORT  SOS  STAck STATus  TOP TRAnsfer Type Up }

CONSTANT: user-input $[ "riG   rePEAT copies  put mo   rest    "
"types   fup.    6       poweRin" append ]

: starts-with? ( cand com -- ? ) [ >upper ] bi@ start 0 = ;
: capitals ( str -- n ) [ LETTER? ] count ;
: min-len? ( candidate command -- ? ) capitals swap length <= ;
: not-longer? ( candidate command -- ? ) [ length ] bi@ <= ;
: permitted? ( candidate command -- ? ) dup [ letter? ] count 0
    > [ [ >upper ] bi@ = ] dip or ;
    
: valid-abbr? ( candidate command -- ? )
    {
        [ permitted?   ]
        [ starts-with? ]
        [ min-len?     ]
        [ not-longer?  ]
    } 2&& ;

: find-command ( candidate -- command/f )
    commands swap [ swap valid-abbr? ] curry find nip ;
    
: process-candidate ( candidate -- abbr/error )
    find-command [ >upper ] [ "*error*" ] if* ;
    
: process-user-string ( str -- seq ) dup "" = [ drop "" ]
    [ " " split-harvest [ process-candidate ] map ] if ;
    
: .abbr ( input -- )
    [ " " split-harvest ] [ process-user-string ] bi zip
    [ first2 32 pad-longest 2array ] map
    [ keys ] [ values ] bi
    [ " " join ] bi@
    [ "User words: " write print ]
    [ "Full words: " write print ] bi* ;
    
: main ( -- ) user-input "" [ .abbr ] bi@ ;
    
MAIN: main
