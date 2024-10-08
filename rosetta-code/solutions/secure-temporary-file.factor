! Task:
! 
! Create a temporary file, securely and exclusively (opening it such that
! there are no possible race conditions).
! 
! It's fine assuming local filesystem semantics (NFS or other networking
! filesystems can have signficantly more complicated semantics for
! satisfying the "no race conditions" criteria).
! 
! The function should automatically resolve name collisions and should
! only fail in cases where permission is denied, the filesystem is
! read-only or full, or similar conditions exist (returning an error or
! raising an exception as appropriate to the language/environment).


