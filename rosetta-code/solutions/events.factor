! Event is a synchronization object. An event has two states signaled and
! reset. A task may await for the event to enter the desired state,
! usually the signaled state. It is released once the state is entered.
! Releasing waiting tasks is called event notification. Programmatically
! controlled events can be set by a task into one of its states.
! 
! In concurrent programming event also refers to a notification that some
! state has been reached through an asynchronous activity. The source of
! the event can be:
! 
! -   internal, from another task, programmatically;
! -   external, from the hardware, such as user input, timer, etc.
!     Signaling an event from the hardware is accomplished by means of
!     hardware interrupts.
! 
! Event is a low-level synchronization mechanism. It neither identify the
! state that caused it signaled, nor the source of, nor who is the subject
! of notification. Events augmented by data and/or publisher-subscriber
! schemes are often referred as messages, signals etc.
! 
! In the context of general programming event-driven architecture refers
! to a design that deploy events in order to synchronize tasks with the
! asynchronous activities they must be aware of. The opposite approach is
! polling sometimes called busy waiting, when the synchronization is
! achieved by an explicit periodic querying the state of the activity. As
! the name suggests busy waiting consumes system resources even when the
! external activity does not change its state.
! 
! Event-driven architectures are widely used in GUI design and SCADA
! systems. They are flexible and have relatively short response times. At
! the same time event-driven architectures suffer to the problems related
! to their unpredictability. They face race condition, deadlocking, live
! locks and priority inversion. For this reason real-time systems tend to
! polling schemes, trading performance for predictability in the worst
! case scenario.
! 
! Variants of events
! 
! Manual-reset event
! 
! This event changes its state by an explicit request of a task. I.e. once
! signaled it remains in this state until it will be explicitly reset.
! 
! Pulse event
! 
! A pulse event when signaled releases all tasks awaiting it and then is
! automatically reset.
! 
! Sample implementations / APIs
! 
! Show how a manual-reset event can be implemented in the language or else
! use an API to a library that provides events. Write a program that waits
! 1s and then signals the event to a task waiting for the event.


