! SHA-256 is the recommended stronger alternative to SHA-1. See FIPS PUB
! 180-4 for implementation details.
! 
! Either by using a dedicated library or implementing the algorithm in
! your language, show that the SHA-256 digest of the string "Rosetta code"
! is: 764faf5c61ac315f1497f9dfa542713965b785e5cc2f707d6468d7d1124cdfcf

USING: checksums checksums.sha io math.parser ;

"Rosetta code" sha-256 checksum-bytes bytes>hex-string print
