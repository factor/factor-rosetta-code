! Task:
! 
! Show how to return more than one value from a function.

USING: io kernel math prettyprint ;
IN: script

: */ ( x y -- x*y x/y )
    [ * ] [ / ] 2bi ;

15 3 */

[ "15 * 3 = " write . ]
[ "15 / 3 = " write . ] bi*
