! The checkpoint synchronization is a problem of synchronizing multiple
! tasks. Consider a workshop where several workers (tasks) assembly
! details of some mechanism. When each of them completes his work they put
! the details together. There is no store, so a worker who finished its
! part first must wait for others before starting another one. Putting
! details together is the checkpoint at which tasks synchronize themselves
! before going their paths apart.
! 
! The task
! 
! Implement checkpoint synchronization in your language.
! 
! Make sure that the solution is race condition-free. Note that a
! straightforward solution based on events is exposed to race condition.
! Let two tasks A and B need to be synchronized at a checkpoint. Each
! signals its event (EA and EB correspondingly), then waits for the
! AND-combination of the events (EA&EB) and resets its event. Consider the
! following scenario: A signals EA first and gets blocked waiting for
! EA&EB. Then B signals EB and loses the processor. Then A is released
! (both events are signaled) and resets EA. Now if B returns and enters
! waiting for EA&EB, it gets lost.
! 
! When a worker is ready it shall not continue before others finish. A
! typical implementation bug is when a worker is counted twice within one
! working cycle causing its premature completion. This happens when the
! quickest worker serves its cycle two times while the laziest one is
! lagging behind.
! 
! If you can, implement workers joining and leaving.
! 
! Category:Classic CS problems and programs


