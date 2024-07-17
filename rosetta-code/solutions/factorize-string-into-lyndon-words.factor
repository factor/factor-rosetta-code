! Given a finite alphabet, we can lexicographically order all strings in
! the alphabet. If two strings have different lengths, then pad the
! shorter string on the right with the smallest letter. For example, we
! have 01 > 001, but 01 = 010. As we see, this order is a total preorder,
! but not a total order, since it identifies different strings.
! 
! A Lyndon word is a non-empty string that is strictly lower in
! lexicographic order than all its circular rotations. In particular, if a
! string is equal to a circular rotation, then it is not a Lyndon word.
! For example, since 0101 = 0101 (rotation by 2), it is not a Lyndon word.
! 
! The first Lyndon words on the binary alphabet {0, 1} are:
! 
!     0, 1, 01, 001, 011, 0001, 0011, 0111, 00001, 00011, 00101, 00111,
!     01011, 01111, ...
! 
! Some basic properties:
! 
! -   The only Lyndon word that ends with 0 is 0.
! -   Proof. If s0 is a Lyndon word, and s is not empty, then s0 < 0s. If
!     s contains 1 somewhere, then s0 > 0s. Therefore s has only 0. But
!     then s0 = 0s, contradiction.
! -   The lexicographic order is a total order on the Lyndon words.
! -   Proof. For, the only way for two different strings s, s' to have the
!     same lexicographic ordering is for one of them to pad to the other.
!     We can assume that s00...0 = s'. If that is so, then s00...0 is a
!     Lyndon word that ends with 0, so it is just 0, and so s is a Lyndon
!     word that is also empty, contradiction.
! 
! The Chen–Fox–Lyndon theorem states that any string is uniquely
! factorizable into a sequence of Lyndon words non-decreasing in
! lexicographic order. Duval's algorithm computes this in O(length of
! input) time and and O(1) space.[1] See [2] for a description of Duval's
! algorithm.
! 
! [1] Duval, Jean-Pierre (1983), "Factorizing words over an ordered
! alphabet", Journal of Algorithms, 4 (4): 363–381,
! doi:10.1016/0196-6774(83)90017-2
! 
! [2] https://cp-algorithms.com/string/lyndon_factorization.html


