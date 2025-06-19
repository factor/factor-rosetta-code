! Create a simple DOM and having it serialize to:
! 
!  
!      
!          Some text here
!      
!  

USING: xml.syntax xml.writer ;

<XML <root><element>Some text here</element></root> XML>
pprint-xml

USING: sequences xml.syntax xml.writer ;

3 [XML <element>Some text here</element> XML] <repetition>
[XML <element2><element3>1.0</element3></element2> XML] append
<XML <root><-></root> XML>
pprint-xml
