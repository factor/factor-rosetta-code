! The sequences are named after the Dutch mathematician Nicolaas Govert de
! Bruijn.
! 
! A note on Dutch capitalization: Nicolaas' last name is de Bruijn, the de
! isn't normally capitalized unless it's the first word in a sentence.
! Rosetta Code (more or less by default or by fiat) requires the first
! word in the task name to be capitalized.
! 
! In combinatorial mathematics, a de Bruijn sequence of order n on a
! size-k alphabet (computer science) A is a cyclic sequence in which every
! possible length-n string (computer science, formal theory) on A occurs
! exactly once as a contiguous substring.
! 
! Such a sequence is denoted by B(k, n) and has length k^(n), which is
! also the number of distinct substrings of length n on A;
! 
! de Bruijn sequences are therefore optimally short.
! 
! There are:
! 
!                          (k!)^(k^((n-1)))  ÷  k^(n)
! 
! distinct de Bruijn sequences B(k, n).
! 
! Task:
! 
! For this Rosetta Code task, a de Bruijn sequence is to be generated that
! can be used to shorten a brute-force attack on a PIN-like code lock that
! does not have an "enter" key and accepts the last n digits entered.
! 
! Note: automated teller machines (ATMs) used to work like this, but their
! software has been updated to not allow a brute-force attack.
! 
! Example:
! 
! A digital door lock with a 4-digit code would have B (10,4) solutions,
! with a length of 10,000 (digits).
! 
! Therefore, only at most 10,000 + 3 (as the solutions are cyclic or
! wrap-around) presses are needed to open the lock.
! 
! Trying all 4-digit codes separately would require 4 × 10,000 or 40,000
! presses.
! 
! Task requirements:
! 
! -   -   Generate a de Bruijn sequence for a 4-digit (decimal) PIN code.
!         -   -   Show the length of the generated de Bruijn sequence.
!             -   (There are many possible de Bruijn sequences that solve
!                 this task, one solution is shown on the discussion
!                 page).
!             -   Show the first and last 130 digits of the de Bruijn
!                 sequence.
!     -   Verify that all four-digit (decimal) 1,000 PIN codes are
!         contained within the de Bruijn sequence.
!         -   -   0000, 0001, 0002, 0003, ... 9996, 9997, 9998, 9999 (note
!                 the leading zeros).
!     -   Reverse the de Bruijn sequence.
!     -   Again, perform the (above) verification test.
!     -   Replace the 4,444^(th) digit with a period (.) in the original
!         de Bruijn sequence.
!         -   -   Perform the verification test (again). There should be
!                 four PIN codes missing.
! 
! (The last requirement is to ensure that the verification tests performs
! correctly. The verification processes should list any and all missing
! PIN codes.)
! 
! Show all output here, on this page.
! 
! References:
! 
! -   -   Wikipedia entry: de Bruijn sequence.
!     -   MathWorld entry: de Bruijn sequence.
!     -   An OEIS entry: A166315 lexicographically earliest binary de
!         Bruijn sequences, B(2,n) --- Not B(10,4), but possibly relevant.


