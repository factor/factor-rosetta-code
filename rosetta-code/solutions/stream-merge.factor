! 2-stream merge
!     Read two sorted streams of items from external source (e.g. disk, or
!     network), and write one stream of sorted items to external sink.
!     Common algorithm: keep 1 buffered item from each source, select
!     minimal of them, write it, fetch another item from that stream from
!     which the written item was.
! 
! N-stream merge
!     The same as above, but reading from N sources.
!     Common algorithm: same as above, but keep buffered items and their
!     source descriptors in a heap.
! 
! Assume streams are very big. You must not suck them whole in the memory,
! but read them as streams.


