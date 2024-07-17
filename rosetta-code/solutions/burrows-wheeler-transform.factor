! The Burrows–Wheeler transform (BWT, also called block-sorting
! compression) rearranges a character string into runs of similar
! characters.
! 
! This is useful for compression, since it tends to be easy to compress a
! string that has runs of repeated characters by techniques such as
! move-to-front transform and run-length encoding.
! 
! More importantly, the transformation is reversible, without needing to
! store any additional data.
! 
! The BWT is thus a "free" method of improving the efficiency of text
! compression algorithms, costing only some extra computation.
! 
! Source: Burrows–Wheeler transform

USING: formatting io kernel math.transforms.bwt sequences ;
{
    "banana" "dogwood" "TO BE OR NOT TO BE OR WANT TO BE OR NOT?"
    "SIX.MIXED.PIXIES.SIFT.SIXTY.PIXIE.DUST.BOXES"
} [
    [ print ] [ bwt ] bi
    2dup "  bwt-->%3d %u\n" printf
    ibwt "  ibwt->    %u\n" printf nl
] each
