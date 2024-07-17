! Huffman encoding is a way to assign binary codes to symbols that reduces
! the overall number of bits used to encode a typical string of those
! symbols.
! 
! For example, if you use letters as symbols and have details of the
! frequency of occurrence of those letters in typical strings, then you
! could just encode each letter with a fixed number of bits, such as in
! ASCII codes. You can do better than this by encoding more frequently
! occurring letters such as e and a, with smaller bit strings; and less
! frequently occurring letters such as q and x with longer bit strings.
! 
! Any string of letters will be encoded as a string of bits that are
! no-longer of the same length per letter. To successfully decode such as
! string, the smaller codes assigned to letters such as 'e' cannot occur
! as a prefix in the larger codes such as that for 'x'.
! 
!     If you were to assign a code 01 for 'e' and code 011 for 'x', then
!     if the bits to decode started as 011... then you would not know if
!     you should decode an 'e' or an 'x'.
! 
! The Huffman coding scheme takes each symbol and its weight (or frequency
! of occurrence), and generates proper encodings for each symbol taking
! account of the weights of each symbol, so that higher weighted symbols
! have fewer bits in their encoding. (See the WP article for more
! information).
! 
! A Huffman encoding can be computed by first creating a tree of nodes:
! 
! []
! 
! 1.  Create a leaf node for each symbol and add it to the priority queue.
! 2.  While there is more than one node in the queue:
!     1.  Remove the node of highest priority (lowest probability) twice
!         to get two nodes.
!     2.  Create a new internal node with these two nodes as children and
!         with probability equal to the sum of the two nodes'
!         probabilities.
!     3.  Add the new node to the queue.
! 3.  The remaining node is the root node and the tree is complete.
! 
! Traverse the constructed binary tree from root to leaves assigning and
! accumulating a '0' for one branch and a '1' for the other at each node.
! The accumulated zeros and ones at each leaf constitute a Huffman
! encoding for those symbols and weights:
! 
! Task:
! 
! Using the characters and their frequency from the string:
! 
!     
! 
!         this is an example for huffman encoding
! 
! create a program to generate a Huffman encoding for each character as a
! table.


USING: kernel sequences combinators accessors assocs math hashtables math.order
sorting.slots classes formatting prettyprint ;

IN: huffman

! -------------------------------------
! CLASSES -----------------------------
! -------------------------------------

TUPLE: huffman-node
    weight element encoding left right ;

! For nodes
: <huffman-tnode> ( left right -- huffman )
    huffman-node new [ left<< ] [ swap >>right ] bi ;

! For leafs
: <huffman-node> ( element -- huffman )
    1 swap f f f huffman-node boa ;


! --------------------------------------
! INITIAL HASHTABLE --------------------
! --------------------------------------

<PRIVATE

! Increment node if it already exists
! Else make it and add it to the hash-table
: huffman-gen ( element nodes  -- )
    2dup at
    [ [ [ 1 + ] change-weight ] change-at ] 
    [ [ dup <huffman-node> swap ] dip set-at ] if ;

! Curry node-hash.  Then each over the seq
! to get the weighted values
: (huffman) ( nodes seq --  nodes )
    dup [ [ huffman-gen ] curry each ] dip ;

! ---------------------------------------
! TREE GENERATION -----------------------
! ---------------------------------------

: (huffman-weight) ( node1 node2 -- weight )
    [ weight>> ] dup bi* + ;

! Combine two nodes into the children of a parent
! node which has a weight equal to their collective
! weight
: (huffman-combine) ( node1 node2 -- node3 )
    [ (huffman-weight) ]
    [ <huffman-tnode> ] 2bi
    swap >>weight ;

! Generate a tree by combining nodes
! in the priority queue until we're
! left with the root node
: (huffman-tree) ( nodes -- tree )
    dup rest empty?
    [ first ] [
        { { weight>> <=> } } sort-by
        [ rest rest ] [ first ]
        [ second ] tri
        (huffman-combine) prefix
        (huffman-tree)
    ] if  ; recursive

! --------------------------------------
! ENCODING -----------------------------
! --------------------------------------

: (huffman-leaf?) ( node -- bool )
    [ left>>  huffman-node instance? ]
    [ right>> huffman-node instance? ] bi and not ;

: (huffman-leaf) ( leaf bit -- )
    swap encoding<< ;

DEFER: (huffman-encoding)

! Recursively walk the nodes left and right
: (huffman-node) ( bit nodes -- )
    [ 0 suffix ] [ 1 suffix ] bi
    [ [ left>> ] [ right>> ] bi ] 2dip
    [ swap ] dip
    [ (huffman-encoding) ] 2bi@ ;

: (huffman-encoding) ( bit nodes -- )
    over (huffman-leaf?)
    [ (huffman-leaf) ]
    [ (huffman-node) ] if ;

PRIVATE>

! -------------------------------
! USER WORDS --------------------
! -------------------------------

: huffman-print ( nodes -- )
    "Element" "Weight" "Code" "\n%10s\t%10s\t%6s\n" printf
    { { weight>> >=< } } sort-by
    [  [ encoding>> ] [ element>> ] [ weight>> ] tri
       "%8c\t%7d\t\t" printf  pprint "\n" printf ] each ;

: huffman ( sequence -- nodes )
    H{ } clone (huffman) values 
    [ (huffman-tree) { } (huffman-encoding) ] keep ;

! ---------------------------------
! USAGE ---------------------------
! ---------------------------------

! { 1 2 3 4 } huffman huffman-print
! "this is an example of a huffman tree" huffman huffman-print

! Element   Weight	  Code
!      	      7		{ 0 0 0 }
!     a	      4		{ 1 1 1 }
!     e	      4		{ 1 1 0 }
!     f	      3		{ 0 0 1 0 }
!     h	      2		{ 1 0 1 0 }
!     i	      2		{ 0 1 0 1 }
!     m	      2		{ 0 1 0 0 }
!     n	      2		{ 0 1 1 1 }
!     s	      2		{ 0 1 1 0 }
!     t	      2		{ 0 0 1 1 }
!     l	      1		{ 1 0 1 1 1 }
!     o	      1		{ 1 0 1 1 0 }
!     p	      1		{ 1 0 0 0 1 }
!     r	      1		{ 1 0 0 0 0 }
!     u	      1		{ 1 0 0 1 1 }
!     x	      1		{ 1 0 0 1 0 }

