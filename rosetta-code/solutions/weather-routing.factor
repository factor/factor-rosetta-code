! The weather routing problem has the following parts:
! 
! -   a predicted surface wind direction and speed, at increments of
!     longitude, latitude, and time
! -   an expected surface current direction and speed, at increments of
!     longitude, latitude, and time
! -   'polar data' describing maximum speed of a sailboat at points of
!     sail for a given speed of wind over water
! -   regions for sailing (the open ocean) and not (the land, shallows,
!     restricted areas, etc.)
! -   a starting location and time, and a destination
! 
! Given the above information and a specific path, progress and arrival
! time are determined. The weather routing problem, conversely, is to
! determine the path which results in the earliest arrival time.


