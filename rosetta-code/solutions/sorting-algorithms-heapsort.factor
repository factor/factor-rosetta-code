! Heapsort is an in-place sorting algorithm with worst case and average
! complexity of O(n logn).
! 
! The basic idea is to turn the array into a binary heap structure, which
! has the property that it allows efficient retrieval and removal of the
! maximal element.
! 
! We repeatedly "remove" the maximal element from the heap, thus building
! the sorted list from back to front.
! 
! A heap sort requires random access, so can only be used on an array-like
! data structure.
! 
! Pseudocode:
! 
! function heapSort(a, count) is
!    input: an unordered array a of length count
! 
!    (first place a in max-heap order)
!    heapify(a, count)
! 
!    end := count - 1
!    while end > 0 do
!       (swap the root(maximum value) of the heap with the
!        last element of the heap)
!       swap(a[end], a[0])
!       (decrement the size of the heap so that the previous
!        max value will stay in its proper place)
!       end := end - 1
!       (put the heap back in max-heap order)
!       siftDown(a, 0, end)
! 
! function heapify(a,count) is
!    (start is assigned the index inaof the last parent node)
!    start := (count - 2) / 2
! 
!    while start ≥ 0 do
!       (sift down the node at index start to the proper place
!        such that all nodes below the start index are in heap
!        order)
!       siftDown(a, start, count-1)
!       start := start - 1
!    (after sifting down the root all nodes/elements are in heap order)
! 
! function siftDown(a, start, end) is
!    (endrepresents the limit of how far down the heap to sift)
!    root := start
! 
!    while root * 2 + 1 ≤ end do       (While the root has at least one child)
!       child := root * 2 + 1           (root*2+1 points to the left child)
!       (If the child has a sibling and the child's value is less than its sibling's...)
!       if child + 1 ≤ end and a[child] < a[child + 1] then
!          child := child + 1           (... then point to the right child instead)
!       if a[root] < a[child] then     (out of max-heap order)
!          swap(a[root], a[child])
!          root := child                (repeat to continue sifting down the child now)
!       else
!          return
! 
! Write a function to sort a collection of integers using heapsort.
! 
! Category:Sorting


