! Task:
! 
! Display a substring:
! 
! -   -   starting from n characters in and of m length;
!     -   starting from '''n''' characters in, up to the end of the
!         string;
!     -   whole string minus the last character;
!     -   starting from a known character within the string and of m
!         length;
!     -   starting from a known substring within the string and of m
!         length.
! 
! If the program uses UTF-8 or UTF-16, it must work on any valid Unicode
! code point, whether in the Basic Multilingual Plane or above it.
! 
! The program must reference logical characters (code points), not 8-bit
! code units for UTF-8 or 16-bit code units for UTF-16.
! 
! Programs for other encodings (such as 8-bit ASCII, or EUC-JP) are not
! required to handle all Unicode characters.
! 
! Category:String manipulation Category:Simple Category:Strings

USING: math sequences kernel ;

! starting from n characters in and of m length
: subseq* ( from length seq -- newseq ) [ over + ] dip subseq ;

! starting from n characters in, up to the end of the string
: dummy ( seq n -- tailseq ) tail ;

! whole string minus last character
: dummy1 ( seq -- headseq ) but-last ;

USING: fry sequences kernel ;
! helper word
: subseq-from-* ( subseq len seq quot -- seq ) [ nip ] prepose 2keep subseq* ; inline

! starting from a known character within the string and of m length;
: subseq-from-char ( char len seq -- seq ) [ index ] subseq-from-* ;

! starting from a known substring within the string and of m length. 
: subseq-from-seq ( subseq len seq -- seq ) [ start ] subseq-from-* ;
