! An extended Straddling Checkerboard, is like the regular Straddling
! checkerboard, but allows word dictionaries and arbitrary functional
! codes such as FIGURE, where you can specify a number literally.
! 
! Task
! 
! Implement encoding and decoding of a message using the extended
! straddling checkerboard, CT-37w, as described in the reference below.
! 
! You may switch the codes for F/L (99) and SUPP (98) to help
! differentiate the code for '9' from that of '999' and, if you do that,
! then digits only needed to be doubled rather than tripled. So we would
! then have the following checkerboard:
! 
!       A   E   I   N   O   T  CODE
!       0   1   2   3   4   5   6
! 
!       B   C   D   F   G   H   J   K   L   M
!      70  71  72  73  74  75  76  77  78  79
! 
!       P   Q   R   S   U   V   W   X   Y   Z
!      80  81  82  83  84  85  86  87  88  89
! 
!     SPC (.) ACK REQ MSG  RV GRD SND F/L SUP
!      90  91  92  93  94  95  96  97  98  99
! 
!       0   1   2   3   4   5   6   7   8   9
!      00  11  22  33  44  55  66  77  88  99
! 
! There is no need to create a word dictionary for CODE (6). It suffices
! to just include CODE followed by some 3 digit number in the message to
! be encoded.
! 
! Test your solution by encoding and decoding the message:
! 
! 'Admin ACK your MSG. CODE291 SEND further 2000 SUPP to HQ by 1 March'
! 
! Related task:
! 
! -   -   Straddling checkerboard
! 
! Reference:
! 
! -   -   Cipher Machines web page on Checkerboards: Checkerboards


