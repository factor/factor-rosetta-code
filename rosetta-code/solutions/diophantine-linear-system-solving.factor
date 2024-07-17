! task.
! 
! Implement the Havas-Majewski-Matthews LLL-based Hermite normal form
! algorithm for solving linear Diophantine systems.
! 
! clarification.
! 
! The point of this task is not comprehending the puzzles, it is
! implementing the LLLHnf algorithm.
! 
! The method is the result of an experimental refinement process over many
! iterations, terse to the point of being impenetrable, best copied
! verbatim from a reliable source, and hence this task mostly concerns the
! direct translation of existing (cryptic) code.
! 
! You may regard the test set as just random input to validate your
! solution, no need to delve any deeper. But to make the task a little
! nicer, and of course to demonstrate the power of the algorithm, the
! examples aren't really random.
! Many are classics, with online resources abound. Others are on Rosetta
! Code in a different guise; some are copied from the HMM paper. Section
! headers like 'base cases' or 'polynomial coefficients' should be
! self-explanatory.
! The output is deliberately left somewhat 'raw', so there's plenty of
! room for implementation dependent refinement. Also, to solve this task
! you're not obliged to click any wiki-links, but please do if you want
! some background information.
! 
! context.
! 
! Solving a system of linear Diophantine equations (i.e., solutions are
! required to be whole numbers) is a classic mathematical problem: given a
! coefficient matrix A (usually with less rows than columns) and vectorb,
! the goal is to find a preferably small integer vector x that satisfies
! A·x=b.
! 
! How is this task different from Gaussian elimination? We now need a
! triangularization method that doesn't introduce fractions. The LLLHnf
! algorithm adapts Lenstra-Lenstra-Lovász lattice basis reduction to put
! the transpose of the input system into Hermite normal form, the integer
! analogue of the usual reduced row echelon form. In the process a
! unimodular transformation matrix is constructed from which (if either
! exists) minus the solution vector x and/or the null space basis for A
! can be immediately read off. These vectors are typically of small
! Euclidean length.
! 
! All details are found in the 1998 journal article. The relevant
! pseudocode (Algorithm 4) is on pages 131 and 129.
! 
! use.
! 
! LLLHnf is a versatile algorithm that will
! ▹find integer solutions for (nonsquare) linear systems
! ▹put integer matrices into Hermite normal form
! ▹invert unimodular integer matrices
! ▹compute modular inverses
! ▹solve Bézout's identity
! ▹solve Chinese remaindering problems
! (not necessarily with pairwise coprime moduli)
! ▹solve the famous Coconut puzzle
! ▹give hints for packing your knapsack
! ▹find solutions of small norm for extended gcd problems
! ▹find a univariate polynomial for a given (complex) algebraic constant
! In all cases: provided a solution exists.
! 
! LLLHnf puts the transpose of A into Hermite normal form, so to compute
! Hnf(A) one inputs A^(T).
! 
! The program rejects fractional matrix coefficients. Users will scale
! applicable rows to suitably sized integers.
! 
! limitation.
! 
! The output may be wrong if the (Gram-Schmidt) calculations produce
! numbers too big to be representable as integers (-larger than 2⁵³ if
! values are stored in 64-bit floats), though there is some tolerance.
! 
! input.
! 
! (Piped to FreeBasic stdin in this format:)
! m : #rows
! n : #columns
! m x n coefficient matrix A (augmented with m-vector b).
! 
! 'a comment line starts with an apostrophe and contains no commas.
! 2
! 3
!  2 1 4| 17
! -5 2 6|-13
! 
! To search for polynomial coefficients, follow a comment line containing
! the tag "const" with:
! m : #digits precision
! n : max. poly degree
! a + b : real and imaginary parts of a complex constant.
! 
! 'constant sqrt(1 + sqrt(3)*i)
! 4
! 4
! 1.22474487 + .707106781
! 
! To quit:
! 
! 0
! 0
! 
!     'five base cases
!     'no integral solution
!     2
!     2
!      2 0| 1
!      2 1| 2
!     'indeterminate
!     2
!     3
!      1  3  5
!      4  6  8
!     'singular square
!     3
!     3
!      1  7  4
!      2  8  5
!      3  9  6
!     'overdetermined
!     3
!     2
!      2  1| 2
!      6  5| 2
!      7  6| 2
!     'square
!     3
!     3
!      2 -3  4| 9
!      5  6  7| 3
!      8  9 10| 3
!     'modular inverse
!     '(the smallest solution is negative
!     ' add the modulus to make positive)
!     1
!     2
!      42 -2017| 1
!     'a classic Indian kuttaka problem
!     1
!     2
!      195 -221| 65
!     'Bachet de Méziriac "personnes en un banquet"
!     '(add null space vector to make positive men)
!     2
!     3
!       1 1 1| 41
!      12 9 1|120
!     'Malm
!     2
!     4
!        1   1   1   1|    80
!      165 235  85 389| 16324
!     'from the Sunzi Suanjing
!     3
!     4
!      1 3 0 0| 2
!      1 0 5 0| 3
!      1 0 0 7| 2
!     2
!     3
!      17 7  0|-1
!      11 0 15|-2
!     'from the Shushu jiuzhang
!     8
!     9
!      1 130   0   0   0   0   0   0   0|-60
!      1   0 110   0   0   0   0   0   0|-30
!      1   0   0 120   0   0   0   0   0|-10
!      1   0   0   0  60   0   0   0   0|-10
!      1   0   0   0   0  25   0   0   0| 10
!      1   0   0   0   0   0 100   0   0| 10
!      1   0   0   0   0   0   0  50   0| 10
!      1   0   0   0   0   0   0   0  20| 10
!     '5 sailor coconut puzzle
!     6
!     7
!      1 -5  0  0  0  0  0| 1
!      0  4 -5  0  0  0  0| 1
!      0  0  4 -5  0  0  0| 1
!      0  0  0  4 -5  0  0| 1
!      0  0  0  0  4 -5  0| 1
!      0  0  0  0  0  4 -5| 0
!     'unbounded knapsack with slack
!     3
!     6
!      3000 1800 2500 1 0 0|54500
!         3    2   20 0 1 0|  250
!        25   15    2 0 0 1|  250
!     'subset sum problem
!     1
!     9
!      575 436 1586 1030 1921 569 721 1183 1570| 6665
!     'HMM extended gcd (example 7.2)
!      1
!     10
!      763836 1066557 113192 1785102 1470060 3077752 114793 3126753 1997137 2603018| 1
!     'Fibonacci segment F7...F14 (example 7.3)
!     1
!     8
!      13 21 34 55 89 144 233 377| 1
!     'compute the inverse of transpose(P)
!     '(Fibonacci morphs into Lucas)
!     8
!     8
!      1  0  0  0  0  0  18 -7
!      1  1  0  0  0  0 -11  4
!     -1  1  1  0  0  0   7 -3
!      0 -1  1  1  0  0  -4  1
!      0  0 -1  1  1  0   3 -1
!      0  0  0 -1  1  1  -1  1
!      0  0  0  0 -1  1   1  0
!      0  0  0  0  0 -1  -1  0
!     'Hnf(A) with Aij = i^3 * j^2 + i + j (example 7.4)
!     10
!     10
!       3  11   31   69   131   223   351   521   739   1011
!       7  36  113  262   507   872  1381  2058  2927   4012
!      13  77  249  583  1133  1953  3097  4619  6573   9013
!      21 134  439 1032  2009  3466  5499  8204 11677  16014
!      31 207  683 1609  3135  5411  8587 12813 18239  25015
!      43 296  981 2314  4511  7788 12361 18446 26259  36016
!      57 401 1333 3147  6137 10597 16821 25103 35737  49017
!      73 522 1739 4108  8013 13838 21967 32784 46673  64018
!      91 659 2199 5197 10139 17511 27799 41489 59067  81019
!     111 812 2713 6414 12515 21616 34317 51218 72919 100020
!     'Gauss x*atan(1/239) + y*atan(1/57) + z*atan(1/18) = pi/4
!     '(fudge factor -1 to absorb round-off error
!     ' ignore the corresponding vector entry x1)
!     1
!     4
!      -1 0041841 0175421 0554985| 7853982
!     'search for polynomial coefficients
!     'const sqrt(2) + i
!     4
!     4
!      1.41421356 + 1
!     'const 3^(1/3) + sqrt(2)
!     11
!      6
!      2.8564631326805
!     'some constant
!     12
!      9
!     -1.4172098692728
!     0
!     0
! 
! output.
! 
! Transformation matrix P (on the left) and the Hermite normal form of
! with messages:
! inconsistent: the system is not solvable in integers.
! -solution: is the negative of this particular P-vector (the 1 in the
! last column of P is a marker and no part of the solution).
! The null space vectors in P are followed by their parenthesized lengths
! squared.
! 
!     'five base cases
!     'no integral solution
!     P | Hnf
!       0 -2  1 |  1  0  1
!       0  1  0 |  0  1  0
!      -1 -2  2 | -0 -0  2   inconsistent
!     loop 8
! 
! 
!     'indeterminate
!     P | Hnf
!       1  0  0  0 |  1  4  0
!       2  1 -1 -0 | -0  6 -0
!       0  0  0  1 |  0  0  1
!       1 -2  1  0 |  0  0  0   (6)
!     loop 11
! 
! 
!     'singular square
!     P | Hnf
!       1  0  0  0 |  1  2  3  0
!       3 -1  1  0 |  0  3  6  0
!       0  0  0  1 |  0  0  0  1
!       1  1 -2 -0 | -0  0  0 -0   (6)
!     loop 12
! 
! 
!     'overdetermined
!     P | Hnf
!       1 -1  0 |  1  1  1  0
!      -1  2 -0 | -0  4  5 -0
!      -2  2  1 |  0  0  0  1  -solution
!     loop 7
! 
! 
!     'square
!     P | Hnf
!        7 -1 -4  0 |  1  1   7  0
!        2  0 -1 -0 | -0  3   6 -0
!       15 -2 -9 -0 | -0 -0  12 -0
!        1  1 -2  1 |  0  0   0  1  -solution
!     loop 15
! 
! 
!     'modular inverse
!     '(the smallest solution is negative
!     ' add the modulus to make positive)
!     P | Hnf
!        -48  -1  0 |  1  0
!         48   1  1 |  0  1  -solution
!       2017  42  0 |  0  0   (4070053)
!     loop 7
! 
! 
!     'a classic Indian kuttaka problem
!     P | Hnf
!        8   7  0 |  13  0
!       -6  -5  1 |   0  1  -solution
!      -17 -15  0 |   0  0   (514)
!     loop 8
! 
! 
!     'Bachet de Méziriac "personnes en un banquet"
!     '(add null space vector to make positive men)
!     P | Hnf
!      -3   4   0  0 |  1  0  0
!       3  -4   1  0 |  0  1  0
!       3 -14 -30  1 |  0  0  1  -solution
!      -8  11  -3 -0 | -0  0 -0   (194)
!     loop 12
! 
! 
!     'Malm
!     P | Hnf
!       -1   2   1  -1  0 |  1  1  0
!        2   3  -3  -2  0 |  0  2  0
!      -17 -22 -25 -16  1 |  0  0  1  -solution
!       -4  -8   7   5  0 |  0  0  0   (154)
!      -15   8   7   0  0 |  0  0  0   (338)
!     loop 23
! 
! 
!     'from the Sunzi Suanjing
!     P | Hnf
!       -35  12   7   5  0 |  1  0  0  0
!        21  -7  -4  -3  0 |  0  1  0  0
!        15  -5  -3  -2 -0 | -0 -0  1 -0
!       -23   7   4   3  1 |  0  0  0  1  -solution
!      -105  35  21  15  0 |  0  0  0  0   (12916)
!     loop 23
! 
! 
!     P | Hnf
!       -30   73  22  0 |  1  0  0
!       -49  119  36  0 |  0  1  0
!       -23   56  17  1 |  0  0  1  -solution
!       105 -255 -77  0 |  0  0  0   (81979)
!     loop 17
! 
! 
!     'from the Shushu jiuzhang
!     P | Hnf
!           1    0    0    0     0     0    0     0     0  0 |  1   1   1   1  1    1   1   1  0
!       -7800   60   71   65   130   312   78   156   390  0 |  0  10   0   0  0    0   0   0  0
!      -35750  275  325  298   596  1430  358   715  1788  0 |  0   0  10  10  0   50   0  10  0
!           0    0    0    0     1     0    0     0     0  0 |  0   0   0  60  0    0   0   0  0
!      -34320  264  312  286   572  1373  344   687  1716  0 |  0   0   0   0  5   80  30   0  0
!           0    0    0    0     0     0    1     0     0  0 |  0   0   0   0  0  100   0   0  0
!           0    0    0    0     0     0    0     1     0  0 |  0   0   0   0  0    0  50   0  0
!           0    0    0    0     0     0    0     0     1  0 |  0   0   0   0  0    0   0  20  0
!       -3710   29   34   31    62   148   37    74   185  1 |  0   0   0   0  0    0   0   0  1  -solution
!       85800 -660 -780 -715 -1430 -3432 -858 -1716 -4290 -0 | -0   0   0   0  0    0   0   0 -0   (7399103669)
!     loop 102
! 
! 
!     '5 sailor coconut puzzle
!     P | Hnf
!           1     0     0     0     0     0     0  0 |  1  0  0  0  0  0  0
!       -3905  -781  -625  -500  -400  -320  -256  0 |  0  1  0  0  0  0  0
!        -975  -195  -156  -125  -100   -80   -64  0 |  0  0  1  0  0  0  0
!       -5125 -1025  -820  -656  -525  -420  -336  0 |  0  0  0  1  0  0  0
!       -2500  -500  -400  -320  -256  -205  -164  0 |  0  0  0  0  1  0  0
!       -3125  -625  -500  -400  -320  -256  -205 -0 | -0 -0 -0 -0 -0  1 -0
!       -3121  -624  -499  -399  -319  -255  -204  1 |  0  0  0  0  0  0  1  -solution
!       15625  3125  2500  2000  1600  1280  1024  0 |  0  0  0  0  0  0  0   (269403226)
!     loop 71
! 
! 
!     'unbounded knapsack with slack
!     P | Hnf
!       0   0   0    1    0    0  0 |  1  0  0  0
!       0   0   0    0    1    0  0 | -0  1 -0 -0
!       0   0   0    0    0    1  0 |  0  0  1  0
!      -6  -5 -11    0   -2   -3  1 |  0  0  0  1  -solution
!       3  -5   0    0    1    0  0 |  0  0  0  0   (35)
!      -1   3  -1  100   17  -18  0 |  0  0  0  0   (10624)
!      -4  15  -6    0  102 -113  0 |  0  0  0  0   (23450)
!     loop 55
! 
! 
!     'subset sum problem
!     P | Hnf
!       0  0  0 -1  0  1 -1  1  0  0 |  1  0
!      -1  0 -1 -1  0  0 -1 -1 -1  1 |  0  1  -solution
!      -2 -1  1  0  0  0  0  0  0  0 |  0  0   (6)
!       1 -1  0 -2  1  0  0  0  0  0 |  0  0   (7)
!       0 -1  1  1 -1  0 -2  1  0  0 |  0  0   (9)
!      -1  1  1 -1  0 -2  1  0  0  0 |  0  0   (9)
!       0  0 -1  1  1 -1  0 -2  1  0 |  0  0   (9)
!       0 -1  2  0  1  0 -1 -2 -1  0 |  0  0   (12)
!       1  1  0 -1 -2  0  1  0  2  0 |  0  0   (12)
!       2 -1  0  0 -1 -1  3  1 -1  0 |  0  0   (18)
!     loop 66
! 
! 
!     'HMM extended gcd (example 7.2)
!     P | Hnf
!      -1  0  1 -3  1  3  3 -2 -2  2  0 |  1  0
!       1  0 -1  3 -1 -3 -3  2  2 -2  1 |  0  1  -solution
!       2  0  3 -1  0  0  0  1  1 -2  0 |  0  0   (20)
!       0 -1  2  2 -1 -1  3 -1  1  1  0 |  0  0   (23)
!      -2  0  0 -1  3 -3 -1  2  1  0  0 |  0  0   (29)
!       0  3  2  3  2 -3  1  0  0 -1  0 |  0  0   (37)
!      -2  2  2  0 -1  3 -3 -2 -1  0  0 |  0  0   (36)
!       2  2 -2 -5 -2  1  2  1  1  0  0 |  0  0   (48)
!       0  2  0 -2 -4 -1 -1  4 -1  0  0 |  0  0   (43)
!      -3  3 -1  2 -2  1  0  1  4 -6  0 |  0  0   (81)
!       0 -2  1 -2  3  5  4  1 -5 -3  0 |  0  0   (94)
!     loop 187
! 
! 
!     'Fibonacci segment F7...F14 (example 7.3)
!     P | Hnf
!       -7   4 -3  1 -1  1  0  0  0 |  1  0
!        7  -4  3 -1  1 -1  0  0  1 |  0  1  -solution
!       -1  -1  1  0  0  0  0  0  0 |  0  0   (3)
!        0   0 -1 -1  1  0  0  0  0 |  0  0   (3)
!        0   0  0  0 -1 -1  1  0  0 |  0  0   (3)
!        0  -1 -1  1  0  0  0  0  0 |  0  0   (3)
!        0   0  0 -1 -1  1  0  0  0 |  0  0   (3)
!        0   0  0  0  0 -1 -1  1  0 |  0  0   (3)
!       18 -11  7 -4  3 -1  1 -1  0 |  0  0   (522)
!     loop 45
! 
! 
!     'compute the inverse of transpose(P)
!     '(Fibonacci morphs into Lucas)
!     P | Hnf
!        2   1    5   3  0   -5    5   13  0 |  1  0  0  0  0  0  0  0  0
!        3   2    8   5  0   -8    8   21  0 |  0  1  0  0  0  0  0  0  0
!        4   3   13   8  0  -13   13   34  0 |  0  0  1  0  0  0  0  0  0
!        7   4   21  13  0  -21   21   55  0 |  0  0  0  1  0  0  0  0  0
!       11   7   33  21  0  -34   34   89  0 |  0  0  0  0  1  0  0  0  0
!       18  11   54  33  0  -55   55  144  0 |  0  0  0  0  0  1  0  0  0
!       29  18   87  54 -1  -89   89  233  0 |  0  0  0  0  0  0  1  0  0
!       47  29  141  87 -1 -145  144  377  0 |  0  0  0  0  0  0  0  1  0
!        0   0    0   0  0    0    0    0  1 |  0  0  0  0  0  0  0  0  1
!     loop 84
! 
! 
!     'Hnf(A) with Aij = i^3 * j^2 + i + j (example 7.4)
!     P | Hnf
!      -10  -8 -5  1  2  3  5  3  0 -4  0 |  1  0   7  22  45   76  115  162  217  280  0
!       -2  -1  0  1 -1  0  1  0  1 -1  0 |  0  1   4   9  16   25   36   49   64   81  0
!      -15 -11 -4  0  4  5  4  3  1 -5  0 |  0  0  12  36  72  120  180  252  336  432  0
!        0   0  0  0  0  0  0  0  0  0  1 |  0  0   0   0   0    0    0    0    0    0  1
!       -1   1  1  0 -2  1  0  0  0  0  0 |  0  0   0   0   0    0    0    0    0    0  0   (8)
!        0  -1  1  1 -1  1 -2  1  0  0  0 |  0  0   0   0   0    0    0    0    0    0  0   (10)
!       -1   0  1  1  1 -2  0 -1  1  0  0 |  0  0   0   0   0    0    0    0    0    0  0   (10)
!       -1   0  2 -1  1 -1  1 -1 -1  1  0 |  0  0   0   0   0    0    0    0    0    0  0   (12)
!        1   0 -1  0 -1 -1  1  2  0 -1  0 |  0  0   0   0   0    0    0    0    0    0  0   (10)
!       -1   1  0  1 -1  0  0  1 -2  1  0 |  0  0   0   0   0    0    0    0    0    0  0   (10)
!       -1   2 -1 -1  2  0 -2  1  0  0  0 |  0  0   0   0   0    0    0    0    0    0  0   (16)
!     loop 99
! 
! 
!     'Gauss x*atan(1/239) + y*atan(1/57) + z*atan(1/18) = pi/4
!     '(fudge factor -1 to absorb round-off error
!     ' ignore the corresponding vector entry x1)
!     P | Hnf
!       -1  -0  -0  -0 -0 |  1 -0
!       -1   5  -8 -12  1 |  0  1  -solution
!       23  42 -29   6  0 |  0  0   (3170)
!      -71  33 -49  13  0 |  0  0   (8700)
!       18 -94 -63  27  0 |  0  0   (13858)
!     loop 20
! 
! 
!     'search for polynomial coefficients
!     'const sqrt(2) + i
!      1.41421356 + 1*i
!     P | Hnf
!         1    0   0   0   0   0  0 |  1  0  0
!         0    9   0  -2   0   1  0 |  0  1  0
!         0    0   0   0   0   0  1 |  0  0  1
!       -32   17 -10   0   2   0  0 |  0  0  0   (1417)
!         6   33   6 -48  35  -8  0 |  0  0  0   (4754)
!        18  -22 -56   5  31 -20  0 |  0  0  0   (5330)
!       102  151 -71  91 -78  36  0 |  0  0  0   (53907)
!     loop 53
! 
! 
!     'const 3^(1/3) + sqrt(2)
!      2.8564631326805
!     P | Hnf
!        1   0   0   0    0   0   0   0  0 |  1  0  0
!        0   0   0   0    0   0   0   0  1 |  0  0  1
!        5   1 -36  12   -6  -6   0   1  0 |  0  0  0   (1539)
!      -27  14   0  15  -31 -23 -26  13  0 |  0  0  0   (3485)
!       33  20  21  22  -13 -43   1   5  0 |  0  0  0   (4458)
!      -18  10 -29 -49  -12 -25 -13   9  0 |  0  0  0   (4685)
!       53 -14  15  13  -23  35 -13   1  0 |  0  0  0   (5323)
!       35  78 -17 -17    8   7   0  -1  0 |  0  0  0   (8001)
!       10  -5 -28  33  110  11 -84  23  0 |  0  0  0   (21804)
!     loop 125
! 
! 
!     'some constant
!     -1.4172098692728
!     P | Hnf
!        1   0   0   0   0  0   0   0   0   0  0  0 |  1  0  0
!        0   0   0   0   0  0   0   0   0   0  0  1 |  0  0  1
!        0   9   0   0  -7  0  -5   0   3   0  1  0 |  0  0  0   (165)
!       -2   9  -2  -9   4  8   2  -2 -12  -2  4  0 |  0  0  0   (422)
!       -4  -1   9   2  -5 -6  -2   6   6 -11 -9  0 |  0  0  0   (441)
!       -5  11   6   3   4 -3   5 -12  -6   3 -1  0 |  0  0  0   (431)
!       -9   1   9   5   4  1 -12  -8  11   1 -5  0 |  0  0  0   (560)
!       -6  -2   2  17 -11 -4   3   1  -4  -5  0  0 |  0  0  0   (521)
!       -1   1   0   5   3  8  12   6   4   9  5  0 |  0  0  0   (402)
!       -7   3   0 -13  -3 -1   4   9  -4   8  9  0 |  0  0  0   (495)
!       -9  11   7   2  11 -7  -7   3  -8  -2  3  0 |  0  0  0   (560)
!      -16  11 -13  -4   8 -4  -4   3   4   1  0  0 |  0  0  0   (684)
!     loop 360
! 
! To save server space, better not repeat full test results in your post.
! Once your solution covers all cases, a selected example will suffice.
! 
! __TOC__


