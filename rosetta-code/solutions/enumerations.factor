! Task:
! 
! Create an enumeration of constants with and without explicit values.

IN: scratchpad { "sun" "mon" "tue" "wed" "thur" "fri" "sat" } <enum>

--- Data stack:
T{ enum f ~array~ }
IN: scratchpad [ 1 swap at ] [ keys ] bi

--- Data stack:
"mon"
{ 0 1 2 3 4 5 6 }

IN: scratchpad USE: alien.syntax
IN: scratchpad ENUM: day sun mon { tue 42 } wed thur fri sat ;
IN: scratchpad 1 <day>

--- Data stack:
mon
IN: scratchpad 42 <day>

--- Data stack:
mon
tue
