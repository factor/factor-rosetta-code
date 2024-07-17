! An anadrome is similar to a palindrome except, rather than spelling the
! same word or phrase when reversed, it spells a different word or phrase.
! An anadrome is a special case of an anagram.
! 
! Anadrome is a portmanteau of the words anagram and palindrome.
! 
! For instance, regal and lager are anadromes.
! 
! Task
! 
! Using the words.txt file from https://github.com/dwyl/english-words,
! find and display all of the anadrome pairs with more than 6 characters.
! 
! Each word pair should only show up one time in the list.
! 
! Alternate download location.

USING: assocs grouping hash-sets io.encodings.ascii io.files
kernel math prettyprint sequences sets sets.extras ;

"words.txt" ascii file-lines [ length 6 > ] filter dup >hash-set '[ reverse _ in? ] filter
[ reverse ] zip-with [ all-equal? ] reject [ fast-set ] unique-by .
