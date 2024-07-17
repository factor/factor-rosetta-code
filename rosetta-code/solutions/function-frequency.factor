! Display - for a program or runtime environment (whatever suits the style
! of your language) - the top ten most frequently occurring functions (or
! also identifiers or tokens, if preferred).
! 
! This is a static analysis: The question is not how often each function
! is actually executed at runtime, but how often it is used by the
! programmer.
! 
! Besides its practical usefulness, the intent of this task is to show how
! to do self-inspection within the language.

USING: accessors kernel math.statistics prettyprint sequences
sequences.deep source-files vocabs words ;

"resource:core/sequences/sequences.factor" "sequences"
[ path>source-file top-level-form>> ]
[ vocab-words [ def>> ] [ ] map-as ] bi* compose [ word? ]
deep-filter sorted-histogram <reversed> 7 head .
