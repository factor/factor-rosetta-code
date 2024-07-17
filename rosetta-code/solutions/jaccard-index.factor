! The Jaccard index, also known as the Jaccard similarity coefficient, is
! a statistic used for gauging the similarity and diversity of sample
! sets. It was developed by Paul Jaccard, originally giving the French
! name coefficient de communauté, and independently formulated again by T.
! Tanimoto. Thus, the Tanimoto index or Tanimoto coefficient are also used
! in some fields. However, they are identical in generally taking the
! ratio of Intersection over Union. The Jaccard coefficient measures
! similarity between finite sample sets, and is defined as the size of the
! intersection divided by the size of the union of the sample sets:
! 
!     J(A, B) = |A ∩ B|/|A ∪ B|
! 
! Define sets as follows, using any linear data structure:
! 
!     A = {}
!     B = {1, 2, 3, 4, 5}
!     C = {1, 3, 5, 7, 9}
!     D = {2, 4, 6, 8, 10}
!     E = {2, 3, 5, 7}
!     F = {8}
! 
! Write a program that computes the Jaccard index for every ordered
! pairing (to show that J(A, B) and J(B, A) are the same) of these sets,
! including self-pairings.

USING: assocs formatting grouping kernel math math.combinatorics
prettyprint sequences sequences.repeating sets ;

: jaccard ( seq1 seq2 -- x )
    2dup [ empty? ] both? [ 2drop 1 ]
    [ [ intersect ] [ union ] 2bi [ length ] bi@ / ] if ;

{ { } { 1 2 3 4 5 } { 1 3 5 7 9 } { 2 4 6 8 10 } { 2 3 5 7 } { 8 } }
[ 2 <combinations> ] [ 2 repeat 2 group append ] bi
[ 2dup jaccard "%u %u -> %u\n" printf ] assoc-each
