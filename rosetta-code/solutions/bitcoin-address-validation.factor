! Task:
! 
! Write a program that takes a bitcoin address as argument, and checks
! whether or not this address is valid.
! 
! A bitcoin address uses a base58 encoding, which uses an alphabet of the
! characters 0 .. 9, A ..Z, a .. z, but without the four characters:
! 
! -   -   0 zero
!     -   O uppercase oh
!     -   I uppercase eye
!     -   l lowercase ell
! 
! With this encoding, a bitcoin address encodes 25 bytes:
! 
! -   the first byte is the version number, which will be zero for this
!     task ;
! -   the next twenty bytes are a RIPEMD-160 digest, but you don't have to
!     know that for this task: you can consider them a pure arbitrary data
!     ;
! -   the last four bytes are a checksum check. They are the first four
!     bytes of a double SHA-256 digest of the previous 21 bytes.
! 
! To check the bitcoin address, you must read the first twenty-one bytes,
! compute the checksum, and check that it corresponds to the last four
! bytes.
! 
! The program can either return a boolean value or throw an exception when
! not valid.
! 
! You can use a digest library for SHA-256.
! 
! Example of a bitcoin address:
! 
! 1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i
! 
! It doesn't belong to anyone and is part of the test suite of the bitcoin
! software.
! 
! You can change a few characters in this string and check that it'll fail
! the test.

USING: byte-arrays checksums checksums.sha io.binary kernel math
math.parser sequences ;
IN: rosetta-code.bitcoin.validation

CONSTANT: ALPHABET "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

: base58>bigint ( str -- n )
  [ ALPHABET index ]
  [ [ 58 * ] [ + ] bi* ] map-reduce ;

: base58> ( str -- bytes ) base58>bigint 25 >be ;

: btc-checksum ( bytes -- checksum-bytes )
  21 head 2 [ sha-256 checksum-bytes ] times 4 head ;

: btc-valid? ( str -- ? ) base58> [ btc-checksum ] [ 4 tail* ] bi = ;

