! The dining philosophers problem illustrates non-composability of
! low-level synchronization primitives like semaphores. It is a
! modification of a problem posed by Edsger Dijkstra.
! 
! Five philosophers, Aristotle, Kant, Spinoza, Marx, and Russell (the
! tasks) spend their time thinking and eating spaghetti. They eat at a
! round table with five individual seats. For eating each philosopher
! needs two forks (the resources). There are five forks on the table, one
! left and one right of each seat. When a philosopher cannot grab both
! forks it sits and waits. Eating takes random time, then the philosopher
! puts the forks down and leaves the dining room. After spending some
! random time thinking about the nature of the universe, he again becomes
! hungry, and the circle repeats itself.
! 
! It can be observed that a straightforward solution, when forks are
! implemented by semaphores, is exposed to deadlock. There exist two
! deadlock states when all five philosophers are sitting at the table
! holding one fork each. One deadlock state is when each philosopher has
! grabbed the fork left of him, and another is when each has the fork on
! his right.
! 
! There are many solutions of the problem, program at least one, and
! explain how the deadlock is prevented.


