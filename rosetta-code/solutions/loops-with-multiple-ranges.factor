! Some languages allow multiple loop ranges, such as the PL/I example
! (snippet) below.
! 
!                                            /* all variables are DECLARED as integers. */
!               prod=  1;                    /*start with a product of unity.           */
!                sum=  0;                    /*  "     "  "   sum    " zero.            */
!                  x= +5;
!                  y= -5;
!                  z= -2;
!                one=  1;
!              three=  3;
!              seven=  7;
!                                            /*(below)  **  is exponentiation:  4**3=64 */
!                do j=   -three  to     3**3        by three   ,
!                        -seven  to   +seven        by   x     ,
!                           555  to      550 - y               ,
!                            22  to      -28        by -three  ,
!                          1927  to     1939                   ,
!                             x  to        y        by   z     ,
!                         11**x  to    11**x + one;
!                                                             /* ABS(n) = absolute value*/
!                sum= sum + abs(j);                           /*add absolute value of J.*/
!                if abs(prod)<2**27 & j¬=0  then prod=prod*j; /*PROD is small enough & J*/
!                end;                                         /*not 0, then multiply it.*/
!                          /*SUM and PROD are used for verification of J incrementation.*/
!              display (' sum= ' ||  sum);                    /*display strings to term.*/
!              display ('prod= ' || prod);                    /*   "       "     "   "  */
! 
! Task:
! 
! Simulate/translate the above PL/I program snippet as best as possible in
! your language, with particular emphasis on the do loop construct.
! 
! The do index must be incremented/decremented in the same order shown.
! 
! If feasible, add commas to the two output numbers (being displayed).
! 
! Show all output here.
! 
!           A simple PL/I   DO  loop  (incrementing or decrementing)  has the construct of:
! 
!                 DO variable = start_expression    {TO ending_expression]       {BY increment_expression} ;
!                      ---or---
!                 DO variable = start_expression    {BY increment_expression}    {TO ending_expression]    ;  
! 
!           where it is understood that all expressions will have a value.  The  variable  is normally a 
!           scaler variable,  but need not be  (but for this task, all variables and expressions are declared
!           to be scaler integers).   If the   BY   expression is omitted,  a   BY   value of unity is used.
!           All expressions are evaluated before the   DO   loop is executed,  and those values are used
!           throughout the   DO   loop execution   (even though, for instance,  the value of   Z   may be
!           changed within the   DO   loop.    This isn't the case here for this task.  
! 
!           A multiple-range   DO   loop can be constructed by using a comma (,) to separate additional ranges
!           (the use of multiple   TO   and/or   BY   keywords).     This is the construct used in this task.
! 
!           There are other forms of   DO   loops in PL/I involving the  WHILE  clause,  but those won't be 
!           needed here.    DO  loops without a   TO   clause might need a   WHILE   clause  or some other 
!           means of exiting the loop  (such as  LEAVE,  RETURN,  SIGNAL,  GOTO,  or  STOP),  or some other 
!           (possible error) condition that causes transfer of control outside the  DO  loop.
! 
!           Also, in PL/I, the check if the   DO   loop index value is outside the range is made at the 
!           "head"  (start)  of the   DO  loop,  so it's possible that the   DO   loop isn't executed,  but 
!           that isn't the case for any of the ranges used in this task. 
! 
!           In the example above, the clause:                    x    to y       by z     
!           will cause the variable   J   to have to following values  (in this order):  5  3  1  -1  -3  -5
! 
!           In the example above, the clause:                 -seven  to +seven  by x  
!           will cause the variable   J   to have to following values  (in this order):  -7  -2   3  
! 
! Related tasks:
! 
! -   Loop over multiple arrays simultaneously
! -   Loops/Break
! -   Loops/Continue
! -   Loops/Do-while
! -   Loops/Downward for
! -   Loops/For
! -   Loops/For with a specified step
! -   Loops/Foreach
! -   Loops/Increment loop index within loop body
! -   Loops/Infinite
! -   Loops/N plus one half
! -   Loops/Nested
! -   Loops/While
! -   Loops/with multiple ranges
! -   Loops/Wrong ranges
! 
! Category:Loop modifiers Category:Conditional loops Category:Simple

USING: formatting kernel locals math math.functions math.ranges
sequences sequences.generalizations tools.memory.private ;

[let                            ! Allow lexical variables.
     1 :> prod!                 ! Start with a product of unity.
     0 :> sum!                  !   "     "  "   sum    " zero.
     5 :> x
    -5 :> y
    -2 :> z
     1 :> one
     3 :> three
     7 :> seven

    three neg 3 3 ^ three <range>              ! Create array
    seven neg seven x     <range>              ! of 7 ranges.
    555 550 y -             [a,b]
    22 -28 three neg      <range>
    1927 1939               [a,b]
    x y z                 <range>
    11 x ^ 11 x ^ 1 +       [a,b] 7 narray

    [
        [
            :> j j abs sum + sum!
            prod abs 2 27 ^ < j zero? not and
            [ prod j * prod! ] when
        ] each                      ! Loop over range.
    ] each                          ! Loop over array of ranges.
    
    ! SUM and PROD are used for verification of J incrementation.
    sum prod [ commas ] bi@ " sum=  %s\nprod= %s\n" printf
]
