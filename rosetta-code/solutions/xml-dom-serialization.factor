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
