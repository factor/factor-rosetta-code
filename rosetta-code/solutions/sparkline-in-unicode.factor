! A sparkline is a graph of successive values laid out horizontally where
! the height of the line is proportional to the values in succession.
! 
! Task:
! 
! Use the following series of Unicode characters to create a program that
! takes a series of numbers separated by one or more whitespace or comma
! characters and generates a sparkline-type bar graph of the values on a
! single line of output.
! 
! The eight characters: '▁▂▃▄▅▆▇█'
! 
! (Unicode values U+2581 through U+2588).
! 
! Use your program to show sparklines for the following input, here on
! this page:
! 
! 1.  1 2 3 4 5 6 7 8 7 6 5 4 3 2 1
! 2.  1.5, 0.5 3.5, 2.5 5.5, 4.5 7.5, 6.5
! 
!     (note the mix of separators in this second case)!
! 
! Notes:
! 
! -   A space is not part of the generated sparkline.
! -   The sparkline may be accompanied by simple statistics of the data
!     such as its range.
! -   A suggestion emerging in later discussion (see Discussion page) is
!     that the bounds between bins should ideally be set to yield the
!     following results for two particular edge cases:
! 
!     
! 
!         "0, 1, 19, 20" -> ▁▁██
!         (Aiming to use just two spark levels)
! 
!     
! 
!         "0, 999, 4000, 4999, 7000, 7999" -> ▁▁▅▅██
!         (Aiming to use just three spark levels)
! 
!     
! 
!         It may be helpful to include these cases in output tests.
! 
! -   You may find that the unicode sparklines on this page are rendered
!     less noisily by Google Chrome than by Firefox or Safari.

USING: formatting kernel math math.order math.parser
math.statistics sequences splitting ;

: sparkline-index ( v min max -- i )
    [ drop - 8 * ] [ swap - /i ] 2bi 0 7 clamp 9601 + ;

: (sparkline) ( seq -- new-seq )
    dup minmax [ sparkline-index ] 2curry "" map-as ;

: sparkline ( str -- new-str )
    ", " split harvest [ string>number ] map (sparkline) ;

{
    "1 2 3 4 5 6 7 8 7 6 5 4 3 2 1"
    "1.5, 0.5 3.5, 2.5 5.5, 4.5 7.5, 6.5"
    "0, 1, 19, 20"
    "0, 999, 4000, 4999, 7000, 7999"
} [ dup sparkline "%u -> %s\n" printf ] each
