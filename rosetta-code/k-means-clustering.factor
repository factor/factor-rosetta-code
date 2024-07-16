! K-means++ clustering a classification of data, so that points assigned
! to the same cluster are similar (in some sense). It is identical to the
! K-means algorithm, except for the selection of initial conditions. [This
! data was partitioned into 7 clusters using the K-means algorithm.]
! 
! The task is to implement the K-means++ algorithm. Produce a function
! which takes two arguments: the number of clusters K, and the dataset to
! classify. K is a positive integer and the dataset is a list of points in
! the Cartesian plane. The output is a list of clusters (related sets of
! points, according to the algorithm).
! 
! For extra credit (in order):
! 
! 1.  Provide a function to exercise your code, which generates a list of
!     random points.
! 2.  Provide a visualization of your results, including centroids (see
!     example image).
! 3.  Generalize the function to polar coordinates (in radians).
! 4.  Generalize the function to points in an arbitrary N space (i.e.
!     instead of x,y pairs, points are an N-tuples representing
!     coordinates in ℝ^(N)).
!     If this is different or more difficult than the [naive] solution for
!     ℝ², discuss what had to change to support N dimensions.
! 
! Extra credit is only awarded if the examples given demonstrate the
! feature in question. To earn credit for 1. and 2., visualize 6 clusters
! of 30,000 points in ℝ². It is not necessary to provide visualization for
! spaces higher than ℝ² but the examples should demonstrate features 3.
! and 4. if the solution has them.

