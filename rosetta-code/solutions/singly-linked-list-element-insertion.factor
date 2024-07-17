! Using this method, insert an element C into a list comprised of elements
! A->B, following element A.

: list-append ( previous new -- )
    [ swap next>> >>next drop ] [ >>next drop ] 2bi ;

SYMBOLS: A B C ;

A <linked-list>
[ C <linked-list> list-append ] keep
[ B <linked-list> list-append ] keep
.
