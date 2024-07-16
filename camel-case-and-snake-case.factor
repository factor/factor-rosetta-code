! Two common conventions for naming of computer program variables are
! Snake Case and Camel Case.
! 
! Snake case variables are generally all lower case, with an underscore
! between words in the variable, as in snake_case_variable'. Camel case
! variables are generally lower case first (except in some Pascal
! conventions or with class names in many other languages), with
! captalization of the initial letter of the words within the variable, as
! in 'camelCaseVariable'.
! 
! Leading underscores are not used in such variables except as part of a
! different naming convention, usually for special internal or system
! variables. White space is not permitted as part of camel case or snake
! case variable names.
! 
! Task:
! 
! -   -   Write two functions, one to change snake case to camel case and
!         one to change camel case to snake case. If possible, generalize
!         the function enough to apply to strings containing spaces
!         between words or a `-` dash between words, assuming that in
!         those cases a space or hyphen is a also a separator character,
!         like `_`, for the purpose of creating a new variable name.
!         Leading or trailing whitespace may be ignored.
! 
! -   -   Show the results on changing to both snake case and camel case
!         for each of the following strings:
! 
!     "snakeCase", "snake_case", "variable_10_case", "variable10Case", "ɛrgo rE tHis",
!     "hurry-up-joe!", "c://my-docs/happy_Flag-Day/12.doc", "  spaces  "
! 
! Related tasks:
! 
! -   Naming_conventions

USING: formatting kernel math regexp sequences splitting
splitting.extras unicode ;

! ignore leading/trailing whitespace
: preserve ( str quot -- newstr )
    [ [ blank? ] split-head [ blank? ] split-tail swap ] dip
    call glue ; inline

: >snake ( str -- newstr )
    [
        R/ (\p{lower}\p{upper}|\d\p{alpha}|\p{alpha}\d)/
        [ 1 short cut >lower "_" glue ] re-replace-with
        R/ [\s-]/ "_" re-replace
    ] preserve ;

: capitalize ( str -- newstr ) 1 short cut swap >upper prepend ;

: >camel ( str -- newstr )
    [
        "\s_-" split harvest 1 short cut
        [ capitalize ] map append "" join
    ] preserve ;

: test ( str -- )
    dup >snake over dup >camel
    "%u >snake %u\n%u >camel %u\n" printf ;

{
    "snakeCase" "snake_case" "variable_10_case" "variable10Case"
    "ɛrgo rE tHis" "hurry-up-joe!"
    "c://my-docs/happy_Flag-Day/12.doc" "  spaces  "
    "   internal space   "
} [ test ] each
