! Create a function that takes a list of character names and a list of
! corresponding remarks and returns an XML document of elements each with
! a name attributes and each enclosing its remarks. All elements are to be
! enclosed in turn, in an outer element.
! 
! As an example, calling the function with the three names of:
! 
!     April
!     Tam O'Shanter
!     Emily
! 
! And three remarks of:
! 
!     Bubbly: I'm > Tam and <= Emily
!     Burns: "When chapman billies leave the street ..."
!     Short & shrift
! 
! Should produce the XML (but not necessarily with the indentation):
! 
!     <CharacterRemarks>
!         <Character name="April">Bubbly: I'm &gt; Tam and &lt;= Emily</Character>
!         <Character name="Tam O'Shanter">Burns: "When chapman billies leave the street ..."</Character>
!         <Character name="Emily">Short &amp; shrift</Character>
!     </CharacterRemarks>
! 
! The document may include an
! 
! declaration and document type declaration, but these are optional. If
! attempting this task by direct string manipulation, the implementation
! must include code to perform entity substitution for the characters that
! have entities defined in the XML 1.0 specification.
! 
! Note: the example is chosen to show correct escaping of XML strings.
! Note too that although the task is written to take two lists of
! corresponding data, a single mapping/hash/dictionary of names to remarks
! is also acceptable.
! 
! Note to editors: Program output with escaped characters will be viewed
! as the character on the page so you need to 'escape-the-escapes' to make
! the RC entry display what would be shown in a plain text viewer (See
! this). Alternately, output can be placed in <syntaxhighlight
! lang="xml"></syntaxhighlight> tags without any special treatment.

{ "April" "Tam O'Shanter" "Emily" } {
    "Bubbly: I'm > Tam and <= Emily"
    "Burns: \"When chapman billies leave the street ...\""
    "Short & shrift"
} print-remarks
