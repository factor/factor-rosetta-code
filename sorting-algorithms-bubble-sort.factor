! A bubble sort is generally considered to be the simplest sorting
! algorithm.
! 
! A bubble sort is also known as a sinking sort.
! 
! Because of its simplicity and ease of visualization, it is often taught
! in introductory computer science courses.
! 
! Because of its abysmal O(n²) performance, it is not used often for large
! (or even medium-sized) datasets.
! 
! The bubble sort works by passing sequentially over a list, comparing
! each value to the one immediately after it. If the first value is
! greater than the second, their positions are switched. Over a number of
! passes, at most equal to the number of elements in the list, all of the
! values drift into their correct positions (large values "bubble" rapidly
! toward the end, pushing others down around them). Because each pass
! finds the maximum item and puts it at the end, the portion of the list
! to be sorted can be reduced at each pass. A boolean variable is used to
! track whether any changes have been made in the current pass; when a
! pass completes without changing anything, the algorithm exits.
! 
! This can be expressed in pseudo-code as follows (assuming 1-based
! indexing):
! 
! repeat
!     if itemCount <= 1
!         return
!     hasChanged := false
!     decrement itemCount
!     repeat with index from 1 to itemCount
!         if (item at index) > (item at (index + 1))
!             swap (item at index) with (item at (index + 1))
!             hasChanged := true
! until hasChanged = false
! 
! Task:
! 
! Sort an array of elements using the bubble sort algorithm. The elements
! must have a total order and the index of the array can be of any
! discrete type. For languages where this is not possible, sort an array
! of integers.
! 
! References:
! 
! -   The article on Wikipedia.
! -   Dance interpretation.

10 [ 10000 random ] replicate
[ "Before:  " write . ]
[ "Natural: " write [ natural-sort! ] keep . ]
[ "Reverse: " write [ [ >=< ] sort! ] keep . ] tri
