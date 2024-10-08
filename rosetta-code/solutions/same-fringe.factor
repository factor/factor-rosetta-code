! Write a routine that will compare the leaves ("fringe") of two binary
! trees to determine whether they are the same list of leaves when visited
! left-to-right. The structure or balance of the trees does not matter;
! only the number, order, and value of the leaves is important.
! 
! Any solution is allowed here, but many computer scientists will consider
! it inelegant to collect either fringe in its entirety before starting to
! collect the other one. In fact, this problem is usually proposed in
! various forums as a way to show off various forms of concurrency
! (tree-rotation algorithms have also been used to get around the need to
! collect one tree first). Thinking of it a slightly different way, an
! elegant solution is one that can perform the minimum amount of work to
! falsify the equivalence of the fringes when they differ somewhere in the
! middle, short-circuiting the unnecessary additional traversals and
! comparisons.
! 
! Any representation of a binary tree is allowed, as long as the nodes are
! orderable, and only downward links are used (for example, you may not
! use parent or sibling pointers to avoid recursion).


