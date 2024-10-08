! Imperative programs like to jump around, but some languages restrict
! these jumps. Many structured languages restrict their conditional
! structures and loops to local jumps within a function. Some assembly
! languages limit certain jumps or branches to a small range.
! 
! This task is to demonstrate a local jump and a global jump and the
! various other types of jumps that the language supports. For the purpose
! of this task, the jumps need not be used for a single purpose and you
! have the freedom to use these jumps for different purposes. You may also
! defer to more specific tasks, like Exceptions or Generator. This task
! provides a "grab bag" for several types of jumps. There are non-local
! jumps across function calls, or long jumps to anywhere within a program.
! Anywhere means not only to the tops of functions!
! 
! -   Some languages can go to any global label in a program.
! -   Some languages can break multiple function calls, also known as
!     unwinding the call stack.
! -   Some languages can save a continuation. The program can later
!     continue from the same place. So you can jump anywhere, but only if
!     you have a previous visit there (to save the continuation).
! 
! These jumps are not all alike. A simple goto never touches the call
! stack. A continuation saves the call stack, so you can continue a
! function call after it ends.
! 
! Task:
! 
! Use your language to demonstrate the various types of jumps that it
! supports.
! 
! Because the possibilities vary by language, this task is not specific.
! You have the freedom to use these jumps for different purposes. You may
! also defer to more specific tasks, like Exceptions or Generator.

USING: continuations prettyprint ;

current-continuation short.
