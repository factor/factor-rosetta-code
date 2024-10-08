! Task:
! 
! Open a text file and count the occurrences of each letter.
! 
! Some of these programs count all characters (including punctuation), but
! some only count letters A to Z.
! 
! Category:Randomness

USING: hashtables locals io assocs kernel io.encodings.utf8 io.files formatting ;
IN: count-letters

<PRIVATE

: count-from-stream ( -- counts )
  52 <hashtable>
  [ read1 dup ] [ over inc-at ] while
  drop ;

: print-counts ( counts -- )
  [ "%c: %d\n" printf ] assoc-each ;

PRIVATE>

: count-letters ( filename -- )
  utf8 [ count-from-stream ] with-file-reader
    print-counts ;

