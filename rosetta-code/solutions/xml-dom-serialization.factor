! Create a simple DOM and having it serialize to:
! 
!  <?xml version="1.0" ?>
!  <root>
!      <element>
!          Some text here
!      </element>
!  </root>

USING: xml.syntax xml.writer ;

<XML <root><element>Some text here</element></root> XML>
pprint-xml

USING: sequences xml.syntax xml.writer ;

3 [XML <element>Some text here</element> XML] <repetition>
[XML <element2><element3>1.0</element3></element2> XML] append
<XML <root><-></root> XML>
pprint-xml
