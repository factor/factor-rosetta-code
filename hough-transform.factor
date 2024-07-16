! Task:
! 
! Implement the Hough transform, which is used as part of feature
! extraction with digital images.
! 
! It is a tool that makes it far easier to identify straight lines in the
! source image, whatever their orientation.
! 
! The transform maps each point in the target image, (ρ, θ), to the
! average color of the pixels on the corresponding line of the source
! image (in (x, y)-space, where the line corresponds to points of the form
! xcos θ + ysin θ = ρ). The idea is that where there is a straight line in
! the original image, it corresponds to a bright (or dark, depending on
! the color of the background field) spot; by applying a suitable filter
! to the results of the transform, it is possible to extract the locations
! of the lines in the original image.
! 
! [Sample PNG image to use for the Hough transform.] The target space
! actually uses polar coordinates, but is conventionally plotted on
! rectangular coordinates for display. There's no specification of exactly
! how to map polar coordinates to a flat surface for display, but a
! convenient method is to use one axis for θ and the other for ρ, with the
! center of the source image being the origin.
! 
! There is also a spherical Hough transform, which is more suited to
! identifying planes in 3D data.

