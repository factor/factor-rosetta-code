! Task:
! 
! Given three lists:
! 
! list1 = [1,2,3,4,5,6,7,8,9]
! 
! list2 = [10,11,12,13,14,15,16,17,18]
! 
! list3 = [19,20,21,22,23,24,25,26,27]
! 
! Turn the numbers them into strings and concatenate them.
! 
! The result should be:
! 
! list = [11019,21120,31221,41322,51423,61524,71625,81726,91827]

USING: kernel math.parser math.ranges present prettyprint
sequences ;

27 [1,b] 9 cut 9 cut [ [ present ] tri@ 3append dec> ] 3map .
