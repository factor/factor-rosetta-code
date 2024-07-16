! Subleq is an example of a One-Instruction Set Computer (OISC).
! 
! It is named after its only instruction, which is SUbtract and Branch if
! Less than or EQual to zero.
! 
! Task
! 
! Your task is to create an interpreter which emulates a SUBLEQ machine.
! 
! The machine's memory consists of an array of signed integers. These
! integers may be interpreted in three ways:
! 
! -   -   simple numeric values
!     -   memory addresses
!     -   characters for input or output
! 
! Any reasonable word size that accommodates all three of the above uses
! is fine.
! 
! The program should load the initial contents of the emulated machine's
! memory, set the instruction pointer to the first address (which is
! defined to be address 0), and begin emulating the machine, which works
! as follows:
! 
! :# Let A be the value in the memory location identified by the
! instruction pointer; let B and C be the values stored in the next two
! consecutive addresses in memory.
! 
! :# Advance the instruction pointer three words, to point at the address
! after the address containing C.
! 
! :# If A is -1 (negative unity), then a character is read from the
! machine's input and its numeric value stored in the address given by B.
! C is unused. (Most implementations adopt the C convention of signaling
! EOF by storing -1 as the read-in character.)
! 
! :# If B is -1 (negative unity), then the number contained in the address
! given by A is interpreted as a character and written to the machine's
! output. C is unused.
! 
! :# Otherwise, both A and B are treated as addresses. The number
! contained in address A is subtracted from the number in address B (and
! the difference left in address B). If the result is positive, execution
! continues uninterrupted; if the result is zero or negative, the
! instruction pointer is set to C.
! 
! :# If the instruction pointer becomes negative, execution halts.
! 
! Your solution may initialize the emulated machine's memory in any
! convenient manner, but if you accept it as input, it should be a
! separate input stream from the one fed to the emulated machine once it
! is running. And if fed as text input, it should be in the form of raw
! subleq "machine code" - whitespace-separated decimal numbers, with no
! symbolic names or other assembly-level extensions, to be loaded into
! memory starting at address 0 (zero).
! 
! For purposes of this task, show the output of your solution when fed the
! below "Hello, world!" program.
! 
! As written, this example assumes ASCII or a superset of it, such as any
! of the Latin-N character sets or Unicode; you may translate the numbers
! representing characters (starting with 72=ASCII 'H') into another
! character set if your implementation runs in a non-ASCII-compatible
! environment. If 0 is not an appropriate terminator in your character
! set, the program logic will need some adjustment as well.
! 
!     15 17 -1 17 -1 -1 16 1 -1 16 3 -1 15 15 0 0 -1 72 101 108 108 111 44 32 119 111 114 108 100 33 10 0
! 
! The above "machine code" corresponds to something like this in a
! hypothetical assembler language for a signed 8-bit version of the
! machine:
! 
!     start:
!         0f 11 ff subleq (zero), (message), -1 ; subtract 0 from next character value to print;
!                                               ; terminate if it's <=0
!         11 ff ff subleq (message), -1, -1     ; output character
!         10 01 ff subleq (neg1), (start+1), -1 ; modify above two instructions by subtracting -1 
!         10 03 ff subleq (neg1), (start+3), -1 ;   (adding 1) to their target addresses 
!         0f 0f 00 subleq (zero), (zero), start ; if 0-0 <= 0 (i.e. always) goto start
! 
!     ; useful constants
!     zero: 
!         00      .data 0  
!     neg1: 
!         ff      .data -1
!     ; the message to print
!     message: .data "Hello, world!\n\0"
!         48 65 6c 6c 6f 2c 20 77 6f 72 6c 64 21 0a 00

