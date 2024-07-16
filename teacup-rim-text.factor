! On a set of coasters we have, there's a picture of a teacup. On the rim
! of the teacup the word TEA appears a number of times separated by bullet
! characters (•).
! 
! It occurred to me that if the bullet were removed and the words run
! together, you could start at any letter and still end up with a
! meaningful three-letter word.
! 
! So start at the T and read TEA. Start at the E and read EAT, or start at
! the A and read ATE.
! 
! That got me thinking that maybe there are other words that could be used
! rather that TEA. And that's just English. What about Italian or Greek or
! ... um ... Telugu.
! 
! For English, we will use the unixdict (now) located at: unixdict.txt.
! 
! (This will maintain continuity with other Rosetta Code tasks that also
! use it.)
! 
! Task:
! 
! Search for a set of words that could be printed around the edge of a
! teacup. The words in each set are to be of the same length, that length
! being greater than two (thus precluding AH and HA, for example.)
! 
! Having listed a set, for example [ate tea eat], refrain from displaying
! permutations of that set, e.g.: [eat tea ate] etc.
! 
! The words should also be made of more than one letter (thus precluding
! III and OOO etc.)
! 
! The relationship between these words is (using ATE as an example) that
! the first letter of the first becomes the last letter of the second. The
! first letter of the second becomes the last letter of the third. So ATE
! becomes TEA and TEA becomes EAT.
! 
! All of the possible permutations, using this particular permutation
! technique, must be words in the list.
! 
! The set you generate for ATE will never included the word ETA as that
! cannot be reached via the first-to-last movement method.
! 
! Display one line for each set of teacup rim words.

USING: combinators.short-circuit fry grouping hash-sets
http.client kernel math prettyprint sequences sequences.extras
sets sorting splitting ;

"https://www.mit.edu/~ecprice/wordlist.10000" http-get nip
"\n" split [ { [ length 3 < ] [ all-equal? ] } 1|| ] reject
[ [ all-rotations ] map ] [ >hash-set ] bi
'[ [ _ in? ] all? ] filter [ natural-sort ] map members .
