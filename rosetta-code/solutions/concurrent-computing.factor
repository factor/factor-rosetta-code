! Task:
! 
! Using either native language concurrency syntax or freely available
! libraries, write a program to display the strings "Enjoy" "Rosetta"
! "Code", one string per line, in random order.
! 
! Concurrency syntax must use threads, tasks, co-routines, or whatever
! concurrency is called in your language.
! 
! Category:Basic language learning

USE: concurrency.combinators

{ "Enjoy" "Rosetta" "Code" } [ print ] parallel-each