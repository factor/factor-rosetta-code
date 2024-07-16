! An Ulam spiral (of primes) is a method of visualizing primes when
! expressed in a (normally counter-clockwise) outward spiral (usually
! starting at 1), constructed on a square grid, starting at the "center".
! 
! An Ulam spiral is also known as a prime spiral.
! 
! The first grid (green) is shown with sequential integers, starting at 1.
! 
! In an Ulam spiral of primes, only the primes are shown (usually
! indicated by some glyph such as a dot or asterisk), and all non-primes
! as shown as a blank (or some other whitespace).
! 
! Of course, the grid and border are not to be displayed (but they are
! displayed here when using these Wiki HTML tables).
! 
! Normally, the spiral starts in the "center", and the 2^(nd) number is to
! the viewer's right and the number spiral starts from there in a
! counter-clockwise direction.
! 
! There are other geometric shapes that are used as well, including
! clock-wise spirals.
! 
! Also, some spirals (for the 2^(nd) number) is viewed upwards from the
! 1^(st) number instead of to the right, but that is just a matter of
! orientation.
! 
! Sometimes, the starting number can be specified to show more visual
! striking patterns (of prime densities).
! 
! [A larger than necessary grid (numbers wise) is shown here to illustrate
! the pattern of numbers on the diagonals (which may be used by the method
! to orientate the direction of spiral-construction algorithm within the
! example computer programs)].
! 
! Then, in the next phase in the transformation of the Ulam prime spiral,
! the non-primes are translated to blanks.
! 
! In the orange grid below, the primes are left intact, and all non-primes
! are changed to blanks.
! 
! Then, in the final transformation of the Ulam spiral (the yellow grid),
! translate the primes to a glyph such as a • or some other suitable
! glyph.
! 
!   ---- ---- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- ---- ---- ----
!   65   64   63   62   61   60   59   58   57 |->   66   37   36   35   34   33   32   31   56
!   67   38   17   16   15   14   13   30   55                                               
!   68   39   18   5    4    3    12   29   54                                               
!   69   40   19   6    1    2    11   28   53                                               
!   70   41   20   7    8    9    10   27   52                                               
!   71   42   21   22   23   24   25   26   51                                               
!   72   43   44   45   46   47   48   49   50                                               
!   73   74   75   76   77   78   79   80   81                                               
!   ---- ---- ---- ---- ---- ---- ---- ---- -------- ---- ---- ---- ---- ---- ---- ---- ---- ----
! 
!   ---- ---- ---- --- ---- ---- ---- ---- ----
!                      61        59        
!        37                           31   
!   67        17                 13        
!                  5        3         29   
!             19            2    11        53
!        41        7                       
!   71                 23                  
!        43                 47             
!   73                           79        
!   ---- ---- ---- --- ---- ---- ---- ---- ----
! 
!   --- --- --- --- --- --- --- --- ---
!                   •       •       
!       •                       •   
!   •       •               •       
!               •       •       •   
!           •           •   •       •
!       •       •                   
!   •               •               
!       •               •           
!   •                       •       
!   --- --- --- --- --- --- --- --- ---
! 
! The Ulam spiral becomes more visually obvious as the grid increases in
! size.
! 
! Task
! 
! For any sized N × N grid, construct and show an Ulam spiral
! (counter-clockwise) of primes starting at some specified initial number
! (the default would be 1), with some suitably dotty (glyph)
! representation to indicate primes, and the absence of dots to indicate
! non-primes.
! 
! You should demonstrate the generator by showing at Ulam prime spiral
! large enough to (almost) fill your terminal screen.
! 
! Related tasks:
! 
! -   Spiral matrix
! -   Zig-zag matrix
! -   Identity matrix
! -   Sequence of primes by Trial Division
! 
! See also
! 
! -   Wikipedia entry: Ulam spiral
! -   MathWorld™ entry: Prime Spiral

