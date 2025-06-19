! An evil wizard has trapped you in the stairwell of his castle. Your only
! hope of escape is to run up all 100 steps to reach the top, and you can
! run one step per second. Unfortunately the wizard uses magic to lengthen
! the staircase by five steps per second. The new steps are inserted
! randomly between existing steps, so if you're lucky some of them might
! be beneath you and not ahead of you.
! 
! Can you escape, or are you doomed to run up an ever-lengthening
! staircase forever?
! 
! Write a program to simulate your escape attempt. How are you doing after
! ten minutes? For every second between 600 and 609 seconds inclusive
! print the number of steps behind you and the number still ahead of you.
! 
! If you escaped, run 10,000 tests and print the average time taken and
! the average final length of the staircase.

USING: combinators.random io kernel math math.order prettyprint ;

: position (     -- n   ) 0 ;
: stairs   (     -- n   ) 100 ;
: new      (     -- m n ) position stairs ;
: incd     ( m n -- o p ) swap 1 + swap ;
: seconds  ( m   -- n   ) 100 - 5 / ;
: window?  ( n   -- ?   ) seconds 600 609 between? ;
: zap      ( m n -- o p ) 2dup / [ incd ] whenp 1 + ;
: barrage  ( m n -- o p ) 5 [ zap ] times ;
: .n       ( n   --     ) pprint 7 [ bl ] times ;
: .stats   ( m n --     ) dup seconds .n over .n swap - .n nl ;
: .header  (     --     ) "Seconds  behind     ahead" print ;
: ?.status ( m n -- o p ) dup window? [ 2dup .stats ] when ; 
: tick     ( m n -- o p ) incd barrage ;
: demo     ( m n -- o p ) tick ?.status ;
: sim-with ( q   -- n   ) new rot [ 2dup < ] swap while drop ; inline
: first    (     -- n   ) [ demo ] sim-with ;
: sim      (     -- n   ) [ tick ] sim-with ;
: sims     (     -- n   ) 0 first + 9999 [ sim + ] times ;
: steps    ( m   -- n   ) "Avg. steps: " write 10000 / dup . ;
: time     ( n   --     ) "Avg. seconds: " write seconds . ;
: main     (     --     ) .header sims nl steps time ;

main

USING: combinators.random effects.parser io kernel math
math.order parser prettyprint stack-checker words ;

<< SYNTAX: .: [ scan-new-word parse-definition dup infer ]
    with-definition define-declared ; >>

.: position  0 ;
.: stairs    100 ;
.: new       position stairs ;
.: incd      swap 1 + swap ;
.: seconds   100 - 5 / ;
.: window?   seconds 600 609 between? ;
.: zap       2dup / [ incd ] whenp 1 + ;
.: barrage   5 [ zap ] times ;
.: .n        pprint 7 [ bl ] times ;
.: .stats    dup seconds .n over .n swap - .n nl ;
.: .header   "Seconds  behind     ahead" print ;
.: ?.status  dup window? [ 2dup .stats ] when ; 
.: tick      incd barrage ;
.: demo      tick ?.status ;
.: first     new [ 2dup < ] [ demo ] while drop ;
.: sim       new [ 2dup < ] [ tick ] while drop ;
.: sims      0 first + 9999 [ sim + ] times ;
.: steps     "Avg. steps: " write 10000 / dup . ;
.: time      "Avg. seconds: " write seconds . ;
.: main      .header sims nl steps time ;

main
