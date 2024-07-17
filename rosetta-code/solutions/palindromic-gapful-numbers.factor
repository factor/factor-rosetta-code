! For this task, a number is to be understood as a positive integer
! expressed in base ten, and a palindromic number is one that is equal to
! the integer formed by reversing its decimal digits.
! 
! A number that is evenly divisible by the number formed by concatenating
! its first and last digits in that order is known as a gapful number. All
! one─ and two─digit numbers have this property and accordingly only
! numbers greater than or equal to 100 should be considered for this
! Rosetta Code task.
! 
! (Evenly divisible here means divisible with no remainder.)
! 
! Example:
! 
! 1037 is a gapful number because it is evenly divisible by the number 17
! which is formed by the first and last decimal digits of 1037.
! 
! Task:
! 
! -   -   Show (nine sets) the first 20 palindromic gapful numbers that
!         end with:
!         -   -   the digit 1
!             -   the digit 2
!             -   the digit 3
!             -   the digit 4
!             -   the digit 5
!             -   the digit 6
!             -   the digit 7
!             -   the digit 8
!             -   the digit 9
!     -   Show (nine sets, like above) of palindromic gapful numbers:
!         -   -   the last 15 palindromic gapful numbers (out of 100)
!             -   the last 10 palindromic gapful numbers (out of 1,000)
!                 {optional}
! 
! For other ways of expressing the (above) requirements, see the
! discussion page.
! 
! Note:
! 
! All palindromic gapful numbers are divisible by eleven.
! 
! Related tasks:
! 
! -   -   palindrome detection.
!     -   gapful numbers.
! 
! Also see:
! 
! -   -   The OEIS entry: A108343 gapful numbers.

USING: formatting fry io kernel lists lists.lazy locals math
math.functions math.ranges math.text.utils prettyprint sequences ;
IN: rosetta-code.palindromic-gapful-numbers

! Palindromic numbers are relatively rare compared to gapful
! numbers, so our strategy for finding palindromic gapful
! numbers is to filter gapful numbers from palindromic numbers.

! Palindromic numbers can be generated directly rather than
! filtered or identified from the natural numbers. This is a
! significant speedup since palindromic numbers are relatively
! rare in the natural numbers.

! Here I have used a generation method similar to
! https://www.geeksforgeeks.org/generate-palindromic-numbers-less-n/

! Create a palindrome from its base natural number.
! e.g.  321 t -> 32123
!       321 f -> 321123
: create-palindrome ( n odd? -- m )
    dupd [ 10 /i ] when swap [ over 0 > ]
    [ 10 * [ 10 /mod ] [ + ] bi* ] while nip ;

! Create an infinite lazy list of palindromic numbers starting
! at 100.
: palindromes ( -- l )
    1 lfrom [
        10 swap ^ dup 10 * [a,b)
        [ [ t create-palindrome ] map ]
        [ [ f create-palindrome ] map ] bi
        [ sequence>list ] bi@ lappend
    ] lmap-lazy lconcat ;

! Is an integer gapful?
: gapful? ( n -- ? )
    dup 1 digit-groups [ first ] [ last 10 * + ] bi divisor? ;

! Create an infinite lazy list of gapful palindromes.
: gapful-palindromes ( -- l ) palindromes [ gapful? ] lfilter ;

:: show-palindromic-gapfuls ( last of -- )
    gapful-palindromes :> nums
    last of
    "~~==[ Last  %d  of  %d  palindromic gapful numbers starting at 100 ]==~~\n"
    printf 9 [1,b] [| d |
        of nums [ 10 mod d = ] lfilter ltake list>array
        last tail* d pprint ": " write [ pprint bl ] each nl
    ] each nl ;

20 20    ! part 1
15 100   ! part 2
10 1000  ! part 3  (Optional)
[ show-palindromic-gapfuls ] 2tri@
