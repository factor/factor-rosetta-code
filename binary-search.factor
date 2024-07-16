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
! This is the lower (inclusive) bound of 

USING: binary-search kernel math.order ;

: binary-search ( seq elt -- index/f )
    [ [ <=> ] curry search ] keep = [ drop f ] unless ;
