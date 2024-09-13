! Almkvist Berndt 1988 begins with an investigation of why the agm is such
! an efficient algorithm, and proves that it converges quadratically. This
! is an efficient method to calculate π.
! 
! With the same notations used in Arithmetic-geometric mean, we can
! summarize the paper by writing:
! 
! $\pi =
! \frac{4\; \mathrm{agm}(1, 1/\sqrt{2})^2}
! {1 - \sum\limits_{n=1}^{\infty} 2^{n+1}(a_n^2-g_n^2)}$
! 
! This allows you to make the approximation, for any large N:
! 
! $\pi \approx
! \frac{4\; a_N^2}
! {1 - \sum\limits_{k=1}^N 2^{k+1}(a_k^2-g_k^2)}$
! 
! The purpose of this task is to demonstrate how to use this approximation
! in order to compute a large number of decimals of π.
! 
! Category:Geometry


