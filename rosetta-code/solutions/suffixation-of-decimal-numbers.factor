! Suffixation: a letter or a group of letters added to the end of a word
! to change its meaning.
! 
!     
! 
!         ───── or, as used herein ─────
! 
! Suffixation: the addition of a metric or "binary" metric suffix to a
! number, with/without rounding.
! 
! Task:
! 
! Write a function(s) to append (if possible) a metric or a "binary"
! metric suffix to a number (displayed in decimal).
! 
! The number may be rounded (as per user specification) (via shortening of
! the number when the number of digits past the decimal point are to be
! used).
! 
! Task requirements:
! 
! -   -   write a function (or functions) to add (if possible) a suffix to
!         a number
!     -   the function(s) should be able to express the number (possibly
!         with a suffix) in as many decimal digits as specified
!     -   the sign should be preserved (if present)
!     -   the number may have commas within the number (the commas need
!         not be preserved)
!     -   the number may have a decimal point and/or an exponent as in:
!         -123.7e-01
!     -   the suffix that might be appended should be in uppercase;
!         however, the i should be in lowercase
!     -   support:
!         -   -   the metric suffixes: K M G T P E Z Y X W V U
!             -   the binary metric suffixes: Ki Mi Gi Ti Pi Ei Zi Yi Xi
!                 Wi Vi Ui
!             -   the (full name) suffix: googol (lowercase) (equal to
!                 1e100) (optional)
!             -   a number of decimal digits past the decimal point (with
!                 rounding). The default is to display all significant
!                 digits
!     -   validation of the (supplied/specified) arguments is optional but
!         recommended
!     -   display (with identifying text):
!         -   -   the original number (with identifying text)
!             -   the number of digits past the decimal point being used
!                 (or none, if not specified)
!             -   the type of suffix being used (metric or "binary"
!                 metric)
!             -   the (new) number with the appropriate (if any) suffix
!             -   all output here on this page
! 
! Metric suffixes to be supported (whether or not they're officially sanctioned):
! 
!      K     multiply the number by  10^3              kilo      (1,000)
!      M     multiply the number by  10^6              mega      (1,000,000)
!      G     multiply the number by  10^9              giga      (1,000,000,000)
!      T     multiply the number by  10^12             tera      (1,000,000,000,000)
!      P     multiply the number by  10^15             peta      (1,000,000,000,000,000)
!      E     multiply the number by  10^18             exa       (1,000,000,000,000,000,000)
!      Z     multiply the number by  10^21             zetta     (1,000,000,000,000,000,000,000)
!      Y     multiply the number by  10^24             yotta     (1,000,000,000,000,000,000,000,000)
!      X     multiply the number by  10^27             xenta     (1,000,000,000,000,000,000,000,000,000)
!      W     multiply the number by  10^30             wekta     (1,000,000,000,000,000,000,000,000,000,000)
!      V     multiply the number by  10^33             vendeka   (1,000,000,000,000,000,000,000,000,000,000,000)
!      U     multiply the number by  10^36             udekta    (1,000,000,000,000,000,000,000,000,000,000,000,000)
! 
! "Binary" suffixes to be supported (whether or not they're officially sanctioned):
! 
!      Ki    multiply the number by  2^10              kibi      (1,024)
!      Mi    multiply the number by  2^20              mebi      (1,048,576)
!      Gi    multiply the number by  2^30              gibi      (1,073,741,824)
!      Ti    multiply the number by  2^40              tebi      (1,099,571,627,776)
!      Pi    multiply the number by  2^50              pebi      (1,125,899,906,884,629)
!      Ei    multiply the number by  2^60              exbi      (1,152,921,504,606,846,976)
!      Zi    multiply the number by  2^70              zebi      (1,180,591,620,717,411,303,424)
!      Yi    multiply the number by  2^80              yobi      (1,208,925,819,614,629,174,706,176)
!      Xi    multiply the number by  2^90              xebi      (1,237,940,039,285,380,274,899,124,224)
!      Wi    multiply the number by  2^100             webi      (1,267,650,600,228,229,401,496,703,205,376)
!      Vi    multiply the number by  2^110             vebi      (1,298,074,214,633,706,907,132,624,082,305,024)
!      Ui    multiply the number by  2^120             uebi      (1,329,227,995,784,915,872,903,807,060,280,344,576)
! 
! For instance, with this pseudo─code:
! 
!                                  /* 1st arg: the number to be transformed.*/
!                                  /* 2nd arg: # digits past the dec. point.*/
!                                  /* 3rd arg: the type of suffix to use.   */
!                                  /*         2   indicates "binary" suffix.*/
!                                  /*        10   indicates  decimal suffix.*/
!      a = '456,789,100,000,000'   /* "A"  has  eight  trailing zeros.      */
!      say ' aa=' suffize(a)       /* Display a suffized number to terminal.*/
!                                  /* The  "1"   below shows one decimal ···*/
!                                  /*         digit past the decimal point. */
!      n = suffize(a, 1)           /* SUFFIZE  is the function name.        */
!      n = suffize(a, 1, 10)       /* (identical to the above statement.)   */
!      say '  n=' n                /* Display value of  N  to terminal.     */
!                                  /* Note the rounding that occurs.        */
!      f = suffize(a, 1,  2)       /* SUFFIZE  with one fractional digit    */
!      say '  f=' f                /* Display value of  F  to terminal.     */
!                                  /* Display value in "binary" metric.     */
!      bin = suffize(a, 5, 2)      /* SUFFIZE with binary metric suffix.    */
!      say 'bin=' bin              /* Display value of  BIN  to terminal.   */
!      win = suffize(a, 0, 2)      /* SUFFIZE with binary metric suffix.    */
!      say 'win=' win              /* Display value of  WIN  to terminal.   */
!      xvi = ' +16777216 '         /* this used to be a big computer ···    */
!      big = suffize(xvi, , 2)     /* SUFFIZE with binary metric suffix.    */
!      say 'big=' big              /* Display value of  BIG  to terminal.   */
! 
! would display:
! 
!       aa= 456.7891T
!        n= 456.8T
!        f= 415.4Ti
!      bin= 415.44727Ti
!      win= 415Ti
!      big= 16Mi
! 
! Use these test cases:
! 
!                87,654,321
!               -998,877,665,544,332,211,000      3
!               +112,233                          0
!                16,777,216                       1
!                456,789,100,000,000              2
!                456,789,100,000,000              2      10
!                456,789,100,000,000              5       2
!                456,789,100,000.000e+00          0      10
!               +16777216                         ,       2
!                1.2e101
!                (your primary disk free space)   1                  ◄■■■■■■■ optional
! 
! Use whatever parameterizing your computer language supports, and it's
! permitted to create as many separate functions as are needed (if needed)
! if function arguments aren't allowed to be omitted or varied.


