! Task:
! 
! Write a program which uses a timer (with the least granularity available
! on your system) to time how long a function takes to execute.
! 
! Whenever possible, use methods which measure only the processing time
! used by the current process; instead of the difference in system time
! between start and finish, which could include time used by other
! processes on the computer.
! 
! This task is intended as a subtask for Measure relative performance of
! sorting algorithms implementations.
! 
! Category:Date and time

USING: kernel sequences tools.time ;

[ 10000 <iota> sum drop ] time
