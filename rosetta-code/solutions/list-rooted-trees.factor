! You came back from grocery shopping. After putting away all the goods,
! you are left with a pile of plastic bags, which you want to save for
! later use, so you take one bag and stuff all the others into it, and
! throw it under the sink. In doing so, you realize that there are various
! ways of nesting the bags, with all bags viewed as identical.
! 
! If we use a matching pair of parentheses to represent a bag, the ways
! are:
! 
! For 1 bag, there's one way:
! 
!  ()    <- a bag
! 
! for 2 bags, there's one way:
! 
!  (())  <- one bag in another
! 
! for 3 bags, there are two:
! 
!  ((())) <- 3 bags nested Russian doll style
!  (()()) <- 2 bags side by side, inside the third
! 
! for 4 bags, four:
! 
!  (()()())
!  ((())())
!  ((()()))
!  (((())))
! 
! Note that because all bags are identical, the two 4-bag strings ((())())
! and (()(())) represent the same configuration.
! 
! It's easy to see that each configuration for n bags represents a n-node
! rooted tree, where a bag is a tree node, and a bag with its content
! forms a subtree. The outermost bag is the tree root. Number of
! configurations for given n is given by OEIS A81.
! 
! Task:
! 
! Write a program that, when given n, enumerates all ways of nesting n
! bags. You can use the parentheses notation above, or any tree
! representation that's unambiguous and preferably intuitive.
! 
! This task asks for enumeration of trees only; for counting solutions
! without enumeration, that OEIS page lists various formulas, but that's
! not encouraged by this task, especially if implementing it would
! significantly increase code size.
! 
! As an example output, run 5 bags. There should be 9 ways.


