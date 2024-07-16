! Write a function or program that can split a string at each non-escaped
! occurrence of a separator character.
! 
! It should accept three input parameters:
! 
! -   -   The string
!     -   The separator character
!     -   The escape character
! 
! It should output a list of strings.
! 
! Rules for splitting:
! 
! -   The fields that were separated by the separators, become the
!     elements of the output list.
! -   Empty fields should be preserved, even at the start and end.
! 
! Rules for escaping:
! 
! -   "Escaped" means preceded by an occurrence of the escape character
!     that is not already escaped itself.
! -   When the escape character precedes a character that has no special
!     meaning, it still counts as an escape (but does not do anything
!     special).
! -   Each occurrence of the escape character that was used to escape
!     something, should not become part of the output.
! 
! Demonstrate that your function satisfies the following test-case:
! 
! +----------------------------------------------+----------------------+
! | Input                                        | Output               |
! +==============================================+======================+
! | +--------------+-------+--------------+      | +------------------+ |
! | | string:      |       | th           |      | |     one|uno      | |
! | |              |       | ree^^^^|four |      | +------------------+ |
! | |              |       | ^^^|^cuatro| |      | |                  | |
! | +--------------+-------+--------------+      | +------------------+ |
! | | separator    |     | |              |      | |     three^^      | |
! | | character:   |       |              |      | +------------------+ |
! | +--------------+-------+--------------+      | |     four^|cuatro | |
! | | escape       |     ^ |              |      | +------------------+ |
! | | character:   |       |              |      | |                  | |
! | +--------------+-------+--------------+      | +------------------+ |
! +----------------------------------------------+----------------------+
! 
! (Print the output list in any format you like, as long as it is it easy
! to see what the fields are.)

USING: accessors kernel lists literals namespaces
parser-combinators prettyprint sequences strings ;

SYMBOLS: esc sep ;

: set-chars ( m n -- ) [ sep set ] [ esc set ] bi* ;
: escape ( -- parser ) esc get 1token ;
: escaped ( -- parser ) escape any-char-parser &> ;
: separator ( -- parser ) sep get 1token ;

: character ( -- parser )
    ${ esc get sep get } [ member? not ] curry satisfy ;

: my-token ( -- parser ) escaped character <|> <*> ;

: token-list ( -- parser )
    my-token separator list-of [ [ >string ] map ] <@ ;

: tokenize ( str sep-char esc-char -- seq )
    set-chars token-list parse car parsed>> ;

"one^|uno||three^^^^|four^^^|^cuatro|"
CHAR: | CHAR: ^ tokenize .
