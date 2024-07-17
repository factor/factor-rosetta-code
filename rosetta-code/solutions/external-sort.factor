! Sort a huge file too large to fit into memory.
! 
! The algorithm consists in reading a large file to be sorted in chunks of
! data small enough to fit in main memory, sort each of the chunks, write
! them out to a temporary file, and finally combined the smaller subfiles
! into a single larger file.
! 
! For more info see: https://en.wikipedia.org/wiki/External_sorting
! 
! The sorting algorithm can be any popular sort, like quicksort.
! 
! For simplicity one can assume that the file consists of fixed length
! integers and that the sort function is less-than (<).
! 
! Category:Sorting


