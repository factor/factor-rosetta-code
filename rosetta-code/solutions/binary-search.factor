! A binary search divides a range of values into halves, and continues to
! narrow down the field of search until the unknown value is found. It is
! the classic example of a "divide and conquer" algorithm.
! 
! As an analogy, consider the children's game "guess a number." The scorer
! has a secret number, and will only tell the player if their guessed
! number is higher than, lower than, or equal to the secret number. The
! player then uses this information to guess a new number.
! 
! As the player, an optimal strategy for the general case is to start by
! choosing the range's midpoint as the guess, and then asking whether the
! guess was higher, lower, or equal to the secret number. If the guess was
! too high, one would select the point exactly between the range midpoint
! and the beginning of the range. If the original guess was too low, one
! would ask about the point exactly between the range midpoint and the end
! of the range. This process repeats until one has reached the secret
! number.
! 
! Task:
! 
! Given the starting point of a range, the ending point of a range, and
! the "secret value", implement a binary search through a sorted integer
! array for a certain number. Implementations can be recursive or
! iterative (both if you can). Print out whether or not the number was in
! the array afterwards. If it was, print the index also.
! 
! There are several binary search algorithms commonly seen. They differ by
! how they treat multiple values equal to the given value, and whether
! they indicate whether the element was found or not. For completeness we
! will present pseudocode for all of them.
! 
! All of the following code examples use an "inclusive" upper bound (i.e.
! high = N-1 initially). Any of the examples can be converted into an
! equivalent example using "exclusive" upper bound (i.e. high = N
! initially) by making the following simple changes (which simply increase
! high by 1):
! 
! -   change high = N-1 to high = N
! -   change high = mid-1 to high = mid
! -   (for recursive algorithm) change if (high < low) to if (high <= low)
! -   (for iterative algorithm) change while (low <= high) to
!     while (low < high)
! 
! Traditional algorithm
! 
! The algorithms are as follows (from Wikipedia). The algorithms return
! the index of some element that equals the given value (if there are
! multiple such elements, it returns some arbitrary one). It is also
! possible, when the element is not found, to return the "insertion point"
! for it (the index that the value would have if it were inserted into the
! array).
! 
! Recursive Pseudocode:
! 
!   // initially called with low = 0, high = N-1
!   BinarySearch(A[0..N-1], value, low, high) {
!       // invariants: value > A[i] for all i < low
!                      value < A[i] for all i > high
!       if (high < low)
!           return not_found // value would be inserted at index "low"
!       mid = (low + high) / 2
!       if (A[mid] > value)
!           return BinarySearch(A, value, low, mid-1)
!       else if (A[mid] < value)
!           return BinarySearch(A, value, mid+1, high)
!       else
!           return mid
!   }
! 
! Iterative Pseudocode:
! 
!   BinarySearch(A[0..N-1], value) {
!       low = 0
!       high = N - 1
!       while (low <= high) {
!           // invariants: value > A[i] for all i < low
!                          value < A[i] for all i > high
!           mid = (low + high) / 2
!           if (A[mid] > value)
!               high = mid - 1
!           else if (A[mid] < value)
!               low = mid + 1
!           else
!               return mid
!       }
!       return not_found // value would be inserted at index "low"
!   }
! 
! Leftmost insertion point
! 
! The following algorithms return the leftmost place where the given
! element can be correctly inserted (and still maintain the sorted order).
! This is the lower (inclusive) bound of the range of elements that are
! equal to the given value (if any). Equivalently, this is the lowest
! index where the element is greater than or equal to the given value
! (since if it were any lower, it would violate the ordering), or 1 past
! the last index if such an element does not exist. This algorithm does
! not determine if the element is actually found. This algorithm only
! requires one comparison per level.
! 
! Recursive Pseudocode:
! 
!   // initially called with low = 0, high = N - 1
!   BinarySearch_Left(A[0..N-1], value, low, high) {
!       // invariants: value > A[i] for all i < low
!                      value <= A[i] for all i > high
!       if (high < low)
!           return low
!       mid = (low + high) / 2
!       if (A[mid] >= value)
!           return BinarySearch_Left(A, value, low, mid-1)
!       else
!           return BinarySearch_Left(A, value, mid+1, high)
!   }
! 
! Iterative Pseudocode:
! 
!   BinarySearch_Left(A[0..N-1], value) {
!       low = 0
!       high = N - 1
!       while (low <= high) {
!           // invariants: value > A[i] for all i < low
!                          value <= A[i] for all i > high
!           mid = (low + high) / 2
!           if (A[mid] >= value)
!               high = mid - 1
!           else
!               low = mid + 1
!       }
!       return low
!   }
! 
! Rightmost insertion point
! 
! The following algorithms return the rightmost place where the given
! element can be correctly inserted (and still maintain the sorted order).
! This is the upper (exclusive) bound of the range of elements that are
! equal to the given value (if any). Equivalently, this is the lowest
! index where the element is greater than the given value, or 1 past the
! last index if such an element does not exist. This algorithm does not
! determine if the element is actually found. This algorithm only requires
! one comparison per level. Note that these algorithms are almost exactly
! the same as the leftmost-insertion-point algorithms, except for how the
! inequality treats equal values.
! 
! Recursive Pseudocode:
! 
!   // initially called with low = 0, high = N - 1
!   BinarySearch_Right(A[0..N-1], value, low, high) {
!       // invariants: value >= A[i] for all i < low
!                      value < A[i] for all i > high
!       if (high < low)
!           return low
!       mid = (low + high) / 2
!       if (A[mid] > value)
!           return BinarySearch_Right(A, value, low, mid-1)
!       else
!           return BinarySearch_Right(A, value, mid+1, high)
!   }
! 
! Iterative Pseudocode:
! 
!   BinarySearch_Right(A[0..N-1], value) {
!       low = 0
!       high = N - 1
!       while (low <= high) {
!           // invariants: value >= A[i] for all i < low
!                          value < A[i] for all i > high
!           mid = (low + high) / 2
!           if (A[mid] > value)
!               high = mid - 1
!           else
!               low = mid + 1
!       }
!       return low
!   }
! 
! Extra credit
! 
! Make sure it does not have overflow bugs.
! 
! The line in the pseudo-code above to calculate the mean of two integers:
! 
!     mid = (low + high) / 2
! 
! could produce the wrong result in some programming languages when used
! with a bounded integer type, if the addition causes an overflow. (This
! can occur if the array size is greater than half the maximum integer
! value.) If signed integers are used, and low + high overflows, it
! becomes a negative number, and dividing by 2 will still result in a
! negative number. Indexing an array with a negative number could produce
! an out-of-bounds exception, or other undefined behavior. If unsigned
! integers are used, an overflow will result in losing the largest bit,
! which will produce the wrong result.
! 
! One way to fix it is to manually add half the range to the low number:
! 
!     mid = low + (high - low) / 2
! 
! Even though this is mathematically equivalent to the above, it is not
! susceptible to overflow.
! 
! Another way for signed integers, possibly faster, is the following:
! 
!     mid = (low + high) >>> 1
! 
! where >>> is the logical right shift operator. The reason why this works
! is that, for signed integers, even though it overflows, when viewed as
! an unsigned number, the value is still the correct sum. To divide an
! unsigned number by 2, simply do a logical right shift.
! 
! Related task:
! 
! -   -   Guess the number/With Feedback (Player)
! 
! See also:
! 
! -   -   wp:Binary search algorithm
!     -   Extra, Extra - Read All About It: Nearly All Binary Searches and
!         Mergesorts are Broken.

USING: binary-search kernel math.order ;

: binary-search ( seq elt -- index/f )
    [ [ <=> ] curry search ] keep = [ drop f ] unless ;
