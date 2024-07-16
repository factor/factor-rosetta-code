! Task:
! 
! Generate an array, list, lazy sequence, or even an indexable string of
! all the lower case ASCII characters, from a to z. If the standard
! library contains such a sequence, show how to access it, but don't fail
! to show how to generate a similar sequence.
! 
! For this basic task use a reliable style of coding, a style fit for a
! very large program, and use strong typing if available. It's bug prone
! to enumerate all the lowercase characters manually in the code.
! 
! During code review it's not immediate obvious to spot the bug in a Tcl
! line like this contained in a page of code:
! 
!     set alpha {a b c d e f g h i j k m n o p q r s t u v w x y z}

USING: spelling ; ! ALPHABET

ALPHABET print
0x61 0x7A [a,b] >string print
: russian-alphabet-without-io ( -- str ) 0x0430 0x0450 [a,b) >string ;
: russian-alphabet ( -- str ) 0x0451 6 russian-alphabet-without-io insert-nth ;
russian-alphabet print
