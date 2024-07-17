! Task: Find numbers in base 10 that are palindromic in bases 2, 4, and 16, where n < 25,000

USING: io kernel math.parser prettyprint sequences ;

25,000 <iota> [
    { 2 4 16 } [ >base ] with map [ dup reverse = ] all?
] filter [ pprint bl ] each nl
