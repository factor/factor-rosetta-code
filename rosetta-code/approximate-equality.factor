! Sometimes, when testing whether the solution to a task (for example,
! here on Rosetta Code) is correct, the difference in floating point
! calculations between different language implementations becomes
! significant.
! 
! For example, a difference between 32 bit and 64 bit floating point
! calculations may appear by about the 8th significant digit in base 10
! arithmetic.
! 
! Task:
! 
! Create a function which returns true if two floating point numbers are
! approximately equal.
! 
! The function should allow for differences in the magnitude of numbers,
! so that, for example,
! 
! 100000000000000.01 may be approximately equal to 100000000000000.011,
! 
! even though 100.01 is not approximately equal to 100.011.
! 
! If the language has such a feature in its standard library, this may be
! used instead of a custom function.
! 
! Show the function results with comparisons on the following pairs of
! values:
! 
! :# 100000000000000.01, 100000000000000.011 (note: should return true)
! 
! :# 100.01, 100.011 (note: should return false)
! 
! :# 10000000000000.001 / 10000.0, 1000000000.0000001000
! 
! :# 0.001, 0.0010000001
! 
! :# 0.000000000000000000000101, 0.0
! 
! :#  sqrt(2) * sqrt(2),  2.0
! 
! :# -sqrt(2) * sqrt(2), -2.0
! 
! :# 3.14159265358979323846, 3.14159265358979324
! Answers should be true for the first example and false in the second, so
! that just rounding the numbers to a fixed number of decimals should not
! be enough. Otherwise answers may vary and still be correct. See the
! Python code for one type of solution.
! 
! __TOC__

USING: formatting generalizations kernel math math.functions ;

100000000000000.01             100000000000000.011
100.01                         100.011
10000000000000.001 10000.0 /f  1000000000.0000001000
0.001                          0.0010000001
0.000000000000000000000101     0.0
2 sqrt dup *                   2.0
2 sqrt dup neg *              -2.0
3.14159265358979323846         3.14159265358979324

[ 2dup -1e-15 ~ "%+47.30f %+47.30f -1e-15 ~ : %u\n" printf ]
2 8 mnapply
