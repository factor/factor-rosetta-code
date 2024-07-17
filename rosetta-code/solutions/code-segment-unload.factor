! Some advanced applications, such as memory resident applications,
! daemons and memory demanding applications unload unrequired parts of the
! application during use (such as initialization code that will no longer
! be used again once the application is operational) to free up memory and
! resources. Demonstrate or explain how to unload an unused section of
! code from memory.
! 
! Note that it is sufficient to flag the memory area as being available
! for reuse by the memory management system, without the need to
! demonstrate the zeroing of the bytes and performing a memory shuffle,
! unless such actions are required to free up the code segment.
! 
! Languages that do not have the facility to free up their code segment
! (such as scripting languages) can be omitted.
! 
! Category:Initialization Category:Memory management


