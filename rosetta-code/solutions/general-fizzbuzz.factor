! Task:
! 
! Write a generalized version of FizzBuzz that works for any list of
! factors, along with their words.
! 
! This is basically a "fizzbuzz" implementation where the user supplies
! the parameters.
! 
! The user will enter the max number, then they will enter the factors to
! be calculated along with the corresponding word to be printed.
! 
! For simplicity's sake, assume the user will input an integer as the max
! number and 3 factors, each with a word associated with them.
! 
! For example, given:
! 
!     >20      #This is the maximum number, supplied by the user
!     >3 Fizz  #The user now enters the starting factor (3) and the word they want associated with it (Fizz)
!     >5 Buzz  #The user now enters the next factor (5) and the word they want associated with it (Buzz)
!     >7 Baxx  #The user now enters the next factor (7) and the word they want associated with it (Baxx)
! 
! In other words: For this example, print the numbers 1 through 20,
! replacing every multiple of 3 with "Fizz", every multiple of 5 with
! "Buzz", and every multiple of 7 with "Baxx".
! 
! In the case where a number is a multiple of at least two factors, print
! each of the words associated with those factors in the order of least to
! greatest factor.
! 
! For instance, the number 15 is a multiple of both 3 and 5; print
! "FizzBuzz".
! 
! If the max number was 105 instead of 20, you would print "FizzBuzzBaxx"
! because it's a multiple of 3, 5, and 7.
! 
!     1
!     2
!     Fizz
!     4
!     Buzz
!     Fizz
!     Baxx
!     8
!     Fizz
!     Buzz
!     11
!     Fizz
!     13
!     Baxx
!     FizzBuzz
!     16
!     17
!     Fizz
!     19
!     Buzz
! 
! Category:Iteration Category:Recursion

USING: assocs combinators.extras io kernel math math.parser
math.ranges prettyprint sequences splitting ;
IN: rosetta-code.general-fizzbuzz

: prompt ( -- str ) ">" write readln ;

: get-factor ( -- seq )
    prompt " " split first2 [ string>number ] dip
    { } 2sequence ;

: get-input ( -- assoc n )
    prompt string>number [1,b] [ get-factor ] thrice
    { } 3sequence swap ;
    
: fizzbuzz ( assoc n -- )
    swap dupd [ drop swap mod 0 = ] with assoc-filter
    dup empty? [ drop . ] [ nip values concat print ] if ;
    
: main ( -- ) get-input [ fizzbuzz ] with each ;

MAIN: main
