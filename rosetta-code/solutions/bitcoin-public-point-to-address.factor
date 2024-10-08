! Bitcoin uses a specific encoding format to encode the digest of an
! elliptic curve public point into a short ASCII string. The purpose of
! this task is to perform such a conversion.
! 
! The encoding steps are:
! 
! -   take the X and Y coordinates of the given public point, and
!     concatenate them in order to have a 64 byte-longed string ;
! -   add one byte prefix equal to 4 (it is a convention for this way of
!     encoding a public point) ;
! -   compute the SHA-256 of this string ;
! -   compute the RIPEMD-160 of this SHA-256 digest ;
! -   compute the checksum of the concatenation of the version number
!     digit (a single zero byte) and this RIPEMD-160 digest, as described
!     in bitcoin/address validation ;
! -   Base-58 encode (see below) the concatenation of the version number
!     (zero in this case), the ripemd digest and the checksum
! 
! The base-58 encoding is based on an alphabet of alphanumeric characters
! (numbers, upper case and lower case, in that order) but without the four
! characters 0, O, l and I.
! 
! Here is an example public point:
! 
!     X = 0x50863AD64A87AE8A2FE83C1AF1A8403CB53F53E486D8511DAD8A04887E5B2352
!     Y = 0x2CD470243453A299FA9E77237716103ABC11A1DF38855ED6F2EE187E9C582BA6
! 
! The corresponding address should be: 16UwLL9Risc3QfPqBUvKofHmBQ7wMtjvM
! 
! Nb. The leading '1' is not significant as 1 is zero in base-58. It is
! however often added to the bitcoin address for various reasons. There
! can actually be several of them. You can ignore this and output an
! address without the leading 1.
! 
! Extra credit: add a verification procedure about the public point,
! making sure it belongs to the secp256k1 elliptic curve

USING: checksums checksums.ripemd checksums.sha io.binary kernel
math sequences ;
IN: rosetta-code.bitcoin.point-address

CONSTANT: ALPHABET "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

: btc-checksum ( bytes -- checksum-bytes )
    2 [ sha-256 checksum-bytes ] times 4 head ;

: bigint>base58 ( n -- str )
    33 [ 58 /mod ALPHABET nth ] "" replicate-as reverse nip ;

: >base58 ( bytes -- str )
    be> bigint>base58 ;

: point>address ( X Y -- address )
    [ 32 >be ] bi@ append
    0x4 prefix
    sha-256 checksum-bytes
    ripemd-160 checksum-bytes
    dup 0 prefix btc-checksum
    append 0 prefix >base58 ;

