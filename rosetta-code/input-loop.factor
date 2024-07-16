! Task:
! 
! Read from a text stream either word-by-word or line-by-line until the
! stream runs out of data.
! 
! The stream will have an unknown amount of data on it.
! 
! Category:Basic language learning Category:Streams Category:Simple

"file.txt" utf8 [ [ process-line ] each-line ] with-file-reader
