! Two functions are said to be mutually recursive if the first calls the
! second, and in turn the second calls the first.
! 
! Write two mutually recursive functions that compute members of the
! Hofstadter Female and Male sequences defined as:
! 
! $$\begin{align}
! F(0)&=1\ ;\ M(0)=0 \\
! F(n)&=n-M(F(n-1)), \quad n>0 \\
! M(n)&=n-F(M(n-1)), \quad n>0.
! \end{align}$$
! 
! (If a language does not allow for a solution using mutually recursive
! functions then state this rather than give a solution by other means).


