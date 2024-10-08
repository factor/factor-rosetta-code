! Task:
! 
! In the Church encoding of natural numbers, the number N is encoded by a
! function that applies its first argument N times to its second argument.
! 
! -   Church zero always returns the identity function, regardless of its
!     first argument. In other words, the first argument is not applied to
!     the second argument at all.
! -   Church one applies its first argument f just once to its second
!     argument x, yielding f(x)
! -   Church two applies its first argument f twice to its second argument
!     x, yielding f(f(x))
! -   and each successive Church numeral applies its first argument one
!     additional time to its second argument, f(f(f(x))), f(f(f(f(x))))
!     ... The Church numeral 4, for example, returns a quadruple
!     composition of the function supplied as its first argument.
! 
! Arithmetic operations on natural numbers can be similarly represented as
! functions on Church numerals.
! 
! In your language define:
! 
! -   Church Zero,
! -   a Church successor function (a function on a Church numeral which
!     returns the next Church numeral in the series),
! -   functions for Addition, Multiplication and Exponentiation over
!     Church numerals,
! -   a function to convert integers to corresponding Church numerals,
! -   and a function to convert Church numerals to corresponding integers.
! 
! You should:
! 
! -   Derive Church numerals three and four in terms of Church zero and a
!     Church successor function.
! -   use Church numeral arithmetic to obtain the the sum and the product
!     of Church 3 and Church 4,
! -   similarly obtain 4^3 and 3^4 in terms of Church numerals, using a
!     Church numeral exponentiation function,
! -   convert each result back to an integer, and return it or print it to
!     the console.


