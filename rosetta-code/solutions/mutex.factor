! A mutex (from "mutual exclusion") is a synchronization object, a variant
! of semaphore with k=1. A mutex is said to be seized by a task decreasing
! k. It is released when the task restores k. Mutexes are typically used
! to protect a shared resource from concurrent access. A task seizes (or
! acquires) the mutex, then accesses the resource, and after that releases
! the mutex.
! 
! A mutex is a low-level synchronization primitive exposed to deadlocking.
! A deadlock can occur with just two tasks and two mutexes (if each task
! attempts to acquire both mutexes, but in the opposite order). Entering
! the deadlock is usually aggravated by a race condition state, which
! leads to sporadic hangups, which are very difficult to track down.
! 
! Variants of mutexes
! 
! Global and local mutexes
! 
! Usually the OS provides various implementations of mutexes corresponding
! to the variants of tasks available in the OS. For example, system-wide
! mutexes can be used by processes. Local mutexes can be used only by
! threads etc. This distinction is maintained because, depending on the
! hardware, seizing a global mutex might be a thousand times slower than
! seizing a local one.
! 
! Reentrant mutex
! 
! A reentrant mutex can be seized by the same task multiple times. Each
! seizing of the mutex is matched by releasing it, in order to allow
! another task to seize it.
! 
! Read write mutex
! 
! A read write mutex can be seized at two levels for read and for write.
! The mutex can be seized for read by any number of tasks. Only one task
! may seize it for 'write. Read write mutexes are usually used to protect
! resources which can be accessed in mutable and immutable ways. Immutable
! (read) access is granted concurrently for many tasks because they do not
! change the resource state. Read write mutexes can be reentrant, global
! or local. Further, promotion operations may be provided. That's when a
! task that has seized the mutex for write releases it while keeping
! seized for read. Note that the reverse operation is potentially
! deadlocking and requires some additional access policy control.
! 
! Deadlock prevention
! 
! There exists a simple technique of deadlock prevention when mutexes are
! seized in some fixed order. This is discussed in depth in the Dining
! philosophers problem.
! 
! Sample implementations / APIs
! 
! Category:Encyclopedia


