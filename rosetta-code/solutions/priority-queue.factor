! A priority queue is somewhat similar to a queue, with an important
! distinction: each item is added to a priority queue with a priority
! level, and will be later removed from the queue with the highest
! priority element first. That is, the items are (conceptually) stored in
! the queue in priority order instead of in insertion order.
! 
! Task:
! 
! Create a priority queue. The queue must support at least two operations:
! 
! :# Insertion. An element is added to the queue with a priority (a
! numeric value).
! 
! :# Top item removal. Deletes the element or one of the elements with the
! current top priority and return it.
! 
! Optionally, other operations may be defined, such as peeking (find what
! current top priority/top element is), merging (combining two priority
! queues into one), etc.
! 
! To test your implementation, insert a number of elements into the queue,
! each with some random priority.
! 
! Then dequeue them sequentially; now the elements should be sorted by
! priority.
! 
! You can use the following task/priority items as input data:
! 
!         Priority         Task
!        ══════════   ════════════════
!            3         Clear drains
!            4         Feed cat
!            5         Make tea
!            1         Solve RC tasks
!            2         Tax return
! 
! The implementation should try to be efficient. A typical implementation
! has O(log n) insertion and extraction time, where n is the number of
! items in the queue.
! 
! You may choose to impose certain limits such as small range of allowed
! priority levels, limited capacity, etc. If so, discuss the reasons
! behind it.

<min-heap> [ {
    { 3 "Clear drains" }
    { 4 "Feed cat" }
    { 5 "Make tea" }
    { 1 "Solve RC tasks" }
    { 2 "Tax return" }
  } swap heap-push-all 
] [
  [ print ] slurp-heap
] bi
