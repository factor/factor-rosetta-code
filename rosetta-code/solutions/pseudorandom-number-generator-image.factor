! Task:
! 
! Write a program that creates an image from a Pseudorandom Number
! Generator (PRNG) algorithm's output. The image can have the following
! dimensions:
! 
! ::# 250px by 250px : If the algorithm requires the use of prime numbers,
! use 8-15 bit primes.
! 
! ::# 500px by 500px : If the algorithm requires the use of prime numbers,
! use 8-15 bit primes.
! 
! ::# 1000px by 1000px : If the algorithm requires the use of prime
! numbers, use 8-32 bit primes.
! 
! ::# 1500px by 1500px : If the algorithm requires the use of prime
! numbers, use 16-64 bit primes.
! 
! Possible Output:
! 
! https://www.random.org/analysis/randbitmap-rdo.png
! 
! https://ibb.co/ZJPS16j
! 
! See also:
! 
! -   Blum Blum Shub 1.
! -   Blum-Micali Algorithm: 2.
! -   Linear congruential generator 3.

USING: accessors images.testing images.viewer literals math
random sequences ;

CONSTANT: size 500

<rgb-image>
  ${ size size } >>dim
  size sq 3 * [ 256 random ] B{ } replicate-as >>bitmap
image-window
