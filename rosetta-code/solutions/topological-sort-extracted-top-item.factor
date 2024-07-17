! Given a mapping between items, and items they depend on, a topological
! sort orders items so that no item precedes an item it depends upon.
! 
! The compiling of a design in the VHDL language has the constraint that a
! file must be compiled after any file containing definitions it depends
! on. A tool exists that extracts file dependencies.
! 
! -   Assume the file names are single words, given without their file
!     extensions.
! -   Files mentioned as only dependants, have no dependants of their own,
!     but their order of compiling must be given.
! -   Any self dependencies should be ignored.
! 
! A top level file is defined as a file that:
! 
! 1.  Has dependents.
! 2.  Is not itself the dependent of another file
! 
! Task Description
! 
! Given the following file dependencies as an example:
! 
!     FILE    FILE DEPENDENCIES
!     ====    =================
!     top1    des1 ip1 ip2
!     top2    des1 ip2 ip3
!     ip1     extra1 ip1a ipcommon
!     ip2     ip2a ip2b ip2c ipcommon
!     des1    des1a des1b des1c
!     des1a   des1a1 des1a2
!     des1c   des1c1 extra1
! 
! The task is to create a program that given a graph of the dependency:
! 
! 1.  Determines the top levels from the dependencies and show them.
! 2.  Extracts a compile order of files to compile any given (usually top
!     level) file.
! 3.  Give a compile order for file top1.
! 4.  Give a compile order for file top2.
! 
! You may show how to compile multiple top levels as a stretch goal
! 
! Note: this task differs from task Topological sort in that the order for
! compiling any file might not include all files; and that checks for
! dependency cycles are not mandated.
! 
! Related task:
! 
! -   Topological sort
! 
! Category:Sorting


