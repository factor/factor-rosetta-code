! Background: The man or boy test was proposed by computer scientist
! Donald Knuth as a means of evaluating implementations of the ALGOL 60
! programming language. The aim of the test was to distinguish compilers
! that correctly implemented "recursion and non-local references" from
! those that did not.
! 
!    I have written the following simple routine, which may separate the 'man-compilers' from the 'boy-compilers'
!   — Donald Knuth
! 
! Task: Imitate Knuth's example in Algol 60 in another language, as far as
! possible.
! 
! Details: Local variables of routines are often kept in activation
! records (also call frames). In many languages, these records are kept on
! a call stack. In Algol (and e.g. in Smalltalk), they are allocated on a
! heap instead. Hence it is possible to pass references to routines that
! still can use and update variables from their call environment, even if
! the routine where those variables are declared already returned. This
! difference in implementations is sometimes called the Funarg Problem.
! 
! In Knuth's example, each call to A allocates an activation record for
! the variable A. When B is called from A, any access to k now refers to
! this activation record. Now B in turn calls A, but passes itself as an
! argument. This argument remains bound to the activation record. This
! call to A also "shifts" the variables x_(i) by one place, so eventually
! the argument B (still bound to its particular activation record) will
! appear as x4 or x5 in a call to A. If this happens when the expression
! x4 + x5 is evaluated, then this will again call B, which in turn will
! update k in the activation record it was originally bound to. As this
! activation record is shared with other instances of calls to A and B, it
! will influence the whole computation.
! 
! So all the example does is to set up a convoluted calling structure,
! where updates to k can influence the behavior in completely different
! parts of the call tree.
! 
! Knuth used this to test the correctness of the compiler, but one can of
! course also use it to test that other languages can emulate the Algol
! behavior correctly. If the handling of activation records is correct,
! the computed value will be −67.
! 
! Performance and Memory: Man or Boy is intense and can be pushed to
! challenge any machine. Memory (both stack and heap) not CPU time is the
! constraining resource as the recursion creates a proliferation
! activation records which will quickly exhaust memory and present itself
! through a stack error. Each language may have ways of adjusting the
! amount of memory or increasing the recursion depth. Optionally, show how
! you would make such adjustments.
! 
! The table below shows the result, call depths, and total calls for a
! range of k:
! 
!   k          0   1   2    3   4   5    6    7    8     9     10    11      12      13      14       15       16       17        18        19        20          21          22          23           24           25           26            27            28             29             30
!   ---------- --- --- ---- --- --- ---- ---- ---- ----- ----- ----- ------- ------- ------- -------- -------- -------- --------- --------- --------- ----------- ----------- ----------- ------------ ------------ ------------ ------------- ------------- -------------- -------------- --------------
!   A          1   0   -2   0   1   0    1    -1   -10   -30   -67   -138    -291    -642    -1,446   -3,250   -7,244   -16,065   -35,601   -78,985   -175,416    -389,695    -865,609    -1,922,362   -4,268,854   -9,479,595   -21,051,458   -46,750,171   -103,821,058   -230,560,902   -512,016,658
!   A called   1   2   3    4   8   18   38   80   167   347   722   1,509   3,168   6,673   14,091   29,825   63,287   134,652   287,264   614,442   1,317,533   2,831,900   6,100,852   13,172,239   28,499,827   61,786,266   134,202,509   292,011,464                                 
!   A depth    1   2   3    4   8   16   32   64   128   256   512   1,024   2,048   4,096   8,192    16,384   32,768   65,536    131,072   262,144   524,288     1,048,576   2,097,152   4,194,304    8,388,608                                                                           
!   B called   0   1   2    3   7   17   37   79   166   346   721   1,508   3,167   6,672   14,090   29,824   63,286   134,651   287,263   614,441   1,317,532   2,831,899   6,100,851   13,172,238   28,499,826                                                                          
!   B depth    0   1   2    3   7   15   31   63   127   255   511   1,023   2,047   4,095   8,191    16,383   32,767   65,535    131,071   262,143   524,287     1,048,575   2,097,151   4,194,303    8,388,607                                                                           
! 
! Related tasks:
! 
! -   Jensen's Device
! 
! Category:Recursion


