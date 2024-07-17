! Primes are prime no matter which base they are expressed in. Some
! numeric strings are prime in a large number of bases. (Not the same
! prime, but a prime.)
! 
! For example
! 
! The numeric string "255", while obviously not a prime in base 10, is a
! prime in bases:
! 
!      6   8  12  14  18  24  26  32  36  38  72  84  86  92  96 102 104 108 128 134
!    138 144 158 164 188 216 224 236 242 246 252 254 264 272 294 318 332 344 348 368
!    374 392 396 408 428 432 446 456 468 476 482 512 522 528 542 546 552 566 572 576
!    578 594 596 602 606 614 618 626 654 702 714 722 728 756 762 774 776 788 806 816
!    818 822 828 836 848 864 866 872 882 888 902 908 912 918 924 932 936 942 944 956
!    966 986 998
! 
! among others.
! 
! There are numeric strings however, that are not a prime in any base.
! Confining ourselves to 'decimal' numeric strings; the single digit
! numeric primes are prime in every base where they are a valid number.
! 
! E.G.
! 
! The numeric string "2" is a prime in every base except base 2, where it
! is invalid.
! 
! The numeric string "3" is a prime in every base except base 2 and 3,
! where it is invalid.
! 
! "4" is not a prime in every base except bases 2, 3, and 4 where it is an
! invalid number (and hence not a prime there either.)
! 
! In general, even pan-base non-primes are much more prevalent than odd,
! though both are fairly common.
! 
! With the exception of "10", numeric strings that end in 0 are composite
! in every base where they are valid.
! 
! Numeric strings where the greatest common divisor of all of the digits
! is more than 1 are composite in every base.
! 
! If a "decimal" numeric string N is composite in every base up to base N,
! it is composite in every base.
! 
! The digit 1 is an odd-ball case as it is neither prime nor composite. It
! typically is not included, but due to the ambiguous wording, would not
! be wrong if it is.
! 
! Task
! 
! -   Find and display, here on this page, the first 40 pan-base non-prime
!     "base 10" numeric strings.
! -   Find and display, here on this page, the first 20 odd pan-base
!     non-prime "base 10" numeric strings.
! -   Find and display the count of pan-base non-prime "base 10" numeric
!     strings up to at least the numeric string "1000".
! -   What percentage of them are odd / even?
! 
! See also
! 
! *; OEIS A121719 - Strings of digits which are composite regardless of
! the base in which they are interpreted. Exclude bases in which numbers
! are not interpretable.


