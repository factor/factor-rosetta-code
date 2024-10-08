! Implement a flood fill.
! 
! A flood fill is a way of filling an area using color banks to define the
! contained area or a target color which "determines" the area (the valley
! that can be flooded; Wikipedia uses the term target color). It works
! almost like a water flooding from a point towards the banks (or: inside
! the valley): if there's a hole in the banks, the flood is not contained
! and all the image (or all the "connected valleys") get filled.
! 
! To accomplish the task, you need to implement just one of the possible
! algorithms (examples are on Wikipedia). Variations on the theme are
! allowed (e.g. adding a tolerance parameter or argument for
! color-matching of the banks or target color).
! 
! [] Testing: the basic algorithm is not suitable for truecolor images; a
! possible test image is the one shown on the right box; you can try to
! fill the white area, or the black inner circle.
! 
! Category:Graphics algorithms


