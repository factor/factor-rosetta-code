! The Kolakoski sequence is an infinite sequence of natural numbers,
! (excluding zero); with the property that:
! 
!     if you form a new sequence from the counts of runs of the same
!     number in the first sequence, this new sequence is the same as the
!     first sequence.
! 
! Example:
! 
! This is not a Kolakoski sequence:
! 
!     1,1,2,2,2,1,2,2,1,2,...
! 
! Its sequence of run counts, (sometimes called a run length encoding,
! (RLE); but a true RLE also gives the character that each run encodes),
! is calculated like this:
! 
!     Starting from the leftmost number of the sequence we have 2 ones,
!     followed by 3 twos, then 1 ones, 2 twos, 1 one, ...
! 
! The above gives the RLE of:
! 
!     2, 3, 1, 2, 1, ...
! 
! The original sequence is different from its RLE in this case. It would
! be the same for a true Kolakoski sequence.
! 
! Creating a Kolakoski sequence:
! 
! Lets start with the two numbers (1, 2) that we will cycle through; i.e.
! they will be used in this order:
! 
! 1,2,1,2,1,2,....
! 
! 1.  We start the sequence s with the first item from the cycle c:
! 
! 1
! 
! 1.  An index, k, into the, (expanding), sequence will step, or index
!     through each item of the sequence s from the first, at its own rate.
! 
! We will arrange that the k'th item of s states how many times the last
! item of sshould appear at the end of s.
! 
! We started s with 1 and therefore s[k] states that it should appear only
! the 1 time.
! 
! 3.  Increment k
! 4.  Get the next item from c and append it to the end of sequence s. s
!     will then become:
!     1, 2
! 5.  k was moved to the second item in the list and s[k] states that it
!     should appear two times, so append another of the last item to the
!     sequence s:
!     1, 2,2
! 6.  Increment k
! 7.  Append the next item from the cycle to the list:
!     1, 2,2, 1
! 8.  k is now at the third item in the list that states that the last
!     item should appear twice so add another copy of the last item to the
!     sequence s:
!     1, 2,2, 1,1
! 9.  increment k
! 
! ...
! 
! Note that the RLE of 1, 2, 2, 1, 1, ... begins 1, 2, 2 which is the
! beginning of the original sequence. The generation algorithm ensures
! that this will always be the case.
! 
! Task:
! 
! 1.  Create a routine/proceedure/function/... that given an initial
!     ordered list/array/tuple etc of the natural numbers (1, 2), returns
!     the next number from the list when accessed in a cycle.
! 2.  Create another routine that when given the initial ordered list
!     (1, 2) and the minimum length of the sequence to generate; uses the
!     first routine and the algorithm above, to generate at least the
!     requested first members of the kolakoski sequence.
! 3.  Create a routine that when given a sequence, creates the run length
!     encoding of that sequence (as defined above) and returns the result
!     of checking if sequence starts with the exact members of its RLE.
!     (But note, due to sampling, do not compare the last member of the
!     RLE).
! 4.  Show, on this page, (compactly), the first 20 members of the
!     sequence generated from (1, 2)
! 5.  Check the sequence againt its RLE.
! 6.  Show, on this page, the first 20 members of the sequence generated
!     from (2, 1)
! 7.  Check the sequence againt its RLE.
! 8.  Show, on this page, the first 30 members of the Kolakoski sequence
!     generated from (1, 3, 1, 2)
! 9.  Check the sequence againt its RLE.
! 10. Show, on this page, the first 30 members of the Kolakoski sequence
!     generated from (1, 3, 2, 1)
! 11. Check the sequence againt its RLE.
! 
! (There are rules on generating Kolakoski sequences from this method that
! are broken by the last example)


