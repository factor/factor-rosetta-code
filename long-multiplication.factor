! Task:
! 
! Explicitly implement long multiplication.
! 
! This is one possible approach to arbitrary-precision integer algebra.
! 
! For output, display the result of 2⁶⁴ * 2⁶⁴.
! 
! Optionally, verify your result against builtin arbitrary precision
! support.
! 
! The decimal representation of 2⁶⁴ is:
! 
! 18,446,744,073,709,551,616
! 
! The output of 2⁶⁴ * 2⁶⁴ is 2¹²⁸, and is:
! 
! 340,282,366,920,938,463,463,374,607,431,768,211,456

( scratchpad ) 2 64 ^ dup longmult .
340282366920938463463374607431768211456
( scratchpad ) 2 64 ^ dup * .
340282366920938463463374607431768211456
