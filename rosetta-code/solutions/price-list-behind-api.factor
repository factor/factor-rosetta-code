! There is a list of around 100_000 prices in the range £0 to £100_000,
! expressed in whole £, (no pence); and prices may be duplicated.
! 
! The API allows access to the maximum item price via function
! get_max_price(); and the number of items equal-to and between two given
! price points via function get_prange_count(pricemin, pricemax).
! 
! Assume that for the purposes of testing, you have access to the actual
! number of priced items to split.
! 
! Task:
! 
! 1.  Write functions to randomly generate around 100K prices and provide
!     the get_prange_count and get_max_price API calls.
! 2.  Write functions to provide non-overlapping min and max price ranges
!     that provide product counts where most are close to, but no more
!     than, 5_000.
! 3.  Ensure that all priced items are covered by all the ranges of prices
!     shown
! 4.  Show ascending price ranges and the number of items covered by each
!     range.
! 5.  Show output from a sample run here.


