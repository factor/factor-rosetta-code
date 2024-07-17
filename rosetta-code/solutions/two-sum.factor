! Task
! 
! Given a sorted array of integers (with possibly duplicates), is it
! possible to find a pair of integers from that array that sum up to a
! given sum? If so, return indices of the two integers or an empty array
! if not. The solution is not necessarily unique.
! 
! Example
! 
! Given numbers = [0, 2, 11, 19, 90], sum = 21,
! Because numbers[1] + numbers[3] = 2 + 19 = 21,
! return [1, 3].
! 
! Source
! 
! Stack Overflow: Find pair of numbers in array that add to given sum

USING: combinators fry kernel locals math prettyprint sequences ;
IN: rosetta-code.two-sum

:: two-sum ( seq target -- index-pair )
    0 seq length 1 - :> ( x! y! ) [
        x y [ seq nth ] bi@ + :> sum {
            { [ sum target = x y = or ] [ f ] }
            { [ sum target > ] [ y 1 - y! t ] }
            [ x 1 + x! t ]
        } cond
    ] loop
    x y = { } { x y } ? ;
    
{ 21 55 11 } [ '[ { 0 2 11 19 90 } _ two-sum . ] call ] each
