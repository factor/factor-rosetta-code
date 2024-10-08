! Many programming languages allow for introspection of the current call
! stack environment. This can be for a variety of purposes such as
! enforcing security checks, debugging, or for getting access to the stack
! frame of callers.
! 
! Task:
! 
! Print out (in a manner considered suitable for the platform) the current
! call stack.
! 
! The amount of information printed for each frame on the call stack is
! not constrained, but should include at least the name of the function or
! method at that level of the stack frame.
! 
! You may explicitly add a call to produce the stack trace to the
! (example) code being instrumented for examination.
! 
! The task should allow the program to continue after generating the stack
! trace.
! 
! The task report here must include the trace from a sample program.

USE: prettyprint
get-callstack callstack.
