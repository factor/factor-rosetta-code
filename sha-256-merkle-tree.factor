! As described in its documentation, Amazon S3 Glacier requires that all
! uploaded files come with a checksum computed as a Merkle Tree using
! SHA-256.
! 
! Specifically, the SHA-256 hash is computed for each 1MiB block of the
! file. And then, starting from the beginning of the file, the raw hashes
! of consecutive blocks are paired up and concatenated together, and a new
! hash is computed from each concatenation. Then these are paired up and
! concatenated and hashed, and the process continues until there is only
! one hash left, which is the final checksum. The hexadecimal
! representation of this checksum is the value that must be included with
! the AWS API call to upload the object (or complete a multipart upload).
! 
! Implement this algorithm in your language; you can use the code from the
! SHA-256 task for the actual hash computations. For better manageability
! and portability, build the tree using a smaller block size of only 1024
! bytes, and demonstrate it on [https:///mw/title.png the RosettaCode
! title image] with that block size. The final result should be the
! hexadecimal digest value
! a4f902cf9d51fe51eda156a6792e1445dff65edf3a217a1f3334cc9cf1495c2c.

USING: checksums checksums.sha fry grouping io
io.encodings.binary io.files kernel make math math.parser
namespaces sequences ;

: each-block ( ... size quot: ( ... block -- ... ) -- ... )
    input-stream get spin (each-stream-block) ; inline

: >sha-256 ( seq -- newseq ) sha-256 checksum-bytes ;

: (hash-read) ( path encoding chunk-size -- )
    '[ _ [ >sha-256 , ] each-block ] with-file-reader ;

! Read a file in chunks as a sequence of sha-256 hashes, so as
! not to store a potentially large file in memory all at once.

: hash-read ( path chunk-size -- seq )
    binary swap [ (hash-read) ] { } make ;

: hash-combine ( seq -- newseq )
    2 <groups>
    [ dup length 1 > [ concat >sha-256 ] [ first ] if ] map ;

: merkle-hash ( path chunk-size -- str )
    hash-read [ dup length 1 = ] [ hash-combine ] until first
    bytes>hex-string ;

"title.png" 1024 merkle-hash print
