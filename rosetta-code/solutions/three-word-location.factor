! If one were to enter the words: 'softly affiliate activation' at the
! what3words.com site, the response would be a location in Walt Disney
! World. The latitude and longitude for that spot is 28.3852 -81.5638.
! Using that service enables anyone to specify any place on the Earth with
! three words.
! 
! Task: Provide a similar solution - Display a location on the Earth with
! three words derived from a latitude longitude pair.
! 
! For: latitude = 28.3852 longitude = -81.5638 Display: W18497 W11324
! W01322
! 
! Implementation:
! 
! Build an array of 28126, 6 character words in the form W00000 thru
! W28125.
! 
! Convert latitude and longitude into positive integers.
! 
! Build a 43 bit integer containing latitude (21 bits) and longitude (22
! bits).
! 
! Isolate most significant 15 bits for word 1 index.
! 
! Isolate next 14 bits for word 2 index.
! 
! Isolate next 14 bits for word 3 index.
! 
! Fetch each word from the word array.
! 
! Display the words.
! 
! Reverse the procedure and display the original latitude and longitude.
! 
! Extra credit: Find a way to populate the word array with actual words.


