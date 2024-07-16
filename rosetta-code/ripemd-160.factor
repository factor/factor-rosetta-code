! RIPEMD-160 is another hash function; it computes a 160-bit message
! digest.
! 
! There is a RIPEMD-160 home page, with test vectors and pseudocode for
! RIPEMD-160. For padding the message, RIPEMD-160 acts like MD4 (RFC
! 1320).
! 
! Find the RIPEMD-160 message digest of a string of octets. Use the ASCII
! encoded string “Rosetta Code”. You may either call an RIPEMD-160
! library, or implement RIPEMD-160 in your language.

USING: checksums checksums.ripemd io math.parser ;

"Rosetta Code" ripemd-160 checksum-bytes bytes>hex-string print
