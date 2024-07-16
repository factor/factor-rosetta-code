! Task:
! 
! Demonstrate how to copy data structures containing complex heterogeneous
! and cyclic semantics.
! 
! This is often referred to as deep copying, and is normally required
! where structures are mutable and to ensure that independent copies can
! be manipulated without side-effects.
! 
! If this facility is not built into the language, it is permissible to
! use functions from a common library, or a coded procedure.
! 
! The task should show:
! 
! -   Relevant semantics of structures, such as their homogeneous or
!     heterogeneous properties, or containment of (self- or
!     mutual-reference) cycles.
! 
! -   Any limitations of the method.
! 
! -   That the structure and its copy are different.
! 
! -   Suitable links to external documentation for common libraries.

! Create a foo object composed of mutable objects
V{ 1 2 3 } V{ 4 5 6 } [ clone ] bi@ foo boa

! create a copy of the reference to the object
dup

! create a deep copy from this copy
object>bytes bytes>object

! print them both
"Before modification:" print [ [ . ] bi@ ] 2keep nl

! modify the deep copy
[ -99 suffix! ] change-bar

"After modification:" print [ . ] bi@
