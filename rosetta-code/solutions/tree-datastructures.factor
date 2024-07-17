! The following shows a tree of data with nesting denoted by visual levels
! of indentation:
! 
!     RosettaCode
!         rocks
!             code
!             comparison
!             wiki
!         mocks
!             trolling
! 
! A common datastructure for trees is to define node structures having a
! name and a, (possibly empty), list of child nodes. The nesting of nodes
! captures the indentation of the tree. Lets call this the nest form.
! 
!     # E.g. if child nodes are surrounded by brackets
!     #      and separated by commas then:
!     RosettaCode(rocks(code, ...), ...)
!     # But only an _example_
! 
! Another datastructure for trees is to construct from the root an ordered
! list of the nodes level of indentation and the name of that node. The
! indentation for the root node is zero; node 'rocks is indented by one
! level from the left, and so on. Lets call this the indent form.
! 
!     0 RosettaCode
!     1 rocks
!     2 code
!     ...
! 
! Task:
! 
! 1.  Create/use a nest datastructure format and textual representation
!     for arbitrary trees.
! 2.  Create/use an indent datastructure format and textual representation
!     for arbitrary trees.
! 3.  Create methods/classes/proceedures/routines etc to:
!     1.  Change from a nest tree datastructure to an indent one.
!     2.  Change from an indent tree datastructure to a nest one
! 4.  Use the above to encode the example at the start into the nest
!     format, and show it.
! 5.  transform the initial nest format to indent format and show it.
! 6.  transform the indent format to final nest format and show it.
! 7.  Compare initial and final nest formats which should be the same.
! 
! Note:
! 
! -   It's all about showing aspects of the contrasting datastructures as
!     they hold the tree.
! -   Comparing nested datastructures is secondary - saving formatted
!     output as a string then a string compare would suffice for this
!     task, if its easier.
! 
! Show all output on this page.


