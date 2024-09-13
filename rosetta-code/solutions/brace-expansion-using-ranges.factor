! Task
! 
! Write and test a function which expands one or more Unix-style numeric
! and alphabetic range braces embedded in a larger string.
! 
! The brace strings used by Unix shells permit expansion of both:
! 
! 1.  Recursive comma-separated lists (covered by the related task:
!     Brace_expansion, and can be ignored here)
! 2.  ordered numeric and alphabetic ranges, which are the object of this
!     task.
! 
! The general pattern of brace ranges is:
! 
!     {<START>..<END>}
! 
! and, in more recent shells:
! 
!     {<START>..<END>..<INCR>}
! 
! (See https://wiki.bash-hackers.org/syntax/expansion/brace)
! 
! Expandable ranges of this kind can be ascending or descending:
! 
!     simpleNumber{1..3}.txt
!     simpleAlpha-{Z..X}.txt
! 
! and may have a third INCR element specifying ordinal intervals larger
! than one. The increment value can be preceded by a - minus sign, but not
! by a + sign.
! 
! The effect of the minus sign is to always to reverse the natural order
! suggested by the START and END values.
! 
! Any level of zero-padding used in either the START or END value of a
! numeric range is adopted in the expansions.
! 
!     steppedDownAndPadded-{10..00..5}.txt
!     minusSignFlipsSequence {030..20..-5}.txt
! 
! A single string may contain more than one expansion range:
! 
!     combined-{Q..P}{2..1}.txt
! 
! Alphabetic range values are limited to a single character for START and
! END but these characters are not confined to the ASCII alphabet.
! 
!     emoji{🌵..🌶}{🌽..🌾}etc
! 
! Unmatched braces are simply ignored, as are empty braces, and braces
! which contain no range (or list).
! 
!     li{teral
!     rangeless{}empty
!     rangeless{random}string
! 
! Generate and display here the expansion of (at least) each of the ten
! example lines shown below.
! 
! The JavaScript implementation below uses parser combinators, aiming to
! encode a more or less full and legible description of the
! 
!     <PREAMBLE><AMBLE><POSTSCRIPT>
! 
! range brace grammar, but you should use any resource that suggests
! itself in your language, including parser libraries.
! 
! (The grammar of range expansion, unlike that of nested list expansion,
! is not recursive, so even regular expressions should prove serviceable
! here).
! 
! The output of the JS implementation, which aims to match the brace
! expansion behaviour of the default zsh shell on current versions of
! macOS:
! 
!     simpleNumberRising{1..3}.txt -> 
!         simpleNumberRising1.txt
!         simpleNumberRising2.txt
!         simpleNumberRising3.txt
! 
!     simpleAlphaDescending-{Z..X}.txt -> 
!         simpleAlphaDescending-Z.txt
!         simpleAlphaDescending-Y.txt
!         simpleAlphaDescending-X.txt
! 
!     steppedDownAndPadded-{10..00..5}.txt -> 
!         steppedDownAndPadded-10.txt
!         steppedDownAndPadded-05.txt
!         steppedDownAndPadded-00.txt
! 
!     minusSignFlipsSequence {030..20..-5}.txt -> 
!         minusSignFlipsSequence 020.txt
!         minusSignFlipsSequence 025.txt
!         minusSignFlipsSequence 030.txt
! 
!     reverseSteppedNumberRising{1..6..-2}.txt -> 
!         reverseSteppedNumberRising5.txt
!         reverseSteppedNumberRising3.txt
!         reverseSteppedNumberRising1.txt
! 
!     combined-{Q..P}{2..1}.txt -> 
!         combined-Q2.txt
!         combined-Q1.txt
!         combined-P2.txt
!         combined-P1.txt
! 
!     emoji{🌵..🌶}{🌽..🌾}etc -> 
!         emoji🌵🌽etc
!         emoji🌵🌾etc
!         emoji🌶🌽etc
!         emoji🌶🌾etc
! 
!     li{teral -> 
!         li{teral
! 
!     rangeless{}empty -> 
!         rangeless{}empty
! 
!     rangeless{random}string -> 
!         rangeless{random}string
! 
! -   range expansion


