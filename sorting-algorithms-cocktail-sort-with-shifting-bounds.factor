! The cocktail sort is an improvement on the Bubble Sort.
! 
! A cocktail sort is also known as:
! 
! -   -   cocktail shaker sort
!     -   happy hour sort
!     -   bidirectional bubble sort
!     -   a bubble sort variation
!     -   a selection sort variation
!     -   ripple sort
!     -   shuffle sort
!     -   shuttle sort
! 
! The improvement is basically that values "bubble" (migrate) both
! directions through the array, because on each iteration the cocktail
! sort bubble sorts once forwards and once backwards.
! 
! After ii passes, the first ii and the last ii elements in the array are
! in their correct positions, and don't have to be checked (again).
! 
! By shortening the part of the array that is sorted each time, the number
! of comparisons can be halved.
! 
! Pseudocode for the 2^(nd) algorithm (from Wikipedia) with an added
! comment and changed indentations:
! 
!     function A = cocktailShakerSort(A)
!     % `beginIdx` and `endIdx` marks the first and last index to check.
!     beginIdx = 1;
!     endIdx = length(A) - 1;
! 
!         while beginIdx <= endIdx
!         newBeginIdx = endIdx;
!         newEndIdx = beginIdx;
!             for ii = beginIdx:endIdx
!                 if A(ii) > A(ii + 1)
!                     [A(ii+1), A(ii)] = deal(A(ii), A(ii+1));
!                     newEndIdx = ii;
!                 end
!             end
! 
!         % decreases `endIdx` because the elements after `newEndIdx` are in correct order
!         endIdx = newEndIdx - 1;
! 
!         % (FOR  (below)  decrements the  II  index by -1.
! 
!             for ii = endIdx:-1:beginIdx
!                 if A(ii) > A(ii + 1)
!                     [A(ii+1), A(ii)] = deal(A(ii), A(ii+1));
!                     newBeginIdx = ii;
!                 end
!             end
! 
!         % increases `beginIdx` because the elements before `newBeginIdx` are in correct order.
!         beginIdx = newBeginIdx + 1;
!         end
!     end
! 
! % indicates a comment, and deal indicates a swap.
! 
! Task:
! 
! Implement a cocktail sort and optionally show the sorted output here on
! this page.
! 
! See the discussion page for some timing comparisons.
! 
! Related task:
! 
! -   -   cocktail sort
! 
! Category:Sorting

