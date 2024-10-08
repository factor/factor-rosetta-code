! A mesh defining a surface has uniquely numbered vertices, and named,
! simple-polygonal faces described usually by an ordered list of edge
! numbers going around the face,
! 
! For example: External image of two faces
! 
! Rough textual version without edges:
! 
! 
!           1         
!                             17
!      7   A
!                  B
! 
!            11                     
!                       23
! 
! -   A is the triangle (1, 11, 7), or equally (7, 11, 1), going
!     anti-clockwise, or
! 
! any of all the rotations of those ordered vertices.
! 
!           1         
! 
!      7   A
! 
! 
!            11
! 
! -   B is the four-sided face (1, 17, 23, 11), or equally (23, 17, 1, 11)
!     or any
! 
! of their rotations.
! 
!     1         
!                       17
! 
!            B
! 
!      11                     
!                 23
! 
! Let's call the above the perimeter format as it traces around the
! perimeter.
! 
! A second format:
! 
! A separate algorithm returns polygonal faces consisting of a face name
! and an unordered set of edge definitions for each face.
! 
! -   A single edge is described by the vertex numbers at its two ends,
!     always in
! 
! ascending order.
! 
! -   All edges for the face are given, but in an undefined order.
! 
! For example face A could be described by the edges (1, 11), (7, 11), and
! (1, 7) (The order of each vertex number in an edge is ascending, but the
! order in which the edges are stated is arbitrary).
! 
! Similarly face B could be described by the edges (11, 23), (1, 17), (17,
! 23), and (1, 11) in arbitrary order of the edges.
! 
! Let's call this second format the edge format.
! 
! Task:
! 
! 1. Write a routine to check if two perimeter formatted faces have the
! same perimeter. Use it to check if the following pairs of perimeters are
! the same:
! 
!      Q: (8, 1, 3)
!      R: (1, 3, 8)
! 
!      U: (18, 8, 14, 10, 12, 17, 19)
!      V: (8, 14, 10, 12, 17, 19, 18)
! 
! 2. Write a routine and use it to transform the following faces from edge
! to perimeter format.
! 
!      E: {(1, 11), (7, 11), (1, 7)}
!      F: {(11, 23), (1, 17), (17, 23), (1, 11)}
!      G: {(8, 14), (17, 19), (10, 12), (10, 14), (12, 17), (8, 18), (18, 19)}
!      H: {(1, 3), (9, 11), (3, 11), (1, 11)}
! 
! Show your output here.


