! Create a set of data types based upon inheritance. Each data type or
! class should have a print command that displays the contents of an
! instance of that class to standard output. Create instances of each
! class in your inheritance hierarchy and display them to standard output.
! Write each of the objects to a file named objects.dat in binary form
! using serialization or marshalling. Read the file objects.dat and print
! the contents of each serialized object.

USING: accessors combinators.extras io io.encodings.binary
io.files io.files.info kernel prettyprint serialize ;
IN: rosetta-code.object-serialization

! Define two classes, item and armor. armor is a subclass of
! item.

TUPLE: item name value ;
TUPLE: armor < item physical-resistance fire-resistance ;

! Define boa constructors for both classes using C: shorthand.
! boa means By Order of Arguments, and yes, this is a pun on boa
! constrictors.

C: <item> item
C: <armor> armor

! Create three example items and print them out
! non-destructively.

"Fish scales" 0.05 <item>
"Gold piece" 1 <item>
"Breastplate of Ashannar" 50,000 55 30 <armor>
[ [ . ] keep ] tri@ nl

! Serialize the three objects to a binary file named
! objects.dat.

"Serializing objects to objects.dat . . . " print
"objects.dat" binary [ [ serialize ] tri@ ] with-file-writer

! Check that objects.dat exists.

"objects.dat exists? " write "objects.dat" exists? .
"Size on disk: " write "objects.dat" file-info size>> pprint
" bytes" print nl

! Deserialize three objects from objects.dat.

"Deserializing objects from objects.dat . . . " print nl
"objects.dat" binary [ [ deserialize ] thrice ] with-file-reader

! Print out deserialized objects.

[ . ] tri@
