! Introduction
! 
! Color separation is the act of decomposing a color graphic or photo into
! single-color layers.
! 
! Separating in the RGB color model
! 
! The RGB color model is used when creating color on surfaces that are
! naturally black (without color), such as screens of TVs, computer
! monitors or cellphones. It is called RGB from the names of additive
! colors (red, green, blue). This model is called additive because the
! colors are "added" to black (no color).
! 
! Each pixel on the screen is built by driving three small and very close
! but still separated RGB light sources. At common viewing distance, the
! separate sources are indistinguishable, which tricks the eye to see a
! given solid color. All the pixels together arranged in the rectangular
! screen surface conforms the color image.
! 
! Each layer shows the intensity of the respective primary color on the
! original image. Black dots means that these light sources are completely
! off there.
! 
! Separating in the CMY color model
! 
! The CMY color model is used when creating color on surfaces that are
! naturally white (containing all colors), such as paper. It is called CMY
! from the names of subtractive colors (cyan, magenta, yellow). This model
! is called subtractive because the colors are "subtracted" to white (all
! colors).
! 
! The process usually involves "mixing" cyan, magenta, and yellow ink onto
! the paper. In some printing procedures, such as inkjet printers, the
! inks are not actually mixed, they are usually placed as small dots using
! different sizes and patterns, i.e. halftoning or dithering.
! 
! Each layer shows the intensity of ink application of the respective
! color on the original image. No ink is applied to the white areas.
! 
! Separating in the CMYK color model
! 
! The CMYK model adds a black layer to the CMY model. There are several
! reasons for this, including:
! 
! -   In practice, mixing 100% cyan, magenta, and yellow ink on paper
!     (intended to get black) does not fully absorb all the colors,
!     whereas "pure" black ink does.
! -   For various types of paper —i.e. standard office paper—, printing
!     darker areas require more cyan, magenta, and yellow ink, making the
!     paper damp.
! -   In darker or blacker areas, it is less expensive to use a single ink
!     than three, or to use less of the other inks.
! 
! Warning
! 
! Simplistic separation into CMY and CMYK layers is often discouraged for
! professional printing, because the printed result depends on the
! material properties of the inks, the "mixing" process, and the material
! properties of the media. For this, the graphic industry has created the
! so-called ICC profiles. They are specifications for correction and
! adjustment for a certain combination of printing device and media, among
! other factors.
! 
! If you want to go to a print shop to reproduce an existing image or
! printed material, do not separate the CMYK layers yourself, instead give
! them your file or printed material, they will do the color separation
! and printing process using ICC profiles according to the scanner,
! printer and paper they will use.
! 
! Task
! 
! For educational and entertainment purposes, write programs, scripts,
! functions, procedures, etc. to do the following:
! 
! -   Given an image, create three images, one for each color separated in
!     the RGB model.
! -   Given an image, create three images, one for each color separated in
!     the CMY model.
! -   Given an image, create four images, one for each color separated in
!     the CMYK model. It is not required to implement ICC profiles. Note:
!     there is not a unique algorithm to convert from RGB to CMYK, several
!     algorithms have been developed according to special optimizations,
!     you can use whatever you like. The simplest one is called "rough" or
!     "naive", see this, page 23.


