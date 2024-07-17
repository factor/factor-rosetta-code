! Define and give an example of the Amb operator.
! 
! The Amb operator (short for "ambiguous") expresses nondeterminism. This
! doesn't refer to randomness (as in "nondeterministic universe") but is
! closely related to the term as it is used in automata theory
! ("non-deterministic finite automaton").
! 
! The Amb operator takes a variable number of expressions (or values if
! that's simpler in the language) and yields a correct one which will
! satisfy a constraint in some future computation, thereby avoiding
! failure.
! 
! Problems whose solution the Amb operator naturally expresses can be
! approached with other tools, such as explicit nested iterations over
! data sets, or with pattern matching. By contrast, the Amb operator
! appears integrated into the language. Invocations of Amb are not wrapped
! in any visible loops or other search patterns; they appear to be
! independent.
! 
! Essentially Amb(x, y, z) splits the computation into three possible
! futures: a future in which the value x is yielded, a future in which the
! value y is yielded and a future in which the value z is yielded. The
! future which leads to a successful subsequent computation is chosen. The
! other "parallel universes" somehow go away. Amb called with no arguments
! fails.
! 
! For simplicity, one of the domain values usable with Amb may denote
! failure, if that is convenient. For instance, it is convenient if a
! Boolean false denotes failure, so that Amb(false) fails, and thus
! constraints can be expressed using Boolean expressions like Amb(x * y ==
! 8) which unless x and y add to four.
! 
! A pseudo-code program which satisfies this constraint might look like:
! 
!     let x = Amb(1, 2, 3)
!     let y = Amb(7, 6, 4, 5)
!     Amb(x * y = 8)
!     print x, y
! 
! The output is 2 4 because Amb(1, 2, 3) correctly chooses the future in
! which x has value 2, Amb(7, 6, 4, 5) chooses 4 and consequently
! Amb(x * y = 8) produces a success.
! 
! Alternatively, failure could be represented using strictly Amb():
! 
!     unless x * y = 8 do Amb()
! 
! Or else Amb could take the form of two operators or functions: one for
! producing values and one for enforcing constraints:
! 
!     let x = Ambsel(1, 2, 3)
!     let y = Ambsel(4, 5, 6)
!     Ambassert(x * y = 8)
!     print x, y
! 
! where Ambassert behaves like Amb() if the Boolean expression is false,
! otherwise it allows the future computation to take place, without
! yielding any value.
! 
! The task is to somehow implement Amb, and demonstrate it with a program
! which chooses one word from each of the following four sets of character
! strings to generate a four-word sentence:
! 
! 1.  "the" "that" "a"
! 2.  "frog" "elephant" "thing"
! 3.  "walked" "treaded" "grows"
! 4.  "slowly" "quickly"
! 
! The constraint to be satisfied is that the last character of each word
! (other than the last) is the same as the first character of its
! successor.
! 
! The only successful sentence is "that thing grows slowly"; other
! combinations do not satisfy the constraint and thus fail.
! 
! The goal of this task isn't to simply process the four lists of words
! with explicit, deterministic program flow such as nested iteration, to
! trivially demonstrate the correct output. The goal is to implement the
! Amb operator, or a facsimile thereof that is possible within the
! language limitations.

USING: backtrack continuations kernel prettyprint sequences ;
IN: amb

CONSTANT: words {
    { "the" "that" "a" }
    { "frog" "elephant" "thing" }
    { "walked" "treaded" "grows" }
    { "slowly" "quickly"  }
}

: letters-match? ( str1 str2 -- ? ) [ last ] [ first ] bi* = ;

: sentence-match? ( seq -- ? ) dup rest [ letters-match? ] 2all? ;

: select ( seq -- seq' ) [ amb-lazy ] map ;

: search ( -- )
    words select dup sentence-match? [ " " join ] [ fail ] if . ;

MAIN: search
