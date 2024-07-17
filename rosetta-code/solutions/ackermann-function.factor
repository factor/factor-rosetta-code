! The Ackermann function is a classic example of a recursive function,
! notable especially because it is not a primitive recursive function. It
! grows very quickly in value, as does the size of its call tree.
! 
! The Ackermann function is usually defined as follows:
! 
! $$A(m, n) =
!  \begin{cases}
!  n+1 & \mbox{if } m = 0 \\
!  A(m-1, 1) & \mbox{if } m > 0 \mbox{ and } n = 0 \\
!  A(m-1, A(m, n-1)) & \mbox{if } m > 0 \mbox{ and } n > 0.
!  \end{cases}$$
! 
! Its arguments are never negative and it always terminates.
! 
! Task:
! 
! Write a function which returns the value of A(m, n). Arbitrary precision
! is preferred (since the function grows so quickly), but not required.
! 
! See also:
! 
! -   Conway chained arrow notation for the Ackermann function.
! 
! Category:Memoization Category:Classic CS problems and programs

USING: kernel math locals combinators ;
IN: ackermann

:: ackermann ( m n -- u ) 
    { 
        { [ m 0 = ] [ n 1 + ] } 
        { [ n 0 = ] [ m 1 - 1 ackermann ] } 
        [ m 1 - m n 1 - ackermann ackermann ] 
    } cond ;
