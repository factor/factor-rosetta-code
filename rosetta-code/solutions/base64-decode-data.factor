! See Base64 encode data.
! 
! Now write a program that takes the output of the Base64 encode data task
! as input and regenerate the original file.
! 
! When working on the VBA implementation I found several 'solutions' on
! the net, including one from the software maker himself, that showed
! output with incorrect padding. Obviously with incorrect padding in the
! output you can not decode correctly to the original file again.

USING: base64 io strings ;

"VG8gZXJyIGlzIGh1bWFuLCBidXQgdG8gcmVhbGx5IGZvdWwgdGhpbmdzIHVwIHlvdSBuZWVkIGEgY29tcHV0ZXIuCiAgICAtLVBhdWwgUi5FaHJsaWNo"
base64> >string print
