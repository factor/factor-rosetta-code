! Introduction
! 
! Suppose you have to sort a list of strings based on a property of each,
! called "the key", i.e. their lenghts. The most popular solution would
! require the use of a sorting algorithm with a custom comparator.
! 
! Now suppose that key computation is an expensive operation, for example,
! it might involve intensive reading of files, databases, or exchanging
! information over a network. In such a case, using a sorting algorithm
! with a custom comparator is not optimal, because the key is computed
! multiple times for each element in the array, once each time the element
! needs to be compared to another (and also requires the calculation of
! the key for that other).
! 
! The decorate-sort-undecorate idiom
! 
! One solution of the problem is called the "decorate-sort-undecorate"
! idiom, pattern or technique. It was originated and named by the Lisp
! community.
! 
! Suppose we want to sort the following list of words according to their
! lengths (the length was chosen for illustrative purposes, it is not
! precisely an "expensive" operation).
! 
! {"Rosetta", "Code", "is", "a", "programming", "chrestomathy", "site"}
! 
! According to the decorate-sort-decorate idiom, we have to "decorate"
! each element with its key, so each element of the original list becomes
! a pair. Notice that the key is calculated once (and only once) for each
! element in the list:
! 
! {{"Rosetta", 7}, {"Code", 4}, {"is", 2}, {"a", 1}, {"programming", 11}, {"chrestomathy", 12}, {"site", 4}}
! 
! The list is then sorted according to the second element of each pair
! (the key), perhaps using a custom comparator:
! 
! {{"a", 1}, {"is", 2}, {"site", 4}, {"Code", 4}, {"Rosetta", 7}, {"programming", 11}, {"chrestomathy", 12}}
! 
! And finally, the list must be undecorated, we have to remove the second
! element of each pair (the key):
! 
! {"a", "is", "site", "Code", "Rosetta", "programming", "chrestomathy"}
! 
! So, the decoration acts as a form of memoization.
! 
! The Schwartzian transform
! 
! Randal L. Schwartz wrote an implementation of the
! decorate-sort-undecorate idiom in Perl in 1994, which gained much
! popularity in the Perl community. It was named "Schwartzian transform".
! Today the terms decorate-sort-undecorate and the Schwartzian transform
! are used interchangeably, even outside the Perl community.
! 
! The Wikipedia page states that a solution can be called a "Schwartzian
! transform" only if it does not use named temporary lists or arrays. The
! Lisp solution and even the solution shown by Schwartz actually use
! intermediate lists, but these lists do not have explicit names, instead
! they use a functional composition of map-sort-map operations.
! 
! Task
! 
! Write in your programming language, a function, procedure, method,
! routine, etc. to sort a list of words by length (the key function),
! using the decorate-sort-undecorate idiom.
! 
! -   Bonus 1. If your solution can accept the key function as a callback.
! -   Bonus 2. If your solution is also a "Schwartzian transform", this
!     is, it does not use named temporary lists/arrays.
! 
! You can, at your choice, show two solutions, the first using
! intermediate named lists/arrays, and the second one not using them (a
! Schwartzian transform)(if applicable). The first solution is sometimes
! more valuable, because the use of named entities makes the code clearer.
! 
! References
! 
! -   -   Wikipedia: Schwartzian transform
! 
! Category:Sorting


USING: prettyprint sequences sorting.extras ;

{ "Rosetta" "Code" "is" "a" "programming" "chrestomathy" "site" }
[ length ] map-sort .

