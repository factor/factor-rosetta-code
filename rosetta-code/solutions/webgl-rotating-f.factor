! Using WebGL or OpenGL ES 2.0 compatible routines draw a rotating F
! shape.
! 
! Specifically avoid glBegin, glVertex, glPush/PopMatrix, or glu(t/fw),
! however all functions needed are available in (eg) opengl32.dll.
! 
! While the Phix example below uses a somewhat fudged "Hello!" graphic,
! any texture or even just plain colours is perfectly acceptable.
! 
! A detailed tutorial (if code below does not suffice) can be found at
! https://webglfundamentals.org - specifically 2^(nd) 3D and 1^(st)
! textures sections.
! 
! Be warned that site can and probably will stress your CPU, but closing
! the page returns things to normal pretty quickly. The OpenGL task
! entries for JavaScript, Phix, and Rust could also be used as starting
! points, as can OpenGL_pixel_shader entries for JavaScript and Phix.
! 
! Optional extra
! 
! Allow toggling between the F shape and a classic Utah teapot.


