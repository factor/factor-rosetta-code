! A friend of mine runs a pharmacy. He has a specialized function in his
! Dispensary application which receives a decimal value of currency and
! replaces it to a standard value. This value is regulated by a government
! department.
! 
! Task:
! 
! Given a floating point value between 0.00 and 1.00, rescale according to
! the following table:
! 
! >=  0.00  <  0.06  :=  0.10
! >=  0.06  <  0.11  :=  0.18
! >=  0.11  <  0.16  :=  0.26
! >=  0.16  <  0.21  :=  0.32
! >=  0.21  <  0.26  :=  0.38
! >=  0.26  <  0.31  :=  0.44
! >=  0.31  <  0.36  :=  0.50
! >=  0.36  <  0.41  :=  0.54
! >=  0.41  <  0.46  :=  0.58
! >=  0.46  <  0.51  :=  0.62
! >=  0.51  <  0.56  :=  0.66
! >=  0.56  <  0.61  :=  0.70
! >=  0.61  <  0.66  :=  0.74
! >=  0.66  <  0.71  :=  0.78
! >=  0.71  <  0.76  :=  0.82
! >=  0.76  <  0.81  :=  0.86
! >=  0.81  <  0.86  :=  0.90
! >=  0.86  <  0.91  :=  0.94
! >=  0.91  <  0.96  :=  0.98
! >=  0.96  <  1.01  :=  1.00

CONSTANT: dispensary-data {
{ 0.06 0.10 }
{ 0.11 0.18 }
{ 0.16 0.26 }
{ 0.21 0.32 }
{ 0.26 0.38 }
{ 0.31 0.44 }
{ 0.36 0.50 }
{ 0.41 0.54 }
{ 0.46 0.58 }
{ 0.51 0.62 }
{ 0.56 0.66 }
{ 0.61 0.70 }
{ 0.66 0.74 }
{ 0.71 0.78 }
{ 0.76 0.82 }
{ 0.81 0.86 }
{ 0.86 0.90 }
{ 0.91 0.94 }
{ 0.96 0.98 }
{ 1.01 1.00 } }

: price-fraction ( n -- n ) dispensary-data [ first over >= ] find 2nip second ;

{ 0 0.5 0.65 0.66 1 } [ price-fraction ] map
