! Show how to iterate over the key-value pairs of an associative array,
! and print each pair out.
! 
! Also show how to iterate just over the keys, or the values, if there is
! a separate way to do that in your language.

H{ { "hi" "there" } { "a" "b" } } [ drop print ] assoc-each ! print keys
H{ { "hi" "there" } { "a" "b" } } [ nip print ] assoc-each ! print values
