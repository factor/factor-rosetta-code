! Within a string, an escape sequence gives special meaning to otherwise
! ordinary characters.
! 
! For example, in the C programming language, the string literal "a\nb",
! containing the escape sequence \n, would be interpreted by the compiler
! as the bytes 61 0a 62, not 61 5c 6e 62.
! 
! In JavaScript Object Notation, the string value "a\u263Ac", containing
! the escape sequence \u263A, would be parsed into "a☺c".
! 
! Task
! 
! Write a function (or routine, subroutine, procedure, etc.) that, when
! given a UTF-8 encoded string, returns a new string, also encoded in
! UTF-8, with all escape sequences replaced with equivalent Unicode code
! points.
! 
! For this task we'll follow JSON string semantics, defined in Section 7
! of RFC 8259. In summary:
! 
! -   Allowed two-character escapes are \\, \", \/, \b, \f, \n, \r, \t.
! -   ", \ and control characters (U+0000 through U+001F) must be escaped.
! -   Any "character" in the Basic Multilingual Plane may be escaped with
!     a \uXXXX sequence, where XXXX are hexadecimal digits encoding the
!     character's code point
! -   Characters outside the Basic Multilingual Plane may be escaped with
!     a \uXXXX\uXXXX sequence, where XXXX are hexadecimal digits encoding
!     the code point using UTF-16.
! 
! Although not required by RFC 8259, we'll treat strings containing
! invalid \u escape sequences (those that can't be decoded to a Unicode
! code point) as an error condition.
! 
! Test your program with the following inputs and display the string
! before and after unescaping. It's OK to display bytes rather than
! "characters" if it's more convenient for your language, or both, if you
! prefer.
! 
! Test cases
! 
!   Input string         Expected result   Comment
!   -------------------- ----------------- ------------------------------------------
!   abc                  abc               No escape sequences
!   a☺c                  a☺c               No escape sequences, extended unicode
!   a\"c                 a"c               Two-character escape
!   \u0061\u0062\u0063   abc               Just escape sequences
!   a\\c                 a\c               Two-character escape for reverse solidus
!   a\u263Ac             a☺c               \u escape, basic multilingual plane
!   a\\u263Ac            a\u263Ac          Escaped \ before u
!   a\uD834\uDD1Ec       a𝄞c               \u escape, surrogate pair
!   a\ud834\udd1ec       a𝄞c               Lower case hex digits
!   a\u263               error             Incomplete escape sequence
!   a\u263Xc             error             Invalid hexadecimal digit
!   a\uDD1Ec             error             Lone low surrogate
!   a\uD834c             error             Lone high surrogate
!   a\uD834\u263Ac       error             High surrogate followed by non-surrogate
!                                          
! 
! Related tasks
! 
! -   Literals/String
! -   Special characters
! -   UTF-8 encode and decode


