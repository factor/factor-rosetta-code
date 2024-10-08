! Demonstrate the “rendezvous” communications technique by implementing a
! printer monitor.
! 
! Detailed Description of Programming Task
! 
! Rendezvous is a synchronization mechanism based on procedural
! decomposition. Rendezvous is similar to a procedure call with the
! difference that the caller and the callee belong to different tasks. The
! called procedure is usually called an entry point of the corresponding
! task. A call to an entry point is synchronous, i.e. the caller is
! blocked until completion. For the caller a call to the entry point is
! indivisible. Internally it consists of:
! 
! -   Waiting for the callee ready to accept the rendezvous;
! -   Engaging the rendezvous (servicing the entry point).
! 
! The caller may limit the waiting time to the callee to accept the
! rendezvous. I.e. a rendezvous request can be aborted if not yet accepted
! by the callee. When accepted the rendezvous is processed until its
! completion. During this time the caller and the callee tasks stay
! synchronized. Which context is used to process the rendezvous depends on
! the implementation which may wish to minimize context switching.
! 
! The callee task may accept several rendezvous requests:
! 
! -   Rendezvous to the same entry point from different tasks;
! -   Rendezvous to different entry points.
! 
! The callee accepts one rendezvous at a time.
! 
! Language mechanism of exceptions (if any) has to be consistent with the
! rendezvous. In particular when an exception is propagated out of a
! rendezvous it shall do in both tasks. The exception propagation is
! synchronous within the rendezvous and asynchronous outside it.
! 
! An engaged rendezvous can be requeued by the callee to another entry
! point of its task or to another task, transparently to the caller.
! 
! Differently to messages which are usually asynchronous, rendezvous are
! synchronous, as it was stated before. Therefore a rendezvous does not
! require marshaling the parameters and a buffer to keep them. Further,
! rendezvous can be implemented without context switch. This makes
! rendezvous a more efficient than messaging.
! 
! Rendezvous can be used to implement monitor synchronization objects. A
! monitor guards a shared resource. All users of the resource request a
! rendezvous to the monitor in order to get access to the resource. Access
! is granted by accepting the rendezvous for the time while the rendezvous
! is serviced.
! 
! Language task
! 
! Show how rendezvous are supported by the language. If the language does
! not have rendezvous, provide an implementation of them based on other
! primitives.
! 
! Use case task
! 
! Implement a printer monitor. The monitor guards a printer. There are two
! printers main and reserve. Each has a monitor that accepts a rendezvous
! Print with a text line to print of the printer. The standard output may
! serve for printing purpose. Each character of the line is printed
! separately in order to illustrate that lines are printed indivisibly.
! Each printer has ink for only 5 lines of text. When the main printer
! runs out of ink it redirects its requests to the reserve printer. When
! that runs out of ink too, Out_Of_Ink exception propagates back to the
! caller. Create two writer tasks which print their plagiarisms on the
! printer. One does Humpty Dumpty, another Mother Goose.
! 
! Category:Encyclopedia


