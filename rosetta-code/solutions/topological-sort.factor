! Given a mapping between items, and items they depend on, a topological
! sort orders items so that no item precedes an item it depends upon.
! 
! The compiling of a library in the VHDL language has the constraint that
! a library must be compiled after any library it depends on.
! 
! A tool exists that extracts library dependencies.
! 
! Task:
! 
! Write a function that will return a valid compile order of VHDL
! libraries from their dependencies.
! 
! -   Assume library names are single words.
! -   Items mentioned as only dependents, (sic), have no dependents of
!     their own, but their order of compiling must be given.
! -   Any self dependencies should be ignored.
! -   Any un-orderable dependencies should be flagged.
! 
! Use the following data as an example:
! 
!     LIBRARY          LIBRARY DEPENDENCIES
!     =======          ====================
!     des_system_lib   std synopsys std_cell_lib des_system_lib dw02 dw01 ramlib ieee
!     dw01             ieee dw01 dware gtech
!     dw02             ieee dw02 dware
!     dw03             std synopsys dware dw03 dw02 dw01 ieee gtech
!     dw04             dw04 ieee dw01 dware gtech
!     dw05             dw05 ieee dware
!     dw06             dw06 ieee dware
!     dw07             ieee dware
!     dware            ieee dware
!     gtech            ieee gtech
!     ramlib           std ieee
!     std_cell_lib     ieee std_cell_lib
!     synopsys
! 
! Note: the above data would be un-orderable if, for example, dw04 is
! added to the list of dependencies of dw01.
! 
! C.f.:
! 
! -   -   Topological sort/Extracted top item.
! 
! There are two popular algorithms for topological sorting:
! 
! -   -   Kahn's 1962 topological sort [1]
!     -   depth-first search [2] Jason Sachs
! 
! "Ten little algorithms, part 4: topological sort"
! 
! Category:Sorting
! 
! [1] wp: topological sorting
! 
! [2] wp: topological sorting


