! Create a well-formatted stem-and-leaf plot from the following data set,
! where the leaves are the last digits:
! 
!   12 127 28 42 39 113 42 18 44 118 44 37 113 124 37 48 127 36 29 31 125
!   139 131 115 105 132 104 123 35 113 122 42 117 119 58 109 23 105 63 27
!   44 105 99 41 128 121 116 125 32 61 37 127 29 113 121 58 114 126 53 114
!   96 25 109 7 31 141 46 13 27 43 117 116 27 7 68 40 31 115 124 42 128 52
!   71 118 117 38 27 106 33 117 116 111 40 119 47 105 57 122 109 124 115
!   43 120 43 27 27 18 28 48 125 107 114 34 133 45 120 30 127 31 116 146
! 
! The primary intent of this task is the presentation of information. It
! is acceptable to hardcode the data set or characteristics of it (such as
! what the stems are) in the example, insofar as it is impractical to make
! the example generic to any data set. For example, in a computation-less
! language like HTML the data set may be entirely prearranged within the
! example; the interesting characteristics are how the proper visual
! formatting is arranged.
! 
! If possible, the output should not be a bitmap image.
! Monospaced plain text is acceptable, but do better if you can. It may be
! a window, i.e. not a file.
! 
! Note: If you wish to try multiple data sets, you might try this
! generator.

USING: assocs formatting grouping.extras io kernel math
prettyprint sequences sorting ;

: leaf-plot ( seq -- )
    natural-sort [ 10 /i ] group-by dup keys last 1 +
    [ dup "%2d | " printf of [ 10 mod pprint bl ] each nl ] with
    each-integer ;

{
    12 127 28 42 39 113 42 18 44 118 44 37 113 124 37 48 127 36
    29 31 125 139 131 115 105 132 104 123 35 113 122 42 117 119
    58 109 23 105 63 27 44 105 99 41 128 121 116 125 32 61 37
    127 29 113 121 58 114 126 53 114 96 25 109 7 31 141 46 13 27
    43 117 116 27 7 68 40 31 115 124 42 128 146 52 71 118 117 38
    27 106 33 117 116 111 40 119 47 105 57 122 109 124 115 43
    120 43 27 27 18 28 48 125 107 114 34 133 45 120 30 127 31
    116
} leaf-plot
