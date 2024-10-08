! The task requires poking machine code directly into memory and executing
! it. The machine code is the architecture-specific opcodes which have the
! simple task of adding two unsigned bytes together and making the result
! available to the high-level language.
! 
! For example, the following assembly language program is given for x86
! (32 bit) architectures:
! 
!     mov EAX, [ESP+4]
!     add EAX, [ESP+8]
!     ret
! 
! This would translate into the following opcode bytes:
! 
!     139 68 36 4 3 68 36 8 195
! 
! Or in hexadecimal:
! 
!     8B 44 24 04 03 44 24 08 C3
! 
! Task:
! 
! If different than 32-bit x86, specify the target architecture of the
! machine code for your example. It may be helpful to also include an
! assembly version of the machine code for others to reference and
! understand what is being executed. Then, implement the following in your
! favorite programming language:
! 
! -   Poke the necessary opcodes into a memory location.
! -   Provide a means to pass two values to the machine code.
! -   Execute the machine code with the following arguments: unsigned-byte
!     argument of value 7; unsigned-byte argument of value 12; The result
!     would be 19.
! -   Perform any clean up actions that are appropriate for your chosen
!     language (free the pointer or memory allocations, etc.)


