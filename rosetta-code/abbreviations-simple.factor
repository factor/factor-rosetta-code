! The use of abbreviations (also sometimes called synonyms, nicknames,
! AKAs, or aliases) can be an
! 
! easy way to add flexibility when specifying or using commands,
! sub─commands, options, etc.
! 
! For this task, the following command table will be used:
! 
!    add 1  alter 3  backup 2  bottom 1  Cappend 2  change 1  Schange  Cinsert 2  Clast 3
!    compress 4 copy 2 count 3 Coverlay 3 cursor 3  delete 3 Cdelete 2  down 1  duplicate
!    3 xEdit 1 expand 3 extract 3  find 1 Nfind 2 Nfindup 6 NfUP 3 Cfind 2 findUP 3 fUP 2
!    forward 2  get  help 1 hexType 4  input 1 powerInput 3  join 1 split 2 spltJOIN load
!    locate 1 Clocate 2 lowerCase 3 upperCase 3 Lprefix 2  macro  merge 2 modify 3 move 2
!    msg  next 1 overlay 1 parse preserve 4 purge 3 put putD query 1 quit  read recover 3
!    refresh renum 3 repeat 3 replace 1 Creplace 2 reset 3 restore 4 rgtLEFT right 2 left
!    2  save  set  shift 2  si  sort  sos  stack 3 status 4 top  transfer 3  type 1  up 1
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
!     -   a command is followed by an optional number, which indicates the
!         minimum abbreviation
!     -   A valid abbreviation is a word that has:
!         -   at least the minimum length of the word's minimum number in
!             the command table
!         -   compares equal (regardless of case) to the leading
!             characters of the word in the command table
!         -   a length not longer than the word in the command table
!             -   ALT, aLt, ALTE, and ALTER are all abbreviations of ALTER
!                 3
!             -   AL, ALF, ALTERS, TER, and A aren't valid abbreviations
!                 of ALTER 3
!             -   The 3 indicates that any abbreviation for ALTER must be
!                 at least three characters
!             -   Any word longer than five characters can't be an
!                 abbreviation for ALTER
!             -   o, ov, oVe, over, overL, overla are all acceptable
!                 abbreviations for overlay 1
!     -   if there isn't a number after the command, then there isn't an
!         abbreviation permitted
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

USING: arrays assocs combinators formatting fry grouping.extras
kernel literals math math.parser multiline sequences
splitting.extras unicode ;
IN: rosetta-code.abbr-simple

CONSTANT: input $[
"riG   rePEAT copies  put mo   rest    types   fup.    6       "
"poweRin" append
]

<<     ! Make the following two words available at parse time.

: abbr-pair ( first second -- seq/f )
    {
        { [ 2dup drop [ digit? ] all? ] [ 2drop f ] }
        {
            [ 2dup nip [ Letter? ] all? ]
            [ drop >upper 0 2array ]
        }
        [ [ >upper ] [ string>number ] bi* 2array ]
    } cond ;

: parse-commands ( seq -- seq )
    " \n" split-harvest [ abbr-pair ] 2clump-map sift ;

>>

CONSTANT: commands $[
HEREDOC: END
add 1  alter 3  backup 2  bottom 1  Cappend 2  change 1  Schange
Cinsert 2  Clast 3 compress 4 copy 2 count 3 Coverlay 3 cursor 3
delete 3 Cdelete 2  down 1  duplicate 3 xEdit 1 expand 3 extract
3 find 1 Nfind 2 Nfindup 6 NfUP 3 Cfind 2 findUP 3 fUP 2 forward
2  get  help 1  hexType 4  input 1 powerInput 3  join  1 split 2
spltJOIN load locate 1 Clocate 2 lowerCase 3 upperCase 3 Lprefix
2  macro  merge 2  modify  3  move 2 msg  next 1 overlay 1 parse
preserve 4 purge 3 put putD query 1 quit  read recover 3 refresh
renum 3 repeat 3 replace 1 Creplace  2 reset 3 restore 4 rgtLEFT
right 2 left 2  save  set  shift 2  si  sort sos  stack 3 status
4 top  transfer 3  type 1  up 1
END
parse-commands
]

: valid-abbrevs ( assoc seq -- assoc )
    dup '[ [ _ head? ] [ _ length <= ] bi* and ] assoc-filter ;

: find-command ( seq -- seq )
    >upper [ commands ] dip valid-abbrevs
    [ "*error*" ] [ first first ] if-empty ;

: (find-commands) ( seq -- seq )
    " " split-harvest [ find-command ] map " " join ;

: find-commands ( seq -- seq )
    dup empty? not [ (find-commands) ] when ;

: show-commands ( seq -- )
    dup find-commands " Input: \"%s\"\nOutput: \"%s\"\n" printf
    ;

: main ( -- ) input "" [ show-commands ] bi@ ;

MAIN: main
