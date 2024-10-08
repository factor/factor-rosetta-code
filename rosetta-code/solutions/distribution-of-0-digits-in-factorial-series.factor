! Large Factorials and the Distribution of '0' in base 10 digits.
! 
! About the task:
! 
! We can see that some features of factorial numbers (the series of
! numbers 1!, 2!, 3!, ...) come about because such numbers are the product
! of a series of counting numbers, and so those products have predictable
! factors. For example, all factorials above 1! are even numbers, since
! they have 2 as a factor. Similarly, all factorials from 5! up end in a
! 0, because they have 5 and 2 as factors, and thus have 10 as a factor.
! In fact, the factorial integers add another 0 at the end of the
! factorial for every step of 5 upward: 5! = 120, 10! = 3628800, 15! =
! 1307674368000, 16! = 20922789888000 and so on.
! 
! Because factorial numbers, which quickly become quite large, continue to
! have another terminal 0 on the right hand side of the number for every
! factor of 5 added to the factorial product, one might think that the
! proportion of zeros in a base 10 factorial number might be close to 1/5.
! However, though the factorial products add another terminating 0 every
! factor of 5 multiplied into the product, as the numbers become quite
! large, the number of digits in the factorial product expands
! exponentially, and so the number above the terminating zeros tends
! toward 10% of each digit from 0 to 1 as the factorial becomes larger.
! Thus, as the factorials become larger, the proportion of 0 digits in the
! factorial products shifts slowly from around 1/5 toward 1/10, since the
! number of terminating zeros in n! increases only in proportion to n,
! whereas the number of digits of n! in base 10 increases exponentially.
! 
! The task:
! 
! Create a function to calculate the mean of the proportions of 0 digits
! out of the total digits found in each factorial product from 1! to N!.
! This proportion of 0 digits in base 10 should be calculated using the
! number as printed as a base 10 integer.
! 
! Example: for 1 to 6 we have 1!, 2!, 3!, 4!, 5!, 6!, or (1, 2, 6, 24,
! 120, 720), so we need the mean of (0/1, 0/1, 0/1, 0/2, 1/3, 1/3) = (2/3)
! (totals of each proportion) / 6 (= N), or 0.1111111...
! 
! Example: for 1 to 25 the mean of the proportions of 0 digits in the
! factorial products series of N! with N from 1 to 25 is 0.26787.
! 
! Do this task for 1 to N where N is in (100, 1000, and 10000), so,
! compute the mean of the proportion of 0 digits for each product in the
! series of each of the factorials from 1 to 100, 1 to 1000, and 1 to
! 10000.
! 
! Stretch task:
! 
! Find the N in 10000 < N < 50000 where the mean of the proportions of 0
! digits in the factorial products from 1 to N permanently falls below
! 0.16. This task took many hours in the Python example, though I wonder
! if there is a faster algorithm out there.


