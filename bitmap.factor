! Show a basic storage type to handle a simple RGB raster graphics image,
! and some primitive associated functions.
! 
! If possible provide a function to allocate an uninitialised image, given
! its width and height, and provide 3 additional functions:
! 
! -   -   one to fill an image with a plain RGB color,
!     -   one to set a given pixel with a color,
!     -   one to get the color of a pixel.
! 
! (If there are specificities about the storage or the allocation, explain
! those.)
! 
! These functions are used as a base for the articles in the category
! raster graphics operations, and a basic output function to check the
! results is available in the article write ppm file.

USING: arrays fry kernel math.matrices sequences ;
IN: rosettacode.raster.storage

! Various utilities
: meach ( matrix quot -- ) [ each ] curry each ; inline
: meach-index ( matrix quot -- ) 
    [ swap 2array ] prepose
    [ curry each-index ] curry each-index ; inline
: mmap ( matrix quot -- matrix' ) [ map ] curry map ; inline
: mmap! ( matrix quot -- matrix' ) [ map! ] curry map! ; inline
: mmap-index ( matrix quot -- matrix' ) 
    [ swap 2array ] prepose
    [ curry map-index ] curry map-index ; inline

: matrix-dim ( matrix -- i j ) [ length ] [ first length ] bi ;
: set-Mi,j ( elt {i,j} matrix -- ) [ first2 swap ] dip nth set-nth ;
: Mi,j ( {i,j} matrix -- elt ) [ first2 swap ] dip nth nth ;

! The storage functions
: <raster-image> ( width height -- image ) 
    zero-matrix [ drop { 0 0 0 } ] mmap ;
: fill-image ( {R,G,B} image -- image ) 
    swap '[ drop _ ] mmap! ;
: set-pixel ( {R,G,B} {i,j} image -- ) set-Mi,j ; inline
: get-pixel ( {i,j} image -- pixel ) Mi,j ; inline
