! Using the triangle geometry from OpenGL. But instead of using a
! mechanism such as glColor3d, use a pixel shader for each pixel in the
! triangle. The pixel shader should pick a random RGB color for each
! pixel. Most pixels should have colors which are different from that of
! most other pixels.
! 
! Optional: provide an update mechanism, to repeatedly re-render the
! triangle. (Possibilities include a mouse event handler, a timer event
! handler or an infinite loop, or even window expose events.) Shader
! generated color for each pixel should be different in each render.
! 
! Optional: after updating the opengl rendering target but before
! rendering the triangle, query the opengl implementation to determine
! which versions of shaders are supported by the rendering target, list
! the tested shaders and the available shaders and then use a supported
! shader.
! 
! See also: opengl.org's gl shader language documentation, and
! lighthouse3d.com's glsl tutorial.


