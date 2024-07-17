! In 1964, Daniel G. Bobrow created the STUDENT AI program in order to
! solve the types of word problems found in high school algebra books. You
! can read Bobrow's 1964 Ph.D. thesis, Natural Language Input for a
! Computer Problem Solving System. The program consists of 3 main pieces:
! 
! 1.  A pattern matcher that reads the english input,
! 2.  rules to translate english into equations, and
! 3.  an algebraic equation solver.
! 
! In chapter 7 of his book, Paradigms of Artificial Intelligence
! Programming: Case Studies in Common Lisp, Peter Norvig lays out the
! STUDENT program and then challenges his readers as follows:
! 
!     "Exercise 7.8 [d] Find a mathematically oriented domain that is
!     sufficiently limited so that STUDENT can solve problems in it. The
!     chemistry of solutions (calculating pH concentrations) might be an
!     example. Write the necessary *student-rules*, and test the resulting
!     program." (PAIP, p. 236)
! 
! There are several types of word problems commonly encountered in high
! school algebra, for example coin problems, age problems, distance
! problems, mixture problems, finance problems, lever problems, and work
! problems.
! 
! For this task, let's focus specifically on coin problems. Example: "If a
! person has three times as many quarters as dimes and the total amount of
! money is $5.95, find the number of quarters and dimes." (Bluman, Allan
! G. Math word problems demystified. 2005. The McGraw-Hill Companies Inc.
! p. 112, problem 1.)
! 
! Coin problems can all pretty much be schematized as follows:
! 
! 1.  There are k types of valuable things: 1, 2, …, i, …, k
! 2.  There are n_(i) instances of the ith type of valuable thing.
! 3.  The value of the ith type of thing is v_(i)
! 4.  The total number of things is:
! 
!         $N = \sum^k_{i=1} n_i$
! 5.  The total value of all the things is:
! 
!         $V = \sum^k_{i=1} n_i \times v_i$
! 
! A typical coin problem wants us to find the n_(i), given some of the
! other information from the schema.
! 
! The task is to write an AI program, inspired by Bobrow's STUDENT program
! and Norvig's challenge in PAIP, capable of solving the kinds of coin
! problems found in high school algebra.
! 
! The program should take coin problems written in plain english and
! output the solutions. The solutions needn't be output in English.


