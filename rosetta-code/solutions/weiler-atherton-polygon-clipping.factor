! Weiler-Atherton Polygon Clipping Algorithm
! 
! The Weiler-Atherton polygon clipping algorithm is a method for clipping
! a subject polygon against a clip polygon. It was developed by Kevin
! Weiler and Peter Atherton in 1977 and is particularly useful for
! determining the intersection or difference between two polygons.
! 
! Basic principle
! 
! Unlike the Sutherland-Hodgman algorithm which can only clip against
! convex clip regions, the Weiler-Atherton algorithm works with arbitrary
! polygons, including non-convex ones. The algorithm produces one or more
! polygons as output, representing the intersection between the subject
! and clip polygons.
! 
! Algorithm overview
! 
! The algorithm works by:
! 
! 1.  Finding all intersection points between the subject and clip
!     polygons
! 2.  Creating linked lists of vertices for both polygons, including the
!     intersection points
! 3.  Traversing these lists in a specific order to construct the clipped
!     polygon(s)
! 
! Detailed steps
! 
! 1.  Identify all intersection points where edges of the subject polygon
!     cross edges of the clip polygon
! 2.  Insert these intersection points into both the subject and clip
!     polygon vertex lists, between the appropriate vertices
! 3.  For each intersection point, create pointers between its occurrence
!     in the subject polygon list and its occurrence in the clip polygon
!     list
! 4.  Starting at an intersection point, traverse the boundary:
!     1.  For intersection calculation, follow the subject polygon
!         boundary when inside the clip polygon
!     2.  When reaching an intersection point, switch to the clip polygon
!         boundary if moving from inside to outside
!     3.  Continue until returning to the starting point
! 5.  If multiple closed paths exist, repeat the process for each
!     unvisited intersection point
! 
! Mathematical representation
! 
! Given a subject polygon S = {s₁, s₂, ..., s_(n)} and a clip polygon
! C = {c₁, c₂, ..., c_(m)}, the algorithm computes one or more result
! polygons R_(i) that represent the intersection S ∩ C.
! 
! Applications
! 
! -   Computer graphics and computational geometry
! -   GIS systems for map overlay operations
! -   CAD/CAM systems for determining part intersections
! -   Image processing for masking operations
! 
! Advantages
! 
! -   Works with both convex and non-convex polygons
! -   Can handle complex polygon intersections resulting in multiple
!     output polygons
! -   Preserves the original geometric information better than
!     rasterization-based approaches
! 
! Limitations
! 
! -   More complex to implement than simpler algorithms like
!     Sutherland-Hodgman
! -   Requires careful handling of special cases (e.g., when polygons
!     share edges or vertices)
! -   The time complexity is O(n × m) where n and m are the number of
!     vertices in the subject and clip polygons respectively
! 
! Related algorithms
! 
! -   Sutherland-Hodgman polygon clipping (for convex clip polygons)
! -   Greiner-Hormann clipping algorithm (an extension with improved
!     numerical robustness)
! -   Vatti clipping algorithm (handles self-intersecting polygons)


