! Task:
! 
! Provide a function or mechanism to convert a provided string into URL
! encoding representation.
! 
! In URL encoding, special characters, control characters and extended
! characters are converted into a percent symbol followed by a two digit
! hexadecimal code, So a space character encodes into %20 within the
! string.
! 
! For the purposes of this task, every character except 0-9, A-Z and a-z
! requires conversion, so the following characters all require conversion
! by default:
! 
! -   ASCII control codes (Character ranges 00-1F hex (0-31 decimal) and
!     7F (127 decimal).
! -   ASCII symbols (Character ranges 32-47 decimal (20-2F hex))
! -   ASCII symbols (Character ranges 58-64 decimal (3A-40 hex))
! -   ASCII symbols (Character ranges 91-96 decimal (5B-60 hex))
! -   ASCII symbols (Character ranges 123-126 decimal (7B-7E hex))
! -   Extended characters with character codes of 128 decimal (80 hex) and
!     above.
! 
! Example:
! 
! The string "http://foo bar/" would be encoded as
! "http%3A%2F%2Ffoo%20bar%2F".
! 
! Variations:
! 
! -   Lowercase escapes are legal, as in "http%3a%2f%2ffoo%20bar%2f".
! -   Special characters have different encodings for different standards:
!     -   RFC 3986, Uniform Resource Identifier (URI): Generic Syntax,
!         section 2.3, says to preserve "-._~".
!     -   HTML 5, section 4.10.22.5 URL-encoded form data, says to
!         preserve "-._*", and to encode space " " to "+".
!     -   encodeURI function in Javascript will preserve "-._~" (RFC 3986)
!         and ";,/?:@&=+$!*'()#".
! 
! Options:
! 
! It is permissible to use an exception string (containing a set of
! symbols that do not need to be converted). However, this is an optional
! feature and is not a requirement of this task.
! 
! Related tasks:
! 
! -   URL decoding
! -   URL parser
! 
! Category:String manipulation Category: Encodings

USING: combinators.short-circuit unicode urls.encoding.private ;

: my-url-encode ( str -- encoded )
    [ { [ alpha? ] [ "-._~" member? ] } 1|| ] (url-encode) ;

"http://foo bar/" my-url-encode print
