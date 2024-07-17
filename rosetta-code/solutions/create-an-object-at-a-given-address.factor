! In systems programing it is sometimes required to place language objects
! at specific memory locations, like I/O registers, hardware interrupt
! vectors etc.
! 
! Task:
! 
! Show how language objects can be allocated at a specific machine
! addresses.
! 
! Since most OSes prohibit access to the physical memory if it is not
! mapped by the application, as an example, rather than a physical
! address, take the address of some existing object (using suitable
! address operations if necessary).
! 
! For example:
! 
! -   -   create an integer object
!     -   print the machine address of the object
!     -   take the address of the object and create another integer object
!         at this address
!     -   print the value of this object to verify that it is same as one
!         of the origin
!     -   change the value of the origin and verify it again


