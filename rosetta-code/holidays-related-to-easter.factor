! Task:
! 
! Calculate the dates of:
! 
! -   -   Easter
!     -   Ascension Thursday
!     -   Pentecost
!     -   Trinity Sunday
!     -   Corpus Christi feast (for Catholic)
!     -   All Saints' Sunday (for Orthodox)
! 
! As an example, calculate for the first year of each century from;
! 
! -   -   years 400 to 2100 CE and for
!     -   years 2010 to 2020 CE.
! 
! Note:
! 
! From the year 325 CE on, Easter Sunday has been defined as the first
! Sunday after the first full moon on or after the day of the March
! equinox. However, the actual astronomical values for the moments of the
! full moon and equinox are not used. Instead, approximations are used,
! the first one being that the equinox is assumed to fall on March 21st
! every year. The tracking of the moon phases is similarly done with
! relatively straightforward arithmetic (compared to the sort required for
! astronomical accuracy) which amounts to maintaining a lunisolar calendar
! in parallel to our standard purely-solar one.
! 
! When Pope Gregory reformed the Catholic calendar in 1582 CE, the
! drifting of Easter with respect to the seasons was the driving
! motivation, and the rules for determining it (called the computus) were
! altered to correct that drift. Catholic nations adopted both the new
! calendar and the new computus right away, while Western Protestant
! nations adopted them more gradually over the next 350 years or so.
! Eventually, even nations dominated by the Eastern Orthodox church
! adopted a similar calendar reform (the Revised Julian calendar), so
! pretty much the whole world agrees on what day it is for civil purposes.
! But the Eastern churches never adopted the corresponding Easter rule
! changes; they still use the original Julian calendar and computus to
! determine the date of what is known in the West as "Orthodox Easter".
! Therefore, your output should indicate which computus was used to
! calculate the dates and, at least for historical dates where the
! calendar can't be assumed or is location-dependent, which calendar those
! dates are given in.
! 
! You may find algorithms on the Computus Wikipedia page. Some of the
! results:
! 
! In the year 400 CE, Easter Sunday was April 1st (in the contemporary
! Julian calendar), making Ascension Thursday May 10th and Pentecost May
! 20th. It is ahistorical to give a date so far back for either Trinity
! Sunday or Corpus Christi, neither of which were observed until centuries
! later, but they would have been May 27th and 31st. If you extend the
! modern civil calendar back that far, those days are instead assigned the
! subsequent dates: Easter on April 2nd, Ascension on May 11th, Pentecost
! on May 21st.
! 
! Skipping forward to the year 2100 CE, assuming the rules don't change
! between now and then, the Western churches will observe Easter on March
! 28, Ascension Thursday May 6th, Pentecost May 16th, Trinity Sunday May
! 23rd and Corpus Christi May 27th. Heading East, the Orthodox rules place
! Easter on April 18 in the original Julian calendar; the corresponding
! civil date is May 2nd. That puts the Ascension on June 10th and
! Pentecost June 20th. Orthodox Trinity Sunday is the same day as
! Pentecost, but they observe All Saints' Sunday the following week, June
! 27th. Corpus Christi is a purely Catholic date that has no Orthodox
! version.
! 
! Test values of Easter dates:
! 
!   Year   Orthodox   Catholic   Calendar
!   ------ ---------- ---------- ----------
!   400    01 Apr     —          Jul.
!   800    19 Apr     —          Jul.
!   1200   09 Apr     —          Jul.
!   2000   30 Apr     23 Apr     Gr.
!   2020   19 Apr     12 Apr     Gr.

USING: calendar formatting io kernel locals math math.ranges
sequences ;

! Calculate Easter.
:: my-easter ( year -- timestamp )
    year 19 mod                      :> a
    year 100 /i                      :> b
    year 100 mod                     :> c
    b 4 /i                           :> d
    b 4 mod                          :> e
    b 8 + 25 /i                      :> f
    b f - 1 + 3 /i                   :> g
    19 a * b + d - g - 15 + 30 mod   :> h
    c 4 /i                           :> i
    c 4 mod                          :> k
    32 2 e * + 2 i * + h - k - 7 mod :> l
    a 11 h * + 22 l * + 451 /i       :> m
    h l + 7 m * - 114 +              :> n
    n 31 /i                          :> month
    n 31 mod 1 +                     :> day
    year month day <date> ;

: show-related ( timestamp days-offset -- )
    days time+ "   %d %b   " strftime write ;

: holidays ( from to step -- )
    "Year     Easter      Ascension   Pentecost   Trinity     Corpus" print
    <range> [
        dup "%4d: " printf my-easter
        { 0 39 49 56 60 } [ show-related ] with each nl
    ] each ;

400 2100 100 holidays nl
2010 2020 1 holidays
