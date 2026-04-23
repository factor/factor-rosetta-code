! Task:
! 
! Given two strings, demonstrate the following three types of string
! matching:
! 
! ::# Determining if the first string starts with second string
! 
! ::# Determining if the first string contains the second string at any
! location
! 
! ::# Determining if the first string ends with the second string
! 
! Optional requirements:
! 
! ::# Print the location of the match for part 2
! 
! ::# Handle multiple occurrences of a string for part 2.
! 
! Category: String manipulation Category:Simple


/* Does cheesecake start with cheese? */
"cheesecake" "cheese" head?   ! t
/* Does cheesecake contain sec at any location? */
"sec" "cheesecake" subseq?   ! t
/* Does cheesecake end with cake? */
"cheesecake" "cake" tail?   ! t
/* Where in cheesecake is the leftmost sec? */
"sec" "cheesecake" subseq-start   ! 4
/* Where in Mississippi are all occurrences of iss? */
USE: regexp
"Mississippi" "iss" <regexp> all-matching-slices [ from>> ] map   ! { 1 4 }

