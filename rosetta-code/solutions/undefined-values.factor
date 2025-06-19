! 

42 .   ! 42

TUPLE: foo bar ;
foo new bar>> .   ! f

TUPLE: my-tuple { n integer } ;
my-tuple new n>> .   ! 0

SYMBOL: n
n get .   ! f

\ + get .   ! f

[let
    2 :> n   ! There is no other way!
    0 1 :> ( a b )
]
