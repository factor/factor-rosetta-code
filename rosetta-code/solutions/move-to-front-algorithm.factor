! Given a symbol table of a zero-indexed array of all possible input
! symbols this algorithm reversibly transforms a sequence of input symbols
! into an array of output numbers (indices).
! 
! The transform in many cases acts to give frequently repeated input
! symbols lower indices which is useful in some compression algorithms.
! 
! Encoding algorithm:
! 
!         for each symbol of the input sequence:
!             output the index of the symbol in the symbol table
!             move that symbol to the front of the symbol table
! 
! Decoding algorithm:
! 
!         # Using the same starting symbol table
!         for each index of the input sequence:
!             output the symbol at that index of the symbol table
!             move that symbol to the front of the symbol table
! 
! Example:
! 
! Encoding the string of character symbols 'broood' using a symbol table
! of the lowercase characters a-to-z
! 
!     
! 
!         {| class="wikitable" border="1"
! 
! |- ! Input ! Output ! SymbolTable |- | broood | 1 |
! 'abcdefghijklmnopqrstuvwxyz' |- | broood | 1 17 |
! 'bacdefghijklmnopqrstuvwxyz' |- | broood | 1 17 15 |
! 'rbacdefghijklmnopqstuvwxyz' |- | broood | 1 17 15 0 |
! 'orbacdefghijklmnpqstuvwxyz' |- | broood | 1 17 15 0 0 |
! 'orbacdefghijklmnpqstuvwxyz' |- | broood | 1 17 15 0 0 5 |
! 'orbacdefghijklmnpqstuvwxyz' |}
! 
! Decoding the indices back to the original symbol order:
! 
!     
! 
!         {| class="wikitable" border="1"
! 
! |- ! Input ! Output ! SymbolTable |- | 1 17 15 0 0 5 | b |
! 'abcdefghijklmnopqrstuvwxyz' |- | 1 17 15 0 0 5 | br |
! 'bacdefghijklmnopqrstuvwxyz' |- | 1 17 15 0 0 5 | bro |
! 'rbacdefghijklmnopqstuvwxyz' |- | 1 17 15 0 0 5 | broo |
! 'orbacdefghijklmnpqstuvwxyz' |- | 1 17 15 0 0 5 | brooo |
! 'orbacdefghijklmnpqstuvwxyz' |- | 1 17 15 0 0 5 | broood |
! 'orbacdefghijklmnpqstuvwxyz' |}
! 
! Task:
! 
! -   -   Encode and decode the following three strings of characters
!         using the symbol table of the lowercase characters a-to-z as
!         above.
!     -   Show the strings and their encoding here.
!     -   Add a check to ensure that the decoded string is the same as the
!         original.
! 
! The strings are:
! 
!    broood          
!    bananaaa     
!    hiphophiphop  
! 
! (Note the misspellings in the above strings.)

USING: formatting kernel locals make sequences ;

: to-front ( elt seq -- seq' ) over [ remove ] dip prefix ;

: encode ( symbols msg -- indices )
    [ [ swap 2dup index , to-front ] each ] { } make nip ;

: decode ( symbols indices -- msg )
    [ [ swap [ nth ] keep over , to-front ] each ] "" make nip ;

:: round-trip ( msg symbols -- )
    symbols msg encode :> encoded
    symbols encoded decode :> decoded
    msg decoded assert=
    msg encoded decoded "%s -> %u -> %s\n" printf ;

"broood" "bananaaa" "hiphophiphop"
[ "abcdefghijklmnopqrstuvwxyz" round-trip ] tri@
