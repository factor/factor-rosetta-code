! The popular encoding of small and medium-sized checksums is base16, that
! is more compact than usual base10 and is human readable... For checksums
! resulting in hash digests bigger than ~100 bits, the base16 is too long:
! base58 is shorter and (when using good alphabet) preserves secure human
! readability. The most popular alphabet of base58 is the variant used in
! bitcoin address (see Bitcoin/address validation), so it is the "default
! base58 alphabet".
! 
! Write a program that takes a checksum (resultant hash digest) integer
! binary representation as argument, and converts (encode it) into base58
! with the standard Bitcoin alphabet — which uses an alphabet of the
! characters 0 .. 9, A ..Z, a .. z, but without the four characters:
! 
! -   -   O the uppercase letter "oh",
!     -   I the uppercase letter "eye",
!     -   l the lowercase letter "ell", and
!     -   0 the digit zero.
! 
! The reference algorithm is at the Bitcoin's Base58Check page.
! 
! Category:Encodings Category:Checksums


