! An array is a composite data type -- it can store multiple values, and
! so is in the collection category. The stored values are called elements
! of the array, and are accessed by a sequence of indices. In a program,
! indices may be a mixture of constant values or variables that allow the
! elements accessed to vary under program control. The indices of an array
! are totally ordered.
! 
! The implementation details of an array give rise to an important
! distinction between arrays and associative arrays.
! 
!     The implementation of arrays is based on setting the bounds of
!     indices of the array, the size of the array, normally by allocating
!     a contiguous region of memory to hold the elements of the array, and
!     using simple offset calculations on the indices from the origin of
!     the memory to access memory elements. Some languages support
!     extensions to allow such arrays to be resized, or re-shaped, in
!     which the memory area is adjusted, but extent elements are retained.
! 
!     By contrast, an associative array maps the association between index
!     "keys" and their associated values, generally using more complex
!     hash functions on the keys of the array to map them to their
!     corresponding elements (by pointers, references or memory addresses
!     of some sort). Associative arrays are referred to variously as
!     "hashes" (Perl), "maps" or "mappings" (Lua), or "dictionaries"
!     (Python), as well as "associative arrays" (AWK, ksh, and others).
!     The keys into associative arrays are normally not constrained to be
!     integers, unlike arrays, which generally required contiguous integer
!     ranges. Different languages may impose various constraints on these
!     keys. For example, in Perl, keys must always be strings, so 1, "1",
!     and 1.0, each of which stringifies to "1", are the same key, but
!     "1.0" is distinct from all of these. In PHP, keys must be strings or
!     integers; floats and booleans get implicitly converted to an
!     integer. Other languages (such as Python) may treat each type of
!     object as distinct. (See associative array for further discussion.)
! 
!     Non-associative arrays may have speed and memory consumption
!     advantages. Associative arrays have greater flexibility in types
!     used for keys, and generally obviate the need to implement searches
!     through the collection. (Each component on which one would search
!     can be implemented as a different associative array of references to
!     their corresponding values or records.)
! 
! Arrays with more than one index are called multidimensional arrays. For
! example, a matrix is a two-dimensional array.
! 
! Some languages (such as AWK) do not support true arrays; they merely
! emulate them through their associative arrays. Similarly, some languages
! emulate multi-dimensional arrays by concatenation of dimensional indices
! into keys (perhaps a peculiarity of AWK).
! 
! Common operations defined on arrays include:
! 
! -   Indexing: accessing an array element by its indices. (There is a one
!     to one mapping between an index and its corresponding element).
!     While the cost of indexing is O(1) on typical current machines, the
!     cost of indexing an element adjacent to a recently accessed element
!     is much faster than indexing an arbitrary random element of a large
!     array.
! -   Slicing: producing a subarray by putting some constraint on the
!     indices. For example, PL/1 provides extracting of a row or a column
!     of an array. In Ada any range of the index can be used in order to
!     extract a subarray from a single-dimensional array. In Python slices
!     can extract any contiguous subset of an array and extended slice
!     notation can extract elements in reversed order and/or by traversing
!     in a given "stride" --- for example a[100:0:-2] would return every
!     odd element from 100 to the beginning of the list: a[99], a[97], ...
!     a[1].
! -   Iteration over the array's elements. Some languages make this a
!     universal or implicit operation, some languages have a foreach loop
!     construct for array iteration, in others this must be done with
!     conventional looping and arithmetic.
! -   Iteration over the indices of an associative or sparse array.
! -   Querying the bounds of array indices (determining the maximum
!     element index of offset)
! -   Querying the indices of an associative array (determining if the
!     collection contains a value for any given key).
! -   Operations on indices (next, previous, range etc)
! -   Sorting the contents of the array to satisfy some relationship.
! -   Searching an array for the location(s) of some value(s)
! 
! Array programming languages provide operations applied to entire arrays,
! so programs in such languages often do not bother using index references
! (for example APL).
! 
! Multidimensional arrays in which the valid range of one index depends on
! the value of another are called ragged (also jagged). This term comes
! from a typical example of a ragged array, when a two-dimensional array
! is used to store strings of different length in its rows. When put on
! paper the right margin of the output become ragged.
! 
! The lower bound of non-associative arrays in many programming languages
! is commonly fixed at either 0 (C and relatives) or 1 (Old Fortran and
! relatives); or an arbitrary integer (Pascal and relatives, modern
! Fortran). In Ada any discrete type can used as an index. Zero-based
! indexing is best thought of in terms of the index being an offset from
! the beginning of the array. Thus the first element is located zero
! elements from this starting point. The alternative can be thought of as
! ordinal indexes referring to the first, second, ... and nth elements of
! the array.
! 
! In most programming languages, arrays are accessed by using the array
! brackets [ and ], e.g. in A[i]. However, exceptions exist, including
! REXX which instead uses the dot operator ., such as in A.i; Fortran, Ada
! and BASIC which use round parentheses A(i), and in lisp dialects which
! use constructions like (ELT A n) for accessing and (SETA A n new_val)
! for setting (Interlisp) or (vector-ref A n) for accessing and
! (vector-set! A n new_val) for setting (Scheme). No bracket indexing
! occurs in J, an array language; instead, the normal syntax of function
! creation and function calling applies.
! 
! Computational metrics
! 
! Access is O(1), appending is O(1), and insertion is O(n) for a single
! item.
! 
! Examples
! 
! -   letter frequency
! 
! Assembly
! 
! An array is simply a sequence of values stored in consecutive memory
! locations. Its beginning is typically defined with some sort of label
! that points to the address where that array is stored. Whether an array
! is mutable or immutable depends on the hardware; in older assembly
! languages, an array is only typically immutable if it's stored in ROM.
! Home computer software that is stored on disk or tape can define an
! array at compile time that can be mutable; ROM cartridge programs
! cannot. The syntax is the same for both, however. ROM cartridge programs
! will need to construct their array in ROM, copy it to RAM, and alter the
! copy.
! 
! Example using 6502 Assembly: <lang 6502asm>ArrayRAM equ $00
! 
! the beginning of an array, stored in zero page RAM
! 
! ArrayROM: db 0,5,10,15,20,25,30,35,40,45,50
! 
! on Commodore 64 (for example) these values can be modified at runtime, but on the NES they are read-only.
! 
! Indexing
! 
! Almost all assembly languages have a method of loading from a memory
! address offset by some sort of variable amount. That offset is the index
! into the array. Depending on the size of each element that index is
! multiplied by the number of bytes each element takes up. What
! constitutes an "element," "row," or "column" of the array is entirely
! decided by the programmer. Arrays in assembly are always zero-indexed.
! 
! Example using 68000 Assembly: <lang 68000devpac>LEA myArray,A0 ;loading
! a labeled array name like this loads the address of the zeroth element
! MOVE.W #4*5*1,D1 ;five elements per row, so to get the 4th row we
! multiply the row number by the elements per row,
! 
!                   ;times the number of bytes per element
! 
! LEA (A0,D1),A0 ;offset A0 by the row number LEA (2*1,A0),A0 ;column
! number times the number of bytes per element (the times 1s aren't needed
! but it's here for clarity) MOVE.B (A0),D0 ;load decimal 52 into D0
! 
! myArray: DC.B 10,11,12,13,14 ;typing the array in rows like this is only
! for the viewer's convenience - it means nothing to the CPU. DC.B
! 20,21,22,23,24 ;all 25 entries could have been on one line in the same
! order and it wouldn't change how they are stored. DC.B 30,31,32,33,34
! DC.B 40,41,42,43,44 DC.B 50,51,52,53,54 myArray_End: ;this label exists
! to mark the end of the array.
! 
! It is much easier to work with arrays in assembly if all rows are the
! same length. The best way to deal with a ragged or jagged array, such as
! an array of strings of different lengths, is to store pointers to the
! array entries rather than the intended entries themselves. This
! equalizes the size of all the elements of the array which makes it much
! easier to index. Another way to handle such arrays is with padding, by
! adding extra null bytes to the ends until all rows are the same length,
! but for many data types it's better to construct an array of pointers.
! 
! <lang 68000devpac>main:
! 
! goal: Print "Orange" to stdout
! 
! LEA Strings,A0 LEA (4,A0),A0 ;this is NOT a dereference operation, it
! merely adds 4 to A0. MOVE.L (A0),A0 ;now we dereference the pointer so
! that we have the address of "Orange" in A0.
! 
! If we did MOVE.B (A0),D0 now, we'd load the "O" in "Orange" into D0.
! 
! JSR PrintString ;or whatever you use to write to stdout RTS ;return
! 
! Strings: DC.L AppleAddress DC.L OrangeAddress DC.L GrapeAddress
! 
! AppleAddress: DC.B "Apple",0 even OrangeAddress: DC.B "Orange",0 even
! GrapeAddress: DC.B "Grape",0 even
! 
! In assembly, there is nothing stopping your program from indexing an
! array out of bounds! The computer doesn't have an understanding of where
! your array "ends," so asking it to return (for example) the 500th
! element of an array with only 25 elements is perfectly legal. This
! typically won't happen for arrays that aren't indexed based on user
! input, but be careful nonetheless. Indexing an array out of bounds and
! trying to read from it can cause segmentation faults on more modern
! machines, which is the operating system's way of preventing your code
! from reading memory that is outside of the program that is trying to
! index the array. Older CPUs don't have this sort of protection, and
! indexing out of bounds will read whatever is stored in memory at that
! location, which is why it falls into the realm of undefined behavior-
! the result entirely depends on how the code in your program is arranged.
! 
! Iteration
! 
! Iteration over the elements of an array is fairly straightforward.
! 
! Example using 68000 Assembly: <lang 68000devpac>LEA myArray,A0 loop:
! MOVE.B (A0)+,D0
! 
! As is, this example code will inevitably index out of bounds.
! In practice there will be some way to end the loop, typically a byte count or a null terminator.
! 
! JMP loop
! 
! Example using z80 Assembly: ld hl,myArray ;load the address of myArray
! into hl ld de,userRam ;load the address of work RAM into de ld
! bc,myArrayEnd-myArray ;assembler directive that auto-calculates the
! array size using labels placed at the beginning and end. ldir ;copy the
! entire contents of the array to work RAM
! 
! Skip-Counting
! 
! Skipping elements can be easily done with a "dummy read," whereby an
! auto-incrementing/decrementing addressing mode is used solely for
! updating the pointer, or by incrementing/decrementing a loop counter
! multiple times per loop. Example using 8086 Assembly: iterate: movsb
! ;store [ds:si] into [es:di], increment both pointers, and decrement cx.
! lodsb ;dummy read to increment the pointer and decrement cx. The value
! loaded into AL gets discarded. inc di ;increment destination index jcxz
! exitloop ;exit loop if cx equals zero. jmp iterate
! 
! Implementation of a reverse array slice such as a[100:0:-2] example for
! Python is much more difficult. First of all, computers cannot implicitly
! understand the concept of the "end" of an array. The start of an array
! is easy for a computer to grasp, it is simply a pointer to its first
! element. However, encoding an array's end point requires some form of
! metadata, such as a null terminator or an additional variable
! representing the array's maximum size. High-level languages typically
! handle this automatically.
! 
! Element Access
! 
! Access of an individual element of an array depends on the language.
! ;6502 Assembly lda $2000,x ;load the xth element of the array beginning
! at memory address $2000 lda $3022,y ;load the yth element of the array
! beginning at memory address $3022 lda ($20),y ;load the yth element of
! the array whose pointer is stored at consecutive memory addresses $0020
! and $0021
! 
! 68000 Assembly
! 
! move.b (4,A0,D1),D0 ;load into D0 the (4+D1.W)th element of the array
! whose beginning address is stored in A0.
! 
! 8086 Assembly
! 
! mov ax,[bx+di] ;load the BXth element of the array whose beginning is
! stored in DI, into AX.
! 
!               ;alternatively, load the DIth element of the array whose beginning is stored in BX, into AX.
! 
! ARM Assembly
! 
! ldr r0,[r1,#4] ;load the 1st (zero-indexed) element of the array whose
! pointer to its 0th element is stored in r1, into r0.
! 
! Encoding an Array's End
! 
! Null Terminator
! 
! This method is most commonly used with strings. An ASCII value that is
! not associated with any keyboard key, typically 0, is placed at the end
! of a string. In a typical PrintString assembly routine, the routine is
! given a pointer to the 0th entry of the string as its only parameter.
! The routine reads from the pointer, prints that letter, increments the
! pointer, and repeats until the terminator is read, at which point the
! routine ends. Without the terminator, the program would not know when to
! stop reading and eventually crash. A string variable in C will place a 0
! at the end of a string without you having to define it yourself. This
! method works well for strings and other arrays where the terminator's
! value is not a possible value for actual data. On more general arrays
! where the entries represent non-ASCII data, this causes problems where
! you have a datum that just so happens to equal the terminator.
! 
! Example using 8086 Assembly: PrintString:
! 
! input: [DS:SI] = string pointer
! 
! mov al,[ds:si] jz Terminated ;we've reached the terminator inc si call
! PrintChar ;call to hardware-specific printing routine jmp PrintString
! Terminated: ret
! 
! HelloText: db "Hello World",0 ;a value in quotes is its ASCII
! equivalent, anything else is a numeric value.
! 
! In cases like this, high-level languages often implement escape
! characters which when encountered in a string, result in a branch to a
! section that reads the next character without checking if it's a
! terminator or other control code. Effectively this removes the special
! meaning of that character but only if an escape character is before it.
! This concept is often reversed to allow the programmer to easily
! implement ASCII control characters, such as \n for new line (in ASCII
! this is represented by a 13 followed by a 10, for carriage return + line
! feed.) In this case the backslash signals to printf() that the next
! letter is associated with a particular ASCII control code. If the next
! character read is an "n" then ASCII 13 gets printed, followed by ASCII
! 10. After this, normal reading and printing resumes.
! 
! The example below shows a simple implementation of an escape character.
! The first instance of the null terminator gets printed as-is rather than
! used to end the routine.
! 
! Example using 8086 Assembly: PrintString:
! 
! modified to use the \ as an escape character.
! input: [DS:SI] = string pointer
! 
! mov al,[ds:si] inc si cmp al,5Ch ;ascii for backslash, this is the
! escape character
! 
!                ;notice that the check for the escape character happens before the check for the terminator.
! 
! jz EscapeNextChar cmp al,0h ;check the terminator jz Terminated ;we've
! reached the terminator call PrintChar ;call to hardware-specific
! printing routine jmp PrintString
! 
! EscapeNextChar: mov al,[ds:si] ;perform an additional read, except this
! read doesn't compare the fetched character to anything. inc si call
! PrintChar ;print that character as-is jmp PrintString ;go back to the
! loop's beginning, skipping the terminator check entirely.
! 
! Terminated: ret
! 
! HelloText: db "Hello World\",0,13,10,0
! 
! End Label
! 
! This method is best for pre-defined arrays. Its usage was shown in
! earlier examples. Most assemblers can create a constant based off simple
! arithmetic using labels. A label's numeric value is the address it gets
! assembled to, decided at assemble time. Placing another label
! immediately after the end of an array will point it to the next byte
! after that array. The assembler subtracts the array's beginning label
! from this value to create a size constant that you don't have to
! manually adjust if you change the number of entries the array has. This
! method can be used with array variables in conjunction with a null
! terminator and padding the distance between the terminator and the end
! of the range dedicated to storing array variables.
! 
! The major Achilles' heel of this method is that it only works on arrays
! that are of known length prior to assembling. In other words, you cannot
! make the array larger at runtime.
! 
! Example using 68000 Assembly: <lang 68000devpac>main: LEA myArray,a0
! MOVE.W #(MyArray_End-MyArray)-1,D7 ;the minus 1 corrects for DBRA, the
! subtraction of the two labels gives us the total byte count
! 
! for .W or .L sized data you may need to right-shift D7 by 1 or 2 respectively, depending on what you're doing
! 
! loop: MOVE.B (A0)+,D0 JSR PrintChar ;or whatever your implementation
! uses to write to stdout. DBRA D7,loop RTS ;exit program
! 
! MyArray: DC.B "Hello World" MyArray_End: EVEN ;to get the correct byte
! count, you'll need the EVEN directive AFTER the end label.
! 
! Size Value
! 
! This method is best for arrays that are not pre-defined. Placed before
! the 0th element of the array is its maximum size. This value's location
! relative to the 0th element is always the same, regardless of how long
! the array actually is. As such, the pointer to the 0th element can be
! offset by a fixed negative amount to get the size. Alternatively, rather
! than storing the size of the array, a pointer to the last element can
! also be stored in front of the array. This lets you use pointer
! arithmetic to calculate the array's size, by subtracting the pointer of
! the 0th element from the last. This method is commonly used in picture
! file formats to mark where the picture data ends.
! 
! Example using 68000 Assembly:
! 
! <lang 68000devpac>MyArray: DC.W 3,5 ;three rows, five columns
! 
! it would have also been sufficient to have "DC.W 15" instead of "DC.W 3,5".
! 
! DC.B 1,2,3,4,5 DC.B 6,7,8,9,10 DC.B 11,12,13,14,15
! 
! ATS
! 
! The array types built into ATS are an extremely complicated topic, and I
! shall mention only three points of interest.
! 
! 1.  ATS wants to prevent you from going outside the bounds of the array;
!     and it wants to do so without runtime checks. There are numerous
!     ways to get around that "desire", but the capability for strictness
!     is there.
! 2.  ATS wants to distinguish between the initialized and uninitialized
!     parts of an array. Again, you can get around this "desire", but the
!     capability to be rigorous is there.
! 3.  ATS arrays are basically C arrays. An array is a contiguous block of
!     memory at a particular machine address, with no other runtime
!     structure.
! 
! An array is represented by a pointer to the beginning of the memory
! block, as in C; but, furthermore, there is a view. The view exists only
! as a typechecking entity; there is no runtime code associated with it.
! Suppose you have a fully initialized array, called a, of fourteen int
! starting at address p. Then the view for the array may be written
! @[int][14] @ p or equivalently as array_v (int, p, 14) To access an
! element of the array, that view needs to be available to the
! typechecker. Let us suppose the view is in fact available, and that
! there are operator overrides to use the square brackets as (in this case
! one-dimensional) array indices. Then a program that says let val x =
! a[3] in a[4] := x end should be compilable, but one that says let val x
! = a[20] in a[30] := x end will trigger a type error, due to the
! out-of-bounds indices.
! 
! Above we assumed a was fully initialized. Working with an array that is
! not fully initialized can become quite complex, and I shall mention only
! that the view for a before it is initialized would be @[int?][14] @ p
! with a question mark. Fortunately there are routines in the prelude to
! fully initialize an array, for instance with a fill value such as zero
! or an empty string. There are also ways to fully deinitialize an array;
! to allocate an array in the heap, and to free one; to place an array in
! a stack frame; to make an array as a global variable.
! 
! The curious reader is encouraged to go to the ATS website for more
! information.
! 
! Fortran
! 
! Arrays have been available from the start, for each of the allowed
! standard types of variables: integer, real, complex, logical, and
! character, and their different precisions. They can be indexed only with
! integer values, and definitely not with text strings as in say Snobol -
! though one could place a short text into a small CHARACTER variable that
! is equivalenced to an INTEGER variable and use that integer as in a
! "hash table" scheme, possibly to good effect. Indexing starts with one,
! and the size is fixed by the declaration at compile time, thus REAL
! A(66) !Declares an array, elements one to sixty-six.
! 
!      A(3) = 1.1    !Assigns a value to the third element of A.
!      A(2) = 1.1
!      A(1) = 1.1
! 
! Higher dimensonality is available, with additional indices, thus given
! the declaration INTEGER B(12,9) individual elements would be accessed
! via the likes of B(12,6) = 7 The type includes the dimensionality so
! array B can only be referenced with two indices and A only with one,
! although it is possible to specify something like EQUIVALENCE (A,B)
! which means that the two names refer to the same storage; the arrays are
! overlaid, even if of different types. With careful organisation and a
! good plan, this can have positive benefits. Multi-dimensional arrays are
! stored in "column-major" order, which is to say that for consecutive
! elements in storage, the leftmost subscript varies most rapidly, so the
! order would be B(1,1), B(2,1), B(3,1), ... B(12,1), B(1,2), B(2,2), etc.
! This is important when explicit indexing is not used, as when only its
! name is given in a READ, WRITE, or DATA statement: values are processed
! in storage order. Thus, element B(12,6) is the sixth element of row
! twelve, and the next along in storage would be B(1,7), which is not the
! seventh element of row twelve.
! 
! There is no "array subscript" type or usage, whereby, given
! INTEGER XLAT(2) element B(i,j) might be accessed via B(XLAT) where
! XLAT(1) = i and XLAT(2) = j. One must use B(XLAT(1),XLAT(2))
! 
! An array is identical to a function of integer arguments, so in
! result = 3*F(X) + 7, the F might be a function (of one parameter, an
! integer), or, it might be an array of one dimension - unlike with Pascal
! where F[...] is definitely an array, and F(...) is definitely a
! function. If a declaration such as COMPLEX F(33) to make it an array
! does not appear in that program unit, F will be taken as being a
! function, and the declaration COMPLEX F should appear since otherwise F
! would be REAL, not COMPLEX because undeclared names have a type of
! INTEGER if they start with the letters I, J, K, L, M, or N, otherwise
! REAL. This could be useful in debugging, where function F will provide
! checking and trace output, etc. as well as supplying the correct value.
! Alas, Fortran does not offer the ability to write "palindromic"
! functions so although N = DAYNUM(Year,Month,Day) is perfectly valid,
! DAYNUM(Year,Month,Day) = N is not possible with functions, though
! standard with arrays.
! 
! There is no associative access facility, of the form "what indices of A
! satisfy this condition", except almost: the INDEX function, which
! however is allowed only for CHARACTER variables.
! L = INDEX("sometexts","text") will return 5, the location of the first
! occasion (counting characters from one) where the second parameter
! exactly matches a portion of the first.
! 
! With F90 came the standardisation of many expanded facilities. Arrays
! can be defined with any lower bound instead of just one, as in
! REAL A(1951:2017), and with it now possible to define compound types,
! there can be arrays of such aggregates. Type matching remains strict,
! however. There is also much greater flexibility in manipulating arrays
! without explicit looping. The assignments above could be done via
! A(3:1:-1) = 1.1 or, more normally, by A(1:3) = 1.1 The scheme is
! start:stop:step with the :step part unnecessary if it is one, as with
! DO-loops. Simplicity of syntax can however lead to surprises. If a 4 x 4
! portion of array B was selected as a parameter (to some
! matrix-manipulation routine, say) as in CALL TRANSPOSE(B(5:8,6:9)), then
! the scattered elements of B would be copied into a 4x4 work area first,
! because the subroutine deals with array elements in contiguous storage:
! this is copy-in, copy-out rather than the normal pass-by-reference, and
! if the arrays are large, this will be very slow as well as producing
! some subtle differences in behaviour.
! 
! Similarly, F90 provides additional functions applicable to arrays; there
! is a TRANSPOSE function, and MAXLOC(A) returns the index of the (first
! encountered?) maximum value of the array, but there is still no
! extension for INDEX to other types. However, new statements provide some
! more associative processing, as in WHERE(A > 0) A = 1/A for a simple
! case, and similarly, FOR ALL (I = 1:N, A(I) > 0) A(I) = 1/A(I)
! potentially executes every assignment in parallel. Even so, this is
! still not an associative memory usage whereby the memory storage device
! identifies matching indices by its own mysterious inner workings, as
! with on-chip L1 "cache" memory and the like.
! 
! Array sizes are no longer always fixed at compile time: on entry to a
! subroutine or function it can declare an array of a size determined by
! that occasion (as in Algol since the 1960s), and arrays can be
! explicitly allocated and de-allocated storage according to program
! logic. But, their type and dimensionality remain fixed.
! 
! Arrays remain resolutely rectilinear in shape. There is no direct
! facility to enable "triangular" arrays, still less ragged arrays.
! Triangular (and potentially other shape) arrays can be attained with a
! little effort: most simply, use a rectilinear array and waste the unused
! portion, otherwise, use a one-dimensional array and calculate offsets
! into it. But it may be possible to employ two triangular arrays, that
! can be fitted into a rectilinear array, possibly with special treatment
! of the diagonal elements; if so, one must be rigorous about keeping
! track of which has what subscripts! Escalating to three (or more)
! dimensions is quite possible, but, a calm and resolute mind is needed.
! As for ragged arrays, F90 facilities are required: consider TYPE AROW
! 
!  REAL, ALLOCATABLE:: COL(:)
! END TYPE AROW
! TYPE(AROW) A(66)
! 
! This declares an array of sixty-six rows, where A(r,c) would be accessed
! via A(r).COL(c), but first the code would have to execute
! ALLOCATE(A(r).COL(first:last)) for every row that is to be used to
! acquire storage for it. Such usage will not be as swift as with plain
! arrays.
! 
! Pascal
! 
! This defines an array suitable to hold a 64x64 truecolor image (i.e.
! red, green and blue RGB values all can go from 0 to 255) and then sets
! the color of a single pixel type
! 
!  color = red, green, blue;
!  rgbvalue = 0 .. 255;
! 
! var
! 
!  picture: array[0 .. 63, 0 .. 63, color] of rgbvalue
! 
! begin
! 
!  { set pixel (4,7) to yellow }
!  picture[4, 7, red]   := 255;
!  picture[4, 7, green] := 255;
!  picture[4, 7, blue]  := 0
! 
! end.
! 
! jq
! 
! jq's data types are the same as JSON's data types, and thus jq's arrays
! can hold any combination of JSON entities. jq arrays are indexed
! beginning with 0, so ["hello"][0] evaluates to "hello".
! 
! Immutability
! 
! jq offers a comprehensive collection of operators and functions for
! array processing, but to understand them it must be appreciated that all
! data values in jq are immutable. In particular, if a is an array, a jq
! expression such as "a[0] = 1" may give the appearance of updating the
! array, but it simply returns an array identical to a except for the
! first element.
! 
! In fact, an expression such as "a[m] = 1" (where m is some non-negative
! integer) does not require that the length of the array, a, be at least
! (m+1). The expression should instead be interpreted to mean: produce an
! array derived from a such that a[m] == 1. If necessary, jq will add
! "null" elements to achieve this requirement. Thus, one way to create an
! array of m+1 nulls is to write:[][m] = null It might seem that jq must
! be horrendously inefficient because of immutability, but in fact, jq is
! fast because of compiler optimizations.
! 
! Basic Array Operations
! 
! Assuming a and b are arrays, and if m and n are non-negative integers:
! [][n] = null # => an array with (1+n) nulls [range(0;n)] # => [0,1, ...
! (n-1)] a | length # => the length of a a + b # => the concatenation of a
! followed by b a[n] # => the element at offset n (or null) a[-1] # => the
! last element (or null) a[m:n] # => the subarray [a[m], ..., a[n-1]]
! 
! Streams and Arrays
! 
! jq provides support for streams of JSON entities, and thus the syntax
! for converting between an array and the stream of entities that an array
! contains is fundamental to jq. In brief:
! 
! 1.  If a is an array, then the expression
! 
! a[]
! 
! 1.  will produce the stream of a's entities.
! 
! 1.  Conversely, if S is a stream of entities,
! 2.  then they can be gathered together using the syntax:
! 
! [ S ] For example, if S is the stream (1,2,3), then [(1,2,3)] ==
! [1,2,3].
! 
! This highlights an important point about "," in jq: the comma is not
! merely a syntactic marker but an operator.
! 
! map/reduce
! 
! jq's "map" filter is quite conventional, e.g. [1,2,3] | map(-(.)) # =>
! [-1, -2, -3]The reduce filter, however, has a special syntax that makes
! it very powerful. In brief, the syntax is:reduce S as $var (init;
! update) where S is an expression producing a stream of values, and init
! and update are jq expressions. The reduction takes place by setting a
! hidden variable to the value of "init" initially, and then performing
! the update on the hidden variable as specified by "update" for each
! value, $var, in the stream. The result of the reduction is the final
! value of the hidden variable.
! 
! For example, here is a toy example followed by an efficient computation
! of n! (factorial n):reduce [1,2,3][] as $i (0; . + $i) # => 6
! 
! reduce range(2;n+1) as $i (1; . * $i) # => n!
! 
! =


