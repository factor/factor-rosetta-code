! Brace expansion is a type of parameter expansion made popular by Unix
! shells, where it allows users to specify multiple similar string
! parameters without having to type them all out. E.g. the parameter
! enable_{audio,video} would be interpreted as if both enable_audio and
! enable_video had been specified.
! 
! Task
! 
! Write a function that can perform brace expansion on any input string,
! according to the following specification.
! 
! Demonstrate how it would be used, and that it passes the four test cases
! given below.
! 
! In the input string, balanced pairs of braces containing comma-separated
! substrings (details below) represent alternations that specify multiple
! alternatives which are to appear at that position in the output. In
! general, one can imagine the information conveyed by the input string as
! a tree of nested alternations interspersed with literal substrings, as
! shown in the middle part of the following diagram:
! 
! It{{em,alic}iz,erat}e{d,}
! 
! parse ―――――▶ ‌
! 
! It
! 
! ⎧ ⎨ ⎩
! 
! ⎧ ⎨ ⎩
! 
! em
! 
! ⎫ ⎬ ⎭
! 
! alic
! 
! iz
! 
! ⎫ ⎬ ⎭
! 
! erat
! 
! e
! 
! ⎧ ⎨ ⎩
! 
! d
! 
! ⎫ ⎬ ⎭
! 
! ‌
! 
! expand ―――――▶ ‌
! 
! <td style"padding:0">
! 
! Itemized Itemize Italicized Italicize
! 
! Iterated Iterate
! 
! input string
! 
! alternation tree
! 
! output (list of strings)
! 
! This tree can in turn be transformed into the intended list of output
! strings by, colloquially speaking, determining all the possible ways to
! walk through it from left to right while only descending into one branch
! of each alternation one comes across (see the right part of the
! diagram). When implementing it, one can of course combine the parsing
! and expansion into a single algorithm, but this specification discusses
! them separately for the sake of clarity.
! 
! Expansion of alternations can be more rigorously described by these
! rules:
! 
! a
! 
! ⎧ ⎨ ⎩
! 
! 2
! 
! ⎫ ⎬ ⎭
! 
! 1
! 
! b
! 
! ⎧ ⎨ ⎩
! 
! X
! 
! ⎫ ⎬ ⎭
! 
! Y
! 
! X
! 
! c
! 
! ⟶
! 
! a2bXc
! 
! a2bYc
! 
! a2bXc
! 
! a1bXc
! 
! a1bYc
! 
! a1bXc
! 
! -   An alternation causes the list of alternatives that will be produced
!     by its parent branch to be increased 𝑛-fold, each copy featuring one
!     of the 𝑛 alternatives produced by the alternation's child branches,
!     in turn, at that position.
! -   This means that multiple alternations inside the same branch are
!     cumulative (i.e. the complete list of alternatives produced by a
!     branch is the string-concatenating "Cartesian product" of its
!     parts).
! -   All alternatives (even duplicate and empty ones) are preserved, and
!     they are ordered like the examples demonstrate (i.e.
!     "lexicographically" with regard to the alternations).
! -   The alternatives produced by the root branch constitute the final
!     output.
! 
! Parsing the input string involves some additional complexity to deal
! with escaped characters and "incomplete" brace pairs:
! 
! a\\{\\\{b,c\,d}
! 
! ⟶
! 
! a\\
! 
! ⎧ ⎨ ⎩
! 
! \\\{b
! 
! ⎫ ⎬ ⎭
! 
! c\,d
! 
! {a,b{c{,{d}}e}f
! 
! ⟶
! 
! {a,b{c
! 
! ⎧ ⎨ ⎩
! 
! ‌
! 
! ⎫ ⎬ ⎭
! 
! {d}
! 
! e}f
! 
! -   An unescaped backslash which precedes another character, escapes
!     that character (to force it to be treated as literal). The
!     backslashes are passed along to the output unchanged.
! -   Balanced brace pairs are identified by, conceptually, going through
!     the string from left to right and associating each unescaped closing
!     brace that is encountered with the nearest still unassociated
!     unescaped opening brace to its left (if any). Furthermore, each
!     unescaped comma is associated with the innermost brace pair that
!     contains it (if any). With that in mind:
!     -   Each brace pair that has at least one comma associated with it,
!         forms an alternation (whose branches are the brace pair's
!         contents split at its commas). The associated brace and comma
!         characters themselves do not become part of the output.
!     -   Brace characters from pairs without any associated comma, as
!         well as unassociated brace and comma characters, as well as all
!         characters that are not covered by the preceding rules, are
!         instead treated as literals.
! 
! For every possible input string, your implementation should produce
! exactly the output which this specification mandates. Please comply with
! this even when it's inconvenient, to ensure that all implementations are
! comparable. However, none of the above should be interpreted as
! instructions (or even recommendations) for how to implement it. Try to
! come up with a solution that is idiomatic in your programming language.
! (See #Perl for a reference implementation.)
! 
!     
! 
!         {| class="wikitable" style="white-space: nowrap;"
! 
! |- ! Input (single string) ! Ouput (list/array of strings) |-
! style="vertical-align:top" | ~/{Downloads,Pictures}/*.{jpg,gif,png} |
! ~/Downloads/*.jpg
! 
! ~/Downloads/*.gif
! 
! ~/Downloads/*.png
! 
! ~/Pictures/*.jpg
! 
! ~/Pictures/*.gif
! 
! ~/Pictures/*.png
! 
! |- style="vertical-align:top" | Itmore }cowbell! | cowbell!
! 
! more cowbell!
! 
! gotta have more cowbell!
! 
! gotta have\, again\, more cowbell!
! 
! |- style="vertical-align:top" |
! {}} some }{,{\\{ edge, edge} \,}{ cases, {here} \\\\\} |
! {}} some }{,{\\ edge \,}{ cases, {here} \\\\\}
! 
! {}} some }{,{\\ edge \,}{ cases, {here} \\\\\} |}
! 
! -   -   Brace_expansion_using_ranges


