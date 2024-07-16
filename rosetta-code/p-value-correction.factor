! Given a list of p-values, adjust the p-values for multiple comparisons.
! This is done in order to control the false positive, or Type 1 error
! rate.
! 
! This is also known as the "false discovery rate" (FDR). After
! adjustment, the p-values will be higher but still inside [0,1].
! 
! The adjusted p-values are sometimes called "q-values".
! 
! Task:
! 
! Given one list of p-values, return the p-values correcting for multiple
! comparisons
! 
!    p = {4.533744e-01, 7.296024e-01, 9.936026e-02, 9.079658e-02, 1.801962e-01,
!         8.752257e-01, 2.922222e-01, 9.115421e-01, 4.355806e-01, 5.324867e-01,
!         4.926798e-01, 5.802978e-01, 3.485442e-01, 7.883130e-01, 2.729308e-01,
!         8.502518e-01, 4.268138e-01, 6.442008e-01, 3.030266e-01, 5.001555e-02,
!         3.194810e-01, 7.892933e-01, 9.991834e-01, 1.745691e-01, 9.037516e-01,
!         1.198578e-01, 3.966083e-01, 1.403837e-02, 7.328671e-01, 6.793476e-02,
!         4.040730e-03, 3.033349e-04, 1.125147e-02, 2.375072e-02, 5.818542e-04,
!         3.075482e-04, 8.251272e-03, 1.356534e-03, 1.360696e-02, 3.764588e-04,
!         1.801145e-05, 2.504456e-07, 3.310253e-02, 9.427839e-03, 8.791153e-04,
!         2.177831e-04, 9.693054e-04, 6.610250e-05, 2.900813e-02, 5.735490e-03}
! 
! There are several methods to do this, see:
! 
! -   Yoav Benjamini, Yosef Hochberg "Controlling the False Discovery
!     Rate: A Practical and Powerful Approach to Multiple Testing",
!     Journal of the Royal Statistical Society. Series B, Vol. 57, No. 1
!     (1995), pp. 289-300, JSTOR:2346101
! -   Yoav Benjamini, Daniel Yekutieli, "The control of the false
!     discovery rate in multiple testing under dependency", Ann. Statist.,
!     Vol. 29, No. 4 (2001), pp. 1165-1188,
!     DOI:%5Bhttps://doi.org/10.1214/aos/1013699998
!     10.1214/aos/1013699998] JSTOR:2674075
! -   Sture Holm, "A Simple Sequentially Rejective Multiple Test
!     Procedure", Scandinavian Journal of Statistics, Vol. 6, No. 2
!     (1979), pp. 65-70, JSTOR:4615733
! -   Yosef Hochberg, "A sharper Bonferroni procedure for multiple tests
!     of significance", Biometrika, Vol. 75, No. 4 (1988), pp 800–802,
!     DOI:%5Bhttps://doi.org/10.1093/biomet/75.4.800
!     10.1093/biomet/75.4.800] JSTOR:2336325
! -   Gerhard Hommel, "A stagewise rejective multiple test procedure based
!     on a modified Bonferroni test", Biometrika, Vol. 75, No. 2 (1988),
!     pp 383–386, DOI:%5Bhttps://doi.org/10.1093/biomet/75.2.383
!     10.1093/biomet/75.2.383] JSTOR:2336190
! 
! Each method has its own advantages and disadvantages.

