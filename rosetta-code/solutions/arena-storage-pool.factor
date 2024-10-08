! Dynamically allocated objects take their memory from a heap.
! 
! The memory for an object is provided by an allocator which maintains the
! storage pool used for the heap.
! 
! Often a call to allocator is denoted as
! 
!     P := new T
! 
! where T is the type of an allocated object, and P is a reference to the
! object.
! 
! The storage pool chosen by the allocator can be determined by either:
! 
! -   the object type T
! -   the type of pointer P
! 
! In the former case objects can be allocated only in one storage pool.
! 
! In the latter case objects of the type can be allocated in any storage
! pool or on the stack.
! 
! Task:
! 
! The task is to show how allocators and user-defined storage pools are
! supported by the language.
! 
! In particular:
! 
! 1.  define an arena storage pool. An arena is a pool in which objects
!     are allocated individually, but freed by groups.
! 2.  allocate some objects (e.g., integers) in the pool.
! 
! Explain what controls the storage pool choice in the language.
! 
! Category:Encyclopedia


