! Load a JSON string into a data structure. Also, create a new data
! structure and serialize it into JSON.
! 
! Use objects and arrays (as appropriate for your language) and make sure
! your JSON is valid (https://jsonformatter.org).


USING: json.writer json.reader ;

SYMBOL: foo

! Load a JSON string into a data structure
"[[\"foo\",1],[\"bar\",[10,\"apples\"]]]" json> foo set


! Create a new data structure and serialize into JSON
{ { "blue" { "ocean" "water" } } >json

