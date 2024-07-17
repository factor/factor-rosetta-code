! Introduction
! 
! Jeff Tupper, in his 2001 paper "Reliable Two-Dimensional Graphing
! Methods for Mathematical Formulae with Two Free Variables", shows a set
! of methods to graph equations and inequalities with two variables in the
! cartesian plane.
! 
! One of the examples of the paper, refers to the inequality:
! 
! $\frac{1}{2} < \left\lfloor \mathrm{mod}\left(\left\lfloor \frac{y}{17} \right\rfloor 2^{-17 \lfloor x \rfloor - \mathrm{mod}\left(\lfloor y\rfloor, 17\right)},2\right)\right\rfloor$
! 
! That inequality, once plotted in the range 0 ≤ x ≤ 106 and k ≤ y ≤ k +
! 17 for k = 960, 939, 379, 918, 958, 884, 971, 672, 962, 127, 852, 754,
! 715, 004, 339, 660, 129, 306, 651, 505, 519, 271, 702, 802, 395, 266,
! 424, 689, 642, 842, 174, 350, 718, 121, 267, 153, 782, 770, 623, 355,
! 993, 237, 280, 874, 144, 307, 891, 325, 963, 941, 337, 723, 487, 857,
! 735, 749, 823, 926, 629, 715, 517, 173, 716, 995, 165, 232, 890, 538,
! 221, 612, 403, 238, 855, 866, 184, 013, 235, 585, 136, 048, 828, 693,
! 337, 902, 491, 454, 229, 288, 667, 081, 096, 184, 496, 091, 705, 183,
! 454, 067, 827, 731, 551, 705, 405, 381, 627, 380, 967, 602, 565, 625,
! 016, 981, 482, 083, 418, 783, 163, 849, 115, 590, 225, 610, 003, 652,
! 351, 370, 343, 874, 461, 848, 378, 737, 238, 198, 224, 849, 863, 465,
! 033, 159, 410, 054, 974, 700, 593, 138, 339, 226, 497, 249, 461, 751,
! 545, 728, 366, 702, 369, 745, 461, 014, 655, 997, 933, 798, 537, 483,
! 143, 786, 841, 806, 593, 422, 227, 898, 388, 722, 980, 000, 748, 404,
! 719 produces a drawing that visually mimics the inequality itself, hence
! it is called self-referential.
! 
! Although the inequality is intended to be drawn on the continuum of the
! cartesian plane, the drawing can be performed iterating over the integer
! values of both the horizontal and vertical ranges.
! 
! Task
! 
! Make a drawing of the Tupper's formula, either using text, a matrix or
! creating an image.
! 
! This task requires arbitrary precision integer operations. If your
! language does not intrinsically support that, you can use a library.
! 
! Epilogue
! 
! The value of k is an encoding of the bitmap of the image, therefore any
! 17-width bitmap can be produced, using its associated encoded value as
! k.
! 
! References
! 
! -   -   Wikipedia: Tupper's self-referential formula
!     -   Tupper, Jeff. "Reliable Two-Dimensional Graphing Methods for
!         Mathematical Formulae with Two Free Variables"


