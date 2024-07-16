! A particular ranking of a permutation associates an integer with a
! particular ordering of all the permutations of a set of distinct items.
! For our purposes the ranking will assign integers 0..(n! − 1) to an
! ordering of all the permutations of the integers 0..(n − 1).
! 
! For example, the permutations of the digits zero to 3 arranged
! lexicographically have the following rank:
! 
!       PERMUTATION      RANK
!       (0, 1, 2, 3) ->  0
!       (0, 1, 3, 2) ->  1
!       (0, 2, 1, 3) ->  2
!       (0, 2, 3, 1) ->  3
!       (0, 3, 1, 2) ->  4
!       (0, 3, 2, 1) ->  5
!       (1, 0, 2, 3) ->  6
!       (1, 0, 3, 2) ->  7
!       (1, 2, 0, 3) ->  8
!       (1, 2, 3, 0) ->  9
!       (1, 3, 0, 2) -> 10
!       (1, 3, 2, 0) -> 11
!       (2, 0, 1, 3) -> 12
!       (2, 0, 3, 1) -> 13
!       (2, 1, 0, 3) -> 14
!       (2, 1, 3, 0) -> 15
!       (2, 3, 0, 1) -> 16
!       (2, 3, 1, 0) -> 17
!       (3, 0, 1, 2) -> 18
!       (3, 0, 2, 1) -> 19
!       (3, 1, 0, 2) -> 20
!       (3, 1, 2, 0) -> 21
!       (3, 2, 0, 1) -> 22
!       (3, 2, 1, 0) -> 23
! 
! Algorithms exist that can generate a rank from a permutation for some
! particular ordering of permutations, and that can generate the same rank
! from the given individual permutation (i.e. given a rank of 17 produce
! (2, 3, 1, 0) in the example above).
! 
! One use of such algorithms could be in generating a small, random,
! sample of permutations of n items without duplicates when the total
! number of permutations is large. Remember that the total number of
! permutations of n items is given by n! which grows large very quickly: A
! 32 bit integer can only hold 12!, a 64 bit integer only 20!. It becomes
! difficult to take the straight-forward approach of generating all
! permutations then taking a random sample of them.
! 
! A question on the Stack Overflow site asked how to generate one million
! random and indivudual permutations of 144 items.
! 
! Task:
! 
! 1.  Create a function to generate a permutation from a rank.
! 2.  Create the inverse function that given the permutation generates its
!     rank.
! 3.  Show that for n = 3 the two functions are indeed inverses of each
!     other.
! 4.  Compute and show here 4 random, individual, samples of permutations
!     of 12 objects.
! 
! Stretch goal:
! 
! -   State how reasonable it would be to use your program to address the
!     limits of the Stack Overflow question.
! 
! References:
! 
! 1.  Ranking and Unranking Permutations in Linear Time by Myrvold &
!     Ruskey. (Also available via Google here).
! 2.  Ranks on the DevData site.
! 3.  Another answer on Stack Overflow to a different question that
!     explains its algorithm in detail.
! 
! Related tasks:
! 
! 1.  Factorial_base_numbers_indexing_permutations_of_a_collection

