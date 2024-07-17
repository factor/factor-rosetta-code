! In the Chinese calendar, years are identified using two lists of labels,
! one of length 10 – the "celestial" (or "heavenly") "stems" – and one of
! length 12 – the "terrestrial" (or "earthly") "branches". The labels do
! not really have any meaning outside their positions in the two lists;
! they're simply a traditional enumeration device, used much as Westerners
! use letters and numbers. They were historically used for months and days
! as well as years, and the stems are still sometimes used for school
! grades.
! 
! Years cycle through both lists concurrently, so that both stem and
! branch advance each year; if we used Roman letters for the stems and
! numbers for the branches, consecutive years would be labeled A1, B2, C3,
! etc. Since the two lists are different lengths, they cycle back to their
! beginning at different points: after J10 we get A11, and then after B12
! we get C1. However, since both lists are of even length, only
! like-parity pairs occur (A1, A3, A5, but not A2, A4, A6), so only half
! of the 120 possible pairs are included in the sequence. The result is a
! repeating 60-year pattern within which each name pair occurs only once.
! 
! Mapping the branches to twelve traditional animal deities results in the
! well-known "Chinese zodiac", assigning each year to a given animal. For
! example, Saturday, February 10, 2024 CE (in the common Gregorian
! calendar) began the lunisolar Year of the Dragon.
! 
! The stems do not have a one-to-one mapping like that of the branches to
! animals; however, the five pairs of consecutive stems are each
! associated with one of the traditional wǔxíng elements (Wood, Fire,
! Earth, Metal, and Water). Further, one of the two years within each
! element is assigned to yin, the other to yang.
! 
! Thus, the Chinese year beginning in 2024 CE is also the yang year of
! Wood. Since 12 is an even number, the association between animals and
! yin/yang aspect doesn't change; consecutive Years of the Dragon will
! cycle through the five elements, but will always be yang.
! 
! Task: Create a subroutine or program that will return or output the animal, yin/yang association, and element for the lunisolar year that begins in a given CE year.
! 
! You may optionally provide more information in the form of the year's
! numerical position within the 60-year cycle and/or its actual Chinese
! stem-branch name (in Han characters or Pinyin transliteration).
! 
! Requisite information:
! 
! -   The animal cycle runs in this order: Rat, Ox, Tiger, Rabbit, Dragon,
!     Snake, Horse, Goat, Monkey, Rooster, Dog, Pig.
! -   The element cycle runs in this order: Wood, Fire, Earth, Metal,
!     Water.
! -   Each element gets two consecutive years; a yang followed by a yin.
! -   The first year (Wood Rat, yang) of the current 60-year cycle began
!     in 1984 CE.
! 
! The lunisolar year beginning in 2024 CE - which, as already noted, is
! the year of the Wood Dragon (yang) - is the 41st of the current cycle.
! 
! Information for optional task:
! 
! -   The ten celestial stems are 甲 jiă, 乙 yĭ, 丙 bĭng, 丁 dīng, 戊 wù,
!     己 jĭ, 庚 gēng, 辛 xīn, 壬 rén, and 癸 gŭi. With the ASCII version
!     of Pinyin tones, the names are written "jia3", "yi3", "bing3",
!     "ding1", "wu4", "ji3", "geng1", "xin1", "ren2", and "gui3".
! -   The twelve terrestrial branches are 子 zĭ, 丑 chŏu, 寅 yín, 卯 măo,
!     辰 chén, 巳 sì, 午 wŭ, 未 wèi, 申 shēn, 酉 yŏu, 戌 xū, 亥 hài. In
!     ASCII Pinyin, those are "zi3", "chou3", "yin2", "mao3", "chen2",
!     "si4", "wu3", "wei4", "shen1", "you3", "xu1", and "hai4".
! 
! Therefore 1984 was 甲子 (jiă-zĭ, or jia3-zi3), while 2024 is 甲辰
! (jĭa-chén or jia3-chen2).

USING: circular formatting io kernel math qw sequences
sequences.repeating ;
IN: rosetta-code.zodiac

<PRIVATE

! Offset start index by -4 because first cycle started on 4 CE.
: circularize ( seq -- obj )
    [ -4 ] dip <circular> [ change-circular-start ] keep ;

: animals ( -- obj )
    qw{
        Rat Ox Tiger Rabbit Dragon Snake Horse Goat Monkey
        Rooster Dog Pig
    } circularize ;

: elements ( -- obj )
    qw{ Wood Fire Earth Metal Water } 2 <repeats> circularize ;

PRIVATE>

: zodiac ( n -- str )
    dup [ elements nth ] [ animals nth ]
    [ even? "yang" "yin" ? ] tri
    "%d is the year of the %s %s (%s)." sprintf ;

: zodiac-demo ( -- )
    { 1935 1938 1968 1972 1976 1984 1985 2017 }
    [ zodiac print ] each ;

MAIN: zodiac-demo
