! This is an algorithm used to thin a black and white i.e. one bit per
! pixel images.
! 
! For example, with an input image of:
! 
!                                                                
!      #################                   #############         
!      ##################               ################         
!      ###################            ##################         
!      ########     #######          ###################         
!        ######     #######         #######       ######         
!        ######     #######        #######                       
!        #################         #######                       
!        ################          #######                       
!        #################         #######                       
!        ######     #######        #######                       
!        ######     #######        #######                       
!        ######     #######         #######       ######         
!      ########     #######          ###################         
!      ########     ####### ######    ################## ######  
!      ########     ####### ######      ################ ######  
!      ########     ####### ######         ############# ######  
!                                                                
! 
! It produces the thinned output:
! 
!                                                                
! 
!         # ##########                       #######             
!          ##        #                   ####       #            
!          #          #                 ##                       
!          #          #                #                         
!          #          #                #                         
!          #          #                #                         
!          ############               #                          
!          #          #               #                          
!          #          #                #                         
!          #          #                #                         
!          #          #                #                         
!          #                            ##                       
!          #                             ############            
!                            ###                          ###    
! 
!                                                                
! 
! Algorithm:
! 
! Assume black pixels are one and white pixels zero, and that the input
! image is a rectangular N by M array of ones and zeroes.
! 
! The algorithm operates on all black pixels P1 that can have eight
! neighbours.
! 
! The neighbours are, in order, arranged as:
! 
! P9
! 
! P2
! 
! P3
! 
! P8
! 
! P1
! 
! P4
! 
! P7
! 
! P6
! 
! P5
! 
! Obviously the boundary pixels of the image cannot have the full eight
! neighbours.
! 
! -   Define A(P1) = the number of transitions from white to black, (0
!     -> 1) in the sequence P2,P3,P4,P5,P6,P7,P8,P9,P2. (Note the extra P2
!     at the end - it is circular).
! -   Define B(P1) = The number of black pixel neighbours of P1. ( =
!     sum(P2 .. P9) )
! 
! Step 1:
! 
! All pixels are tested and pixels satisfying all the following conditions
! (simultaneously) are just noted at this stage.
! 
! -   (0) The pixel is black and has eight neighbours
! -   (1) 2 <  = B(P1) <  = 6
! -   (2) A(P1) = 1
! -   (3) At least one of P2 and P4 and P6 is white
! -   (4) At least one of P4 and P6 and P8 is white
! 
! After iterating over the image and collecting all the pixels satisfying
! all step 1 conditions, all these condition satisfying pixels are set to
! white.
! 
! Step 2:
! 
! All pixels are again tested and pixels satisfying all the following
! conditions are just noted at this stage.
! 
! -   (0) The pixel is black and has eight neighbours
! -   (1) 2 <  = B(P1) <  = 6
! -   (2) A(P1) = 1
! -   (3) At least one of P2 and P4 and P8 is white
! -   (4) At least one of P2 and P6 and P8 is white
! 
! After iterating over the image and collecting all the pixels satisfying
! all step 2 conditions, all these condition satisfying pixels are again
! set to white.
! 
! Iteration:
! 
! If any pixels were set in this round of either step 1 or step 2 then all
! steps are repeated until no image pixels are so changed.
! 
! Task:
! 
! 1.  Write a routine to perform Zhang-Suen thinning on an image matrix of
!     ones and zeroes.
! 2.  Use the routine to thin the following image and show the output here
!     on this page as either a matrix of ones and zeroes, an image, or an
!     ASCII-art image of space/non-space characters.
! 
!           00000000000000000000000000000000
!           01111111110000000111111110000000
!           01110001111000001111001111000000
!           01110000111000001110000111000000
!           01110001111000001110000000000000
!           01111111110000001110000000000000
!           01110111100000001110000111000000
!           01110011110011101111001111011100
!           01110001111011100111111110011100
!           00000000000000000000000000000000
! 
! Reference:
! 
! -   Zhang-Suen Thinning Algorithm, Java Implementation by Nayef Reza.
! -   "Character Recognition Systems: A Guide for Students and
!     Practitioners" By Mohamed Cheriet, Nawwaf Kharma, Cheng-Lin Liu,
!     Ching Suen


