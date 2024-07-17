! Task:
! 
! Bogosort a list of numbers.
! 
! Bogosort simply shuffles a collection randomly until it is sorted.
! 
! "Bogosort" is a perversely inefficient algorithm only used as an
! in-joke.
! 
! Its average run-time is O(n!) because the chance that any given shuffle
! of a set will end up in sorted order is about one in n factorial, and
! the worst case is infinite since there's no guarantee that a random
! shuffling will ever produce a sorted sequence.
! 
! Its best case is O(n) since a single pass through the elements may
! suffice to order them.
! 
! Pseudocode:
! 
! while not InOrder(list) do
!    Shuffle(list)
! done
! 
! The Knuth shuffle may be used to implement the shuffle part of this
! algorithm.
! 
! Category:Sorting

USING: grouping kernel math random sequences ;

: sorted? ( seq -- ? ) 2 <clumps> [ first2 <= ] all? ;
: bogosort ( seq -- newseq ) [ dup sorted? ] [ randomize ] until ;
