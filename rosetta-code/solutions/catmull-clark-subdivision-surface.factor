! Implement the Catmull-Clark surface subdivision (description on
! Wikipedia), which is an algorithm that maps from a surface (described as
! a set of points and a set of polygons with vertices at those points) to
! another more refined surface. The resulting surface will always consist
! of a mesh of quadrilaterals.
! 
! The process for computing the new locations of the points works as
! follows when the surface is free of holes: [Starting cubic mesh; the
! meshes below are derived from this.] [After one round of the
! Catmull-Clark algorithm applied to a cubic mesh.] [After two rounds of
! the Catmull-Clark algorithm. As can be seen, this is converging to a
! surface that looks nearly spherical.]
! 
! 1.  for each face, a face point is created which is the average of all
!     the points of the face.
! 2.  for each edge, an edge point is created which is the average between
!     the center of the edge and the center of the segment made with the
!     face points of the two adjacent faces.
! 3.  for each vertex point, its coordinates are updated from
!     (new_coords):
!     1.  the old coordinates (old_coords),
!     2.  the average of the face points of the faces the point belongs to
!         (avg_face_points),
!     3.  the average of the centers of edges the point belongs to
!         (avg_mid_edges),
!     4.  how many faces a point belongs to (n), then use this formula:
! 
!      m¹ = (n - 3) / n
!      m² = 1 / n
!      m³ = 2 / n
!      new_coords = (m¹ * old_coords)
!                 + (m² * avg_face_points)
!                 + (m³ * avg_mid_edges)
! 
! Then each face is replaced by new faces made with the new points,
! 
! -   for a triangle face (a,b,c):
! 
!    (a, edge_point_(ab), face_point_(abc), edge_point_(ca))
!    (b, edge_point_(bc), face_point_(abc), edge_point_(ab))
!    (c, edge_point_(ca), face_point_(abc), edge_point_(bc))
! 
! -   for a quad face (a,b,c,d):
! 
!    (a, edge_point_(ab), face_point_(abcd), edge_point_(da))
!    (b, edge_point_(bc), face_point_(abcd), edge_point_(ab))
!    (c, edge_point_(cd), face_point_(abcd), edge_point_(bc))
!    (d, edge_point_(da), face_point_(abcd), edge_point_(cd))
! 
! When there is a hole, we can detect it as follows:
! 
! -   an edge is the border of a hole if it belongs to only one face,
! -   a point is on the border of a hole if n_(faces) != n_(edges) with
!     n_(faces) the number of faces the point belongs to, and n_(edges)
!     the number of edges a point belongs to.
! 
! On the border of a hole the subdivision occurs as follows:
! 
! 1.  for the edges that are on the border of a hole, the edge point is
!     just the middle of the edge.
! 2.  for the vertex points that are on the border of a hole, the new
!     coordinates are calculated as follows:
!     1.  in all the edges the point belongs to, only take in account the
!         middles of the edges that are on the border of the hole
!     2.  calculate the average between these points (on the hole
!         boundary) and the old coordinates (also on the hole boundary).
! 
! For edges and vertices not next to a hole, the standard algorithm from
! above is used.


