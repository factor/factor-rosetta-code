! Convert an array of bytes or binary string to the base64-encoding of
! that string and output that value. Use the icon for Rosetta Code as the
! data to convert.
! 
! See also Base64 decode data.

USING: base64 http.client io kernel strings ;

"http://rosettacode.org/favicon.ico" http-get nip
>base64-lines >string print
