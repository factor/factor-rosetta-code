! The Normal (or Gaussian) distribution is a frequently used distribution
! in statistics. While most programming languages provide a uniformly
! distributed random number generator, one can derive normally distributed
! random numbers from a uniform generator.
! 
! The task:
! 
! 1.  Take a uniform random number generator and create a large (you
!     decide how large) set of numbers that follow a normal (Gaussian)
!     distribution. Calculate the dataset's mean and standard deviation,
!     and show a histogram of the data.
! 2.  Mention any native language support for the generation of normally
!     distributed random numbers.
! 
! Reference:
! 
! -   You may refer to code in Statistics/Basic if available.

USING: assocs formatting kernel math math.functions
math.statistics random sequences sorting ;

2,000,000 [ 0 1 normal-random-float ] replicate   ! make data set
dup [ mean ] [ population-std ] bi                ! calculate and show
"Mean: %f\nStdev: %f\n\n" printf                  ! mean and stddev

[ 10 * floor 10 / ] map                   ! map data to buckets
histogram >alist [ first ] sort-with      ! create histogram sorted by bucket (key)
dup values supremum                       ! find maximum count
[
    [ /f 100 * >integer ] keepd             ! how big should this histogram bar be?
    [ [ CHAR: * ] "" replicate-as ] dip     ! make the bar
    "% 5.2f: %s   %d\n" printf              ! print a line of the histogram
] curry assoc-each
