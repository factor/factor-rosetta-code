! The shortest common supersequence is a problem closely related to the
! longest common subsequence, which you can use as an external function
! for this task.
! 
! ;Task:
! 
! Given two strings u and v, find the shortest possible sequence s, which
! is the shortest common super-sequence of u and v where both u and v are
! a subsequence of s. Defined as such, s is not necessarily unique.
! 
! Demonstrate this by printing s where u=“abcbdab” and v=“bdcaba”.
! 
! Also see:
! 
! -   Wikipedia: shortest common supersequence

USING: combinators io kernel locals math memoize sequences ;

MEMO:: scs ( x y -- seq )
    {
        { [ x empty? ] [ y ] }
        { [ y empty? ] [ x ] }
        { [ x first y first = ]
          [ x rest y rest scs x first prefix ] }
        { [ x y rest scs length x rest y scs length <= ]
          [ x y rest scs y first prefix ] }
        [ x rest y scs x first prefix ]
    } cond ;

"abcbdab" "bdcaba" scs print
