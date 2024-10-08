! Rule 30 is considered to be chaotic enough to generate good
! pseudo-random numbers. As a matter of fact, for a long time rule 30 was
! used by the Mathematica software for its default random number
! generator.
! 
! Steven Wolfram's recommendation for random number generation from rule
! 30 consists in extracting successive bits in a fixed position in the
! array of cells, as the automaton changes state.
! 
! The purpose of this task is to demonstrate this. With the code written
! in the parent task, which you don't need to re-write here, show the ten
! first bytes that emerge from this recommendation. To be precise, you
! will start with a state of all cells but one equal to zero, and you'll
! follow the evolution of the particular cell whose state was initially
! one. Then you'll regroup those bits by packets of eight, reconstituting
! bytes with the first bit being the most significant.
! 
! You can pick which ever length you want for the initial array but it
! should be visible in the code so that your output can be reproduced with
! an other language.
! 
! For extra-credits, you will make this algorithm run as fast as possible
! in your language, for instance with an extensive use of bitwise logic.
! 
! Reference:
! 
! -   Cellular automata: Is Rule 30 random? (PDF).


