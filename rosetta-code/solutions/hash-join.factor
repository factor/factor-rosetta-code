! An inner join is an operation that combines two data tables into one
! table, based on matching column values. The simplest way of implementing
! this operation is the nested loop join algorithm, but a more scalable
! alternative is the hash join algorithm.
! 
! Implement the "hash join" algorithm, and demonstrate that it passes the
! test-case listed below.
! 
! You should represent the tables as data structures that feel natural in
! your programming language.
! 
! The "hash join" algorithm consists of two steps:
! 
! 1.  Hash phase: Create a multimap from one of the two tables, mapping
!     from each join column value to all the rows that contain it.
! 
! #* The multimap must support hash-based lookup which scales better than
! a simple linear search, because that's the whole point of this
! algorithm.
! 
! #* Ideally we should create the multimap for the smaller table, thus
! minimizing its creation time and memory size.
! 
! 1.  Join phase: Scan the other table, and find matching rows by looking
!     in the multimap created before.
! 
! In pseudo-code, the algorithm could be expressed as follows:
! 
! let A = the first input table (or ideally, the larger one)
! let B = the second input table (or ideally, the smaller one)
! let j_(A) = the join column ID of table A
! let j_(B) = the join column ID of table B
! let M_(B) = a multimap for mapping from single values to multiple rows of table B (starts out empty)
! let C = the output table (starts out empty)
! 
! for each row b in table B:
!    place b in multimap M_(B) under key b(j_(B))
! 
! for each row a in table A:
!    for each row b in multimap M_(B) under key a(j_(A)):
!       let c = the concatenation of row a and row b
!       place row c in table C
! 
! +----------------------------------+----------------------------------+
! | Input                            | Output                           |
! +==================================+==================================+
! | [TABLE]                          |   A.Age                          |
! |                                  | A.Name   B.Character   B.Nemesis |
! |                                  |   ------- --                     |
! |                                  | ------ ------------- ----------- |
! |                                  |   27                             |
! |                                  |    Jonah    Jonah         Whales |
! |                                  |   27                             |
! |                                  |   Jonah    Jonah         Spiders |
! |                                  |   18                             |
! |                                  |    Alan     Alan          Ghosts |
! |                                  |   18                             |
! |                                  |   Alan     Alan          Zombies |
! |                                  |   28                             |
! |                                  |     Glory    Glory         Buffy |
! |                                  |   28                             |
! |                                  |    Alan     Alan          Ghosts |
! |                                  |   28                             |
! |                                  |   Alan     Alan          Zombies |
! +----------------------------------+----------------------------------+
! 
! The order of the rows in the output table is not significant.
! 
! If you're using numerically indexed arrays to represent table rows
! (rather than referring to columns by name), you could represent the
! output rows in the form [[27, "Jonah"], ["Jonah", "Whales"]].


