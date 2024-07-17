! A tree structure (i.e. a rooted, connected acyclic graph) is often used
! in programming.
! 
! It's often helpful to visually examine such a structure.
! 
! There are many ways to represent trees to a reader, such as:
! 
! -   -   indented text (à la unix tree command)
!     -   nested HTML tables
!     -   hierarchical GUI widgets
!     -   2D or 3D images
!     -   etc.
! 
! Task:
! 
! Write a program to produce a visual representation of some tree.
! 
! The content of the tree doesn't matter, nor does the output format, the
! only requirement being that the output is human friendly.
! 
! Make do with the vague term "friendly" the best you can.

USE: literals

CONSTANT: mammals { "mammals" { "deer" "gorilla" "dolphin" } }
CONSTANT: reptiles { "reptiles" { "turtle" "lizard" "snake" } }

{ "animals" ${ mammals reptiles } } dup . 10 margin set .
