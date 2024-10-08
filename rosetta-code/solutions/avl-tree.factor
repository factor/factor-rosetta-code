! In computer science, an AVL tree is a self-balancing binary search tree.
! In an AVL tree, the heights of the two child subtrees of any node differ
! by at most one; at no time do they differ by more than one because
! rebalancing is done ensure this is the case. Lookup, insertion, and
! deletion all take O(log n) time in both the average and worst cases,
! where n is the number of nodes in the tree prior to the operation.
! Insertions and deletions may require the tree to be rebalanced by one or
! more tree rotations. Note the tree of nodes comprise a set, so duplicate
! node keys are not allowed.
! 
! AVL trees are often compared with red-black trees because they support
! the same set of operations and because red-black trees also take O(log
! n) time for the basic operations. Because AVL trees are more rigidly
! balanced, they are faster than red-black trees for lookup-intensive
! applications. Similar to red-black trees, AVL trees are height-balanced,
! but in general not weight-balanced nor μ-balanced; that is, sibling
! nodes can have hugely differing numbers of descendants.
! 
! Task:
! 
! Implement an AVL tree in the language of choice, and provide at least
! basic operations.
! 
! Related task
! 
! Red_black_tree_sort
! 
! Category:Data Structures


