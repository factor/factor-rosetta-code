! Task:
! 
! Given six numbers randomly selected from the list [1, 1, 2, 2, 3, 3, 4,
! 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 25, 50, 75, 100], calculate
! using only positive integers and four operations [+, -, *, /] a random
! number between 101 and 999.
! 
! Example:
! 
! Using: [3, 6, 25, 50, 75, 100]
! 
! Target: 952
! 
! Solution:
! 
! -   100 + 6 = 106
! -   75 * 3 = 225
! -   106 * 225 = 23850
! -   23850 - 50 = 23800
! -   23800 / 25 = 952
! 
! Origins:
! 
! This is originally a 1972 French television game show. The game consists
! of randomly selecting six of the twenty-four numbers, from a list of:
! twenty "small numbers" (two each from 1 to 10), and four "large numbers"
! of 25, 50, 75 and 100. A random target number between 101 and 999 is
! generated. The players have 30 seconds to work out a sequence of
! calculations with the numbers whose final result is as close as possible
! to the target number. Only the four basic operations: addition,
! subtraction, multiplication and division can be used to create new
! numbers and not all six numbers are required. A number can only be used
! once. Division can only be done if the result has no remainder
! (fractions are not allowed) and only positive integers can be obtained
! at any stage of the calculation. (More info on the original game).
! 
! Extra challenge:
! 
! The brute force algorithm is quite obvious. What is more interesting is
! to find some optimisation heuristics to reduce the number of
! calculations. For example, a rather interesting computational challenge
! is to calculate, as fast as possible, all existing solutions (that means
! 2'764'800 operations) for all possible games (with all the 13'243
! combinations of six numbers out of twenty-four for all 898 possible
! targets between 101 and 999).
! 
! Category:Puzzles Category:Games


