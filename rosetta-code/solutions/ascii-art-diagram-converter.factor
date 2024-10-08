! Given the RFC 1035 message diagram from Section 4.1.1 (Header section
! format) as a string: http://www.ietf.org/rfc/rfc1035.txt
! 
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |                      ID                       |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |QR|   Opcode  |AA|TC|RD|RA|   Z    |   RCODE   |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |                    QDCOUNT                    |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |                    ANCOUNT                    |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |                    NSCOUNT                    |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! |                    ARCOUNT                    |
! +--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
! 
! Where (every column of the table is 1 bit):
! 
! ID is 16 bits
! QR = Query (0) or Response (1)
! Opcode = Four bits defining kind of query:
!   0:    a standard query (QUERY)
!   1:    an inverse query (IQUERY)
!   2:    a server status request (STATUS)
!   3-15: reserved for future use
! AA = Authoritative Answer bit
! TC = Truncation bit
! RD = Recursion Desired bit
! RA = Recursion Available bit
! Z = Reserved
! RCODE = Response code
! QC = Question Count
! ANC = Answer Count
! AUC = Authority Count
! ADC = Additional Count
! 
! Write a function, member function, class or template that accepts a
! similar multi-line string as input to define a data structure or
! something else able to decode or store a header with that specified bit
! structure.
! 
! If your language has macros, introspection, code generation, or powerful
! enough templates, then accept such string at compile-time to define the
! header data structure statically.
! 
! Such "Header" function or template should accept a table with 8, 16, 32
! or 64 columns, and any number of rows. For simplicity the only allowed
! symbols to define the table are + - | (plus, minus, pipe), and
! whitespace. Lines of the input string composed just of whitespace should
! be ignored. Leading and trailing whitespace in the input string should
! be ignored, as well as before and after each table row. The box for each
! bit of the diagram takes four chars "+--+". The code should perform a
! little of validation of the input string, but for brevity a full
! validation is not required.
! 
! Bonus: perform a thoroughly validation of the input string.


