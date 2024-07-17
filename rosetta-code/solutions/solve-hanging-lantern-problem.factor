! There are some columns of lanterns hanging from the ceiling. If you
! remove the lanterns one at a time, at each step removing the bottommost
! lantern from one column, how many legal sequences will let you take all
! of the lanterns down?
! 
! For example, there are some lanterns hanging like this:
! 
! 🏮 🏮 🏮
!    🏮 🏮
!       🏮
! 
! If we number the lanterns like so:
! 
! 1 2 4
!   3 5
!     6
! 
! You can take like this: [6,3,5,2,4,1] or [3,1,6,5,2,4]
! 
! But not like this: [6,3,2,4,5,1], because at that time 5 is under 4.
! 
! In total, there are 60 ways to take them down.
! 
! ------------------------------------------------------------------------
! 
! Task:
! 
! Input:
! 
! First an integer (n): the number of columns.
! 
! Then n integers: the number of lanterns in each column.
! 
! Output:
! 
! An integer: the number of sequences.
! 
! For example, the input of the example above could be:
! 
! 3
! 1
! 2
! 3
! 
! And the output is:
! 
! 60
! 
! ------------------------------------------------------------------------
! 
! Optional task:
! 
! Output all the sequences using this format:
! 
! [1,2,3,…]
! [2,1,3,…]
! ……
! 
! Related:
! 
! -   Permutations_with_some_identical_elements


