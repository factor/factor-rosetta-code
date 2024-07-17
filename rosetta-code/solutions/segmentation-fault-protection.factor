! A segmentation fault or segfault is an error that your computer will
! raise if a program attempts to access memory that it's not supposed to,
! for example, trying to write to executable code or read-only memory,
! dereferencing a null pointer, etc. Often this happens when an array is
! indexed out-of bounds, such as (for example) trying to read element 500
! of an array with only 6 entries (see the pseudocode example below):
! 
!     myArray = {1,2,3,4,5,6};
!     myVariable = myArray[500];        //causes a segfault
! 
! Although this seems like a silly example, it's a lot more common than
! those who are new to programming may think, and different languages have
! different safeguards in place for preventing this kind of thing from
! happening. Some languages would refuse to compile the above example,
! some will give you a warning and run anyway, and others may not even
! care at all.
! 
! Task:
! 
! Showcase what built-in protections your language has for segmentation
! faults, if any. If your language doesn't have any, show what happens
! when your program commits a segmentation fault. (Be safe and don't
! destroy your computer!)


