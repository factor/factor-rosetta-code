! For a while in the late 70s, the pseudoscience of biorhythms was popular
! enough to rival astrology, with kiosks in malls that would give you your
! weekly printout. It was also a popular entry in "Things to Do with your
! Pocket Calculator" lists. You can read up on the history at Wikipedia,
! but the main takeaway is that unlike astrology, the math behind
! biorhythms is dead simple.
! 
! It's based on the number of days since your birth. The premise is that
! three cycles of unspecified provenance govern certain aspects of
! everyone's lives – specifically, how they're feeling physically,
! emotionally, and mentally. The best part is that not only do these
! cycles somehow have the same respective lengths for all humans of any
! age, gender, weight, genetic background, etc, but those lengths are an
! exact number of days. And the pattern is in each case a perfect sine
! curve. Absolutely miraculous!
! 
! To compute your biorhythmic profile for a given day, the first thing you
! need is the number of days between that day and your birth, so the
! answers in Days between dates are probably a good starting point.
! (Strictly speaking, the biorhythms start at 0 at the moment of your
! birth, so if you know time of day you can narrow things down further,
! but in general these operate at whole-day granularity.) Then take the
! residue of that day count modulo each of the the cycle lengths to
! calculate where the day falls on each of the three sinusoidal journeys.
! 
! The three cycles and their lengths are as follows:
! 
!     
! 
!         {| class="wikitable"
! 
! ! Cycle ! Length |- |Physical | 23 days |- |Emotional | 28 days |-
! |Mental | 33 days |}
! 
! The first half of each cycle is in "plus" territory, with a peak at the
! quarter-way point; the second half in "minus" territory, with a valley
! at the three-quarters mark. You can calculate a specific value between
! -1 and +1 for the kth day of an n-day cycle by computing sin( 2πk / n ).
! The days where a cycle crosses the axis in either direction are called
! "critical" days, although with a cycle value of 0 they're also said to
! be the most neutral, which seems contradictory.
! 
! The task: write a subroutine, function, or program that will, given a
! birthdate and a target date, output the three biorhythmic values for the
! day. You may optionally include a text description of the position and
! the trend (e.g. "up and rising", "peak", "up but falling", "critical",
! "down and falling", "valley", "down but rising"), an indication of the
! date on which the next notable event (peak, valley, or crossing) falls,
! or even a graph of the cycles around the target date. Demonstrate the
! functionality for dates of your choice.
! 
! Example run of my Raku implementation:
! 
!     raku br.raku 1943-03-09 1972-07-11
! 
!     Day 10717:
!     Physical day 22: -27% (down but rising, next transition 1972-07-12)
!     Emotional day 21: valley
!     Mental day 25: valley
! 
! Double valley! This was apparently not a good day for Mr. Fischer to
! begin a chess tournament...

USING: calendar calendar.parser formatting io kernel math
math.constants math.functions ;

: days-between ( ymd-str ymd-str -- n )
    [ ymd>timestamp ] bi@ time- duration>days abs ;

: trend ( pos len -- str ) / 4 * floor 3 divisor? "↑" "↓" ? ;

: percent ( pos len -- x ) [ 2pi * ] [ / sin 100 * ] bi* ;

: .day ( days cycle-length day-type -- )
    write [ mod ] keep [ drop ] [ percent ] [ trend ] 2tri
    " day %d: %.1f%%%s\n" printf ;

: .biorhythm ( ymd-str ymd-str -- )
    2dup "Born %s, Target %s\n" printf days-between dup
    "Day %d\n" printf
    [ 23 "Physical" .day ]
    [ 28 "Emotional" .day ]
    [ 33 "Mental" .day ] tri ;

"1809-02-12" "1863-11-19" .biorhythm
