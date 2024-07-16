! Using the link element defined in Singly-Linked List (element), define a
! method to insert an element into a singly-linked list following a given
! element.
! 
! Using this method, insert an element C into a list comprised of elements
! A->B, following element A.

: list-append ( previous new -- )
    [ swap next>> >>next drop ] [ >>next drop ] 2bi ;

SYMBOLS: A B C ;

A <linked-list>
[ C <linked-list> list-append ] keep
[ B <linked-list> list-append ] keep
.
