! Task:
! 
! Demonstrate how to compare two strings from within the language and how
! to achieve a lexical comparison.
! 
! The task should demonstrate:
! 
! -   Comparing two strings for exact equality
! -   Comparing two strings for inequality (i.e., the inverse of exact
!     equality)
! -   Comparing two strings to see if one is lexically ordered before than
!     the other
! -   Comparing two strings to see if one is lexically ordered after than
!     the other
! -   How to achieve both case sensitive comparisons and case insensitive
!     comparisons within the language
! -   How the language handles comparison of numeric strings if these are
!     not treated lexically
! -   Demonstrate any other kinds of string comparisons that the language
!     provides, particularly as it relates to your type system.
! 
! For example, you might demonstrate the difference between
! generic/polymorphic comparison and coercive/allomorphic comparison if
! your language supports such a distinction.
! 
! Here "generic/polymorphic" comparison means that the function or
! operator you're using doesn't always do string comparison, but bends the
! actual semantics of the comparison depending on the types one or both
! arguments; with such an operator, you achieve string comparison only if
! the arguments are sufficiently string-like in type or appearance.
! 
! In contrast, a "coercive/allomorphic" comparison function or operator
! has fixed string-comparison semantics regardless of the argument type;
! instead of the operator bending, it's the arguments that are forced to
! bend instead and behave like strings if they can, and the operator
! simply fails if the arguments cannot be viewed somehow as strings. A
! language may have one or both of these kinds of operators; see the Raku
! entry for an example of a language with both kinds of operators.
! 
! Category:Basic language learning Category:Simple

USING: ascii math.order sorting.human ;

IN: scratchpad "foo" "bar" = . ! compare for equality
f
IN: scratchpad "foo" "bar" = not . ! compare for inequality
t
IN: scratchpad "foo" "bar" before? . ! lexically ordered before?
f
IN: scratchpad "foo" "bar" after? . ! lexically ordered after?
t
IN: scratchpad "Foo" "foo" <=> . ! case-sensitive comparison
+lt+
IN: scratchpad "Foo" "foo" [ >lower ] bi@ <=> . ! case-insensitive comparison
+eq+
IN: scratchpad "a1" "a03" <=> . ! comparing numeric strings
+gt+
IN: scratchpad "a1" "a03" human<=> . ! comparing numeric strings like a human
+lt+
