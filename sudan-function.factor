! The Sudan function is a classic example of a recursive function, notable
! especially because it is not a primitive recursive function. This is
! also true of the better-known Ackermann function. The Sudan function was
! the first function having this property to be published.
! 
! The Sudan function is usually defined as follows (svg):
! 
! $\begin{array}{lll}
!       F_0 (x, y) & = x+y \\
!       F_{n+1} (x, 0) & = x & \text{if } n \ge 0 \\
!       F_{n+1} (x, y+1) & = F_n (F_{n+1} (x, y), F_{n+1} (x, y) + y + 1) & \text{if } n\ge 0 \\
!       \end{array}$
! 
! Task:
! 
! Write a function which returns the value of F(x, y).

USING: combinators kernel locals math prettyprint ;

:: sudan ( n x y -- z )
    {
        { [ n zero? ] [ x y + ] }
        { [ y zero? ] [ x ] }
        [ n 1 - n x y 1 - sudan dup y + sudan ]
    } cond ;
