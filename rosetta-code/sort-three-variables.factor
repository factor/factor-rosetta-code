! Task:
! 
! Sort (the values of) three variables (X, Y, and Z) that contain any
! value (numbers and/or literals).
! 
! If that isn't possible in your language, then just sort numbers (and
! note if they can be floating point, integer, or other).
! 
! I.E.: (for the three variables x, y, and z), where:
! 
!                         x =  'lions, tigers, and'
!                         y =  'bears, oh my!'
!                         z =  '(from the "Wizard of OZ")'
! 
! After sorting, the three variables would hold:
! 
!                         x =  '(from the "Wizard of OZ")'
!                         y =  'bears, oh my!'
!                         z =  'lions, tigers, and'
! 
! For numeric value sorting, use: I.E.: (for the three variables x, y, and
! z), where:
! 
!                         x =  77444
!                         y =    -12
!                         z =      0
! 
! After sorting, the three variables would hold:
! 
!                         x =    -12
!                         y =      0
!                         z =  77444
! 
! The variables should contain some form of a number, but specify if the
! algorithm used can be for floating point or integers. Note any
! limitations.
! 
! The values may or may not be unique.
! 
! The method used for sorting can be any algorithm; the goal is to use the
! most idiomatic in the computer programming language used.
! 
! More than one algorithm could be shown if one isn't clearly the better
! choice.
! 
! One algorithm could be:
! 
!                         •  store the three variables x, y, and z
!                                  into an array (or a list) A
!                          
!                         •  sort  (the three elements of)  the array A
!                          
!                         •  extract the three elements from the array and place them in the
!                                  variables x, y, and z in order of extraction
! 
! Another algorithm (only for numeric values):
! 
!        x= 77444 
!        y=   -12 
!        z=     0      
!     low= x                                          
!     mid= y                                          
!    high= z 
!       x= min(low,  mid,  high)            /*determine the lowest value of X,Y,Z. */    
!       z= max(low,  mid,  high)            /*    "      "  highest  "    " " " "  */    
!       y=     low + mid + high - x - z     /*    "      "  middle   "    " " " "  */      
! 
! Show the results of the sort here on this page using at least the values
! of those shown above.

USING: arrays io kernel prettyprint sequences sorting ;
IN: rosetta-code.sort-three

: sort3 ( b c a -- a b c ) 3array natural-sort first3 ;

"lions, tigers, and"
"bears, oh my!"
"(from the \"Wizard of OZ\")"
sort3 [ print ] tri@

77444 -12 0 sort3 [ . ] tri@
