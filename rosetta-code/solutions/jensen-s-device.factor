! This task is an exercise in call by name.
! 
! Jensen's Device is a computer programming technique devised by Danish
! computer scientist Jørn Jensen after studying the ALGOL 60 Report.
! 
! The following program was proposed to illustrate the technique. It
! computes the 100th harmonic number:
! 
! begin
!    integer i;
!    real procedure sum (i, lo, hi, term);
!       value lo, hi;
!       integer i, lo, hi;
!       real term;
!       comment term is passed by-name, and so is i;
!    begin
!       real temp;
!       temp := 0;
!       for i := lo step 1 until hi do
!          temp := temp + term;
!       sum := temp
!    end;
!    comment note the correspondence between the mathematical notation and the call to sum;
!    print (sum (i, 1, 100, 1/i))
! end
! 
! The above exploits call by name to produce the correct answer
! (5.187...). It depends on the assumption that an expression passed as an
! actual parameter to a procedure would be re-evaluated in the caller's
! context every time the corresponding formal parameter's value was
! required. If the last parameter to sum had been passed by value, and
! assuming the initial value of i were 1, the result would have been 100 ×
! 1/1 = 100.
! 
! Moreover, the first parameter to sum, representing the "bound" variable
! of the summation, must also be passed by name (or at least by
! reference), otherwise changes to it (made within sum) would not be
! visible in the caller's context when computing each of the values to be
! added. (On the other hand, the global variable does not have to use the
! same identifier, in this case i, as the formal parameter.)
! 
! Donald Knuth later proposed the Man or Boy Test as a more rigorous
! exercise.

: sum ( lo hi term -- x ) [ [a,b] ] dip map-sum ; inline

1 100 [ recip ] sum .
