! A virtual machine implements a computer in software.
! 
! Write a virtual machine interpreter. This interpreter should be able to
! run virtual assembly language programs created via the task. This is a
! byte-coded, 32-bit word stack based virtual machine.
! 
! The program should read input from a file and/or stdin, and write output
! to a file and/or stdout.
! 
! Given the following program:
! 
! count = 1;
! while (count < 10) {
!     print("count is: ", count, "\n");
!     count = count + 1;
! }
! 
! The output from the Code generator is a virtual assembly code program:
! 
! +------------------------------+
! | Output from gen, input to VM |
! +==============================+
! |     Datasize: 1 Strings: 2   |
! |     "count is: "             |
! |     "\n"                     |
! |         0 push  1            |
! |         5 store [0]          |
! |        10 fetch [0]          |
! |        15 push  10           |
! |        20 lt                 |
! |        21 jz     (43) 65     |
! |        26 push  0            |
! |        31 prts               |
! |        32 fetch [0]          |
! |        37 prti               |
! |        38 push  1            |
! |        43 prts               |
! |        44 fetch [0]          |
! |        49 push  1            |
! |        54 add                |
! |        55 store [0]          |
! |        60 jmp    (-51) 10    |
! |        65 halt               |
! +------------------------------+
! 
! The first line of the input specifies the datasize required and the
! number of constant strings, in the order that they are reference via the
! code.
! 
! The data can be stored in a separate array, or the data can be stored at
! the beginning of the stack. Data is addressed starting at 0. If there
! are 3 variables, the 3rd one if referenced at address 2.
! 
! If there are one or more constant strings, they come next. The code
! refers to these strings by their index. The index starts at 0. So if
! there are 3 strings, and the code wants to reference the 3rd string, 2
! will be used.
! 
! Next comes the actual virtual assembly code. The first number is the
! code address of that instruction. After that is the instruction
! mnemonic, followed by optional operands, depending on the instruction.
! 
! sp:
! 
!    the stack pointer - points to the next top of stack.  The stack is a 32-bit integer
!    array.
! 
! pc:
! 
!    the program counter - points to the current instruction to be performed.  The code is an
!    array of bytes.
! 
! Data:
! 
!    data
!    string pool
! 
! Each instruction is one byte. The following instructions also have a
! 32-bit integer operand:
! 
! fetch [index]
! 
! where index is an index into the data array.
! 
! store [index]
! 
! where index is an index into the data array.
! 
! push n
! 
! where value is a 32-bit integer that will be pushed onto the stack.
! 
! jmp (n) addr
! 
! where (n) is a 32-bit integer specifying the distance between the
! current location and the desired location. addr is an unsigned value of
! the actual code address.
! 
! jz (n) addr
! 
! where (n) is a 32-bit integer specifying the distance between the
! current location and the desired location. addr is an unsigned value of
! the actual code address.
! 
! The following instructions do not have an operand. They perform their
! operation directly against the stack:
! 
! For the following instructions, the operation is performed against the
! top two entries in the stack:
! 
! add
! sub
! mul
! div
! mod
! lt
! gt
! le
! ge
! eq
! ne
! and
! or
! 
! For the following instructions, the operation is performed against the
! top entry in the stack:
! 
! neg
! not
! 
! Print the word at stack top as a character.
! 
! prtc
! 
! Print the word at stack top as an integer.
! 
! prti
! 
! Stack top points to an index into the string pool. Print that entry.
! 
! prts
! 
! Unconditional stop.
! 
! halt
! 
! A simple example virtual machine:
! 
!     def run_vm(data_size)
!         int stack[data_size + 1000]
!         set stack[0..data_size - 1] to 0
!         int pc = 0
!         while True:
!             op = code[pc]
!             pc += 1
! 
!             if op == FETCH:
!                 stack.append(stack[bytes_to_int(code[pc:pc+word_size])[0]]);
!                 pc += word_size
!             elif op == STORE:
!                 stack[bytes_to_int(code[pc:pc+word_size])[0]] = stack.pop();
!                 pc += word_size
!             elif op == PUSH:
!                 stack.append(bytes_to_int(code[pc:pc+word_size])[0]);
!                 pc += word_size
!             elif op == ADD:   stack[-2] += stack[-1]; stack.pop()
!             elif op == SUB:   stack[-2] -= stack[-1]; stack.pop()
!             elif op == MUL:   stack[-2] *= stack[-1]; stack.pop()
!             elif op == DIV:   stack[-2] /= stack[-1]; stack.pop()
!             elif op == MOD:   stack[-2] %= stack[-1]; stack.pop()
!             elif op == LT:    stack[-2] = stack[-2] <  stack[-1]; stack.pop()
!             elif op == GT:    stack[-2] = stack[-2] >  stack[-1]; stack.pop()
!             elif op == LE:    stack[-2] = stack[-2] <= stack[-1]; stack.pop()
!             elif op == GE:    stack[-2] = stack[-2] >= stack[-1]; stack.pop()
!             elif op == EQ:    stack[-2] = stack[-2] == stack[-1]; stack.pop()
!             elif op == NE:    stack[-2] = stack[-2] != stack[-1]; stack.pop()
!             elif op == AND:   stack[-2] = stack[-2] and stack[-1]; stack.pop()
!             elif op == OR:    stack[-2] = stack[-2] or  stack[-1]; stack.pop()
!             elif op == NEG:   stack[-1] = -stack[-1]
!             elif op == NOT:   stack[-1] = not stack[-1]
!             elif op == JMP:   pc += bytes_to_int(code[pc:pc+word_size])[0]
!             elif op == JZ:    if stack.pop() then pc += word_size else pc += bytes_to_int(code[pc:pc+word_size])[0]
!             elif op == PRTC:  print stack[-1] as a character; stack.pop()
!             elif op == PRTS:  print the constant string referred to by stack[-1]; stack.pop()
!             elif op == PRTI:  print stack[-1] as an integer; stack.pop()
!             elif op == HALT:  break
! 
! Additional examples
! 
! Your solution should pass all the test cases above and the additional
! tests found Here.
! 
! The C and Python versions can be considered reference implementations.
! 
! Related Tasks
! 
! -   Lexical Analyzer task
! -   Syntax Analyzer task
! -   Code Generator task
! -   AST Interpreter task
! 
! __TOC__


