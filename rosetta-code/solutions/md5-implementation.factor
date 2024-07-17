! The purpose of this task to code and validate an implementation of the
! MD5 Message Digest Algorithm by coding the algorithm directly (not using
! a call to a built-in or external hashing library). For details of the
! algorithm refer to MD5 on Wikipedia or the MD5 definition in IETF RFC
! (1321).
! 
! -   The implementation needs to implement the key functionality namely
!     producing a correct message digest for an input string. It is not
!     necessary to mimic all of the calling modes such as adding to a
!     digest one block at a time over subsequent calls.
! -   In addition to coding and verifying your implementation, note any
!     challenges your language presented implementing the solution,
!     implementation choices made, or limitations of your solution.
! -   Solutions on this page should implement MD5 directly and NOT use
!     built in (MD5) functions, call outs to operating system calls or
!     library routines written in other languages as is common in the
!     original MD5 task.
! -   The following are acceptable:
!     -   An original implementation from the specification, reference
!         implementation, or pseudo-code
!     -   A translation of a correct implementation from another language
!     -   A library routine in the same language; however, the source must
!         be included here.
! 
! The solutions shown here will provide practical illustrations of bit
! manipulation, unsigned integers, working with little-endian data.
! Additionally, the task requires an attention to details such as boundary
! conditions since being out by even 1 bit will produce dramatically
! different results. Subtle implementation bugs can result in some hashes
! being correct while others are wrong. Not only is it critical to get the
! individual sub functions working correctly, even small errors in
! padding, endianness, or data layout will result in failure.
! 
! The following verification strings and hashes come from RFC 1321:
! 
!                                 hash code <== string 
!        0xd41d8cd98f00b204e9800998ecf8427e <== ""  
!        0x0cc175b9c0f1b6a831c399e269772661 <== "a"
!        0x900150983cd24fb0d6963f7d28e17f72 <== "abc"
!        0xf96b697d7cb7938d525a2f31aaf161d0 <== "message digest"
!        0xc3fcd3d76192e4007dfb496cca67e13b <== "abcdefghijklmnopqrstuvwxyz"
!        0xd174ab98d277d9f5a5611c2c9f419d9f <== "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
!        0x57edf4a22be3c955ac49da2e2107b67a <== "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
! 
! In addition, intermediate outputs to aid in developing an implementation
! can be found here.
! 
! The MD5 Message-Digest Algorithm was developed by RSA Data Security,
! Inc. in 1991.


