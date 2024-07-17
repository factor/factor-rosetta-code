! In mathematics, a Fermat number, named after Pierre de Fermat who first
! studied them, is a positive integer of the form F_(n) = 2^(2^(n)) + 1
! where n is a non-negative integer.
! 
! Despite the simplicity of generating Fermat numbers, they have some
! powerful mathematical properties and are extensively used in
! cryptography & pseudo-random number generation, and are often linked to
! other number theoric fields.
! 
! As of this writing, (mid 2019), there are only five known prime Fermat
! numbers, the first five (F₀ through F₄). Only the first twelve Fermat
! numbers have been completely factored, though many have been partially
! factored.
! 
! Task:
! 
! -   -   Write a routine (function, procedure, whatever) to generate
!         Fermat numbers.
! 
! -   -   Use the routine to find and display here, on this page, the
!         first 10 Fermat numbers - F₀ through F₉.
! 
! -   -   Find and display here, on this page, the prime factors of as
!         many Fermat numbers as you have patience for. (Or as many as can
!         be found in five minutes or less of processing time). Note: if
!         you make it past F₁₁, there may be money, and certainly will be
!         acclaim in it for you.
! 
! See also:
! 
! -   -   Wikipedia - Fermat numbers
!     -   OEIS:A000215 - Fermat numbers
!     -   OEIS:A019434 - Fermat primes

USING: formatting io kernel lists lists.lazy math math.functions
math.primes.factors sequences ;

: lfermats ( -- list )
    0 lfrom [ [ 1 2 2 ] dip ^ ^ + ] lmap-lazy ;

CHAR: ₀ 10 lfermats ltake list>array [
    "First 10 Fermat numbers:" print 
    [ dupd "F%c = %d\n" printf 1 + ] each drop nl
] [
    "Factors of first few Fermat numbers:" print [
        dupd factors dup length 1 = " (prime)" "" ?
        "Factors of F%c: %[%d, %]%s\n" printf 1 +
    ] each drop
] 2bi
