! Task:
! 
! "Simulate" a four-bit adder.
! 
! This design can be realized using four 1-bit full adders. Each of these
! 1-bit full adders can be built with two half adders and an or gate. ;
! 
! Finally a half adder can be made using an xor gate and an and gate.
! 
! The xor gate can be made using two nots, two ands and one or.
! 
! Not, or and and, the only allowed "gates" for the task, can be
! "imitated" by using the bitwise operators of your language.
! 
! If there is not a bit type in your language, to be sure that the not
! does not "invert" all the other bits of the basic type (e.g. a byte) we
! are not interested in, you can use an extra nand (and then not) with the
! constant 1 on one input.
! 
! Instead of optimizing and reducing the number of gates used for the
! final 4-bit adder, build it in the most straightforward way, connecting
! the other "constructive blocks", in turn made of "simpler" and "smaller"
! ones.
! 
! +----------------+----------------+----------------+----------------+
! | (Xor gate with | (A half adder) | (A full adder) | (A 4-bit       |
! | ANDs, ORs and  |                |                | adder)         |
! | NOTs)          |                |                |                |
! +================+================+================+================+
! | [Xor gate done | [A half adder] | [A full adder] | [A 4-bit       |
! | with ands, ors |                |                | adder]         |
! | and nots]      |                |                |                |
! +----------------+----------------+----------------+----------------+
! 
! : Schematics of the "constructive blocks"
! 
! Solutions should try to be as descriptive as possible, making it as easy
! as possible to identify "connections" between higher-order "blocks".
! 
! It is not mandatory to replicate the syntax of higher-order blocks in
! the atomic "gate" blocks, i.e. basic "gate" operations can be performed
! as usual bitwise operations, or they can be "wrapped" in a block in
! order to expose the same syntax of higher-order blocks, at implementers'
! choice.
! 
! To test the implementation, show the sum of two four-bit numbers (in
! binary).


