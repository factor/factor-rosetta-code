! Many programming languages provide convenient ways to look for a known
! value in a simple list of strings or numbers.
! 
! But what if the elements of the list are themselves compound
! records/objects/data-structures, and the search condition is more
! complex than a simple equality test?
! 
! Write a function/method/etc. that can find the first element in a given
! list matching a given condition.
! 
! It should be as generic and reusable as possible.
! 
! (Of course if your programming language already provides such a feature,
! you can use that instead of recreating it.)
! 
! Then to demonstrate its functionality, create the data structure
! specified under #Data set, and perform on it the searches specified
! under #Test cases.
! 
! The data structure to be used contains the names and populations (in
! millions) of the 10 largest metropolitan areas in Africa, and looks as
! follows when represented in JSON:
! 
!     [
!       { "name": "Lagos",                "population": 21.0  },
!       { "name": "Cairo",                "population": 15.2  },
!       { "name": "Kinshasa-Brazzaville", "population": 11.3  },
!       { "name": "Greater Johannesburg", "population":  7.55 },
!       { "name": "Mogadishu",            "population":  5.85 },
!       { "name": "Khartoum-Omdurman",    "population":  4.98 },
!       { "name": "Dar Es Salaam",        "population":  4.7  },
!       { "name": "Alexandria",           "population":  4.58 },
!       { "name": "Abidjan",              "population":  4.4  },
!       { "name": "Casablanca",           "population":  3.98 }
!     ]
! 
! However, you shouldn't parse it from JSON, but rather represent it
! natively in your programming language.
! 
! -   The top-level data structure should be an ordered collection (i.e. a
!     list, array, vector, or similar).
! -   Each element in this list should be an associative collection that
!     maps from keys to values (i.e. a struct, object, hash map,
!     dictionary, or similar).
! -   Each of them has two entries: One string value with key "name", and
!     one numeric value with key "population".
! -   You may rely on the list being sorted by population count, as long
!     as you explain this to readers.
! 
! If any of that is impossible or unreasonable in your programming
! language, then feel free to deviate, as long as you explain your reasons
! in a comment above your solution.
! 
!   Search                                                                                     Expected result
!   ------------------------------------------------------------------------------------------ -------------------
!   Find the (zero-based) index of the first city in the list whose name is "Dar Es Salaam"    6
!   Find the name of the first city in this list whose population is less than 5 million       Khartoum-Omdurman
!   Find the population of the first city in this list whose name starts with the letter "A"   4.58
! 
! If your programming language supports higher-order programming, then the
! most elegant way to implement the requested functionality in a generic
! and reusable way, might be to write a function (maybe called
! "find_index" or similar), that takes two arguments:
! 
! 1.  The list to search through.
! 2.  A function/lambda/closure (the so-called "predicate"), which will be
!     applied in turn to each element in the list, and whose boolean
!     return value defines whether that element matches the search
!     requirement.
! 
! If this is not the approach which would be most natural or idiomatic in
! your language, explain why, and show what is.
! 
! -   Search a list

USING: accessors io kernel math prettyprint sequences ;
IN: rosetta-code.search-list

TUPLE: city name pop ;

CONSTANT: data {
    T{ city f "Lagos" 21.0 }
    T{ city f "Cairo" 15.2 }
    T{ city f "Kinshasa-Brazzaville" 11.3 }
    T{ city f "Greater Johannesburg" 7.55 }
    T{ city f "Mogadishu" 5.85 }
    T{ city f "Khartoum-Omdurman" 4.98 }
    T{ city f "Dar Es Salaam" 4.7 }
    T{ city f "Alexandria" 4.58 }
    T{ city f "Abidjan" 4.4 }
    T{ city f "Casablanca" 3.98 }
}

! Print the index of the first city named Dar Es Salaam.
data [ name>> "Dar Es Salaam" = ] find drop .

! Print the name of the first city with under 5 million people.
data [ pop>> 5 < ] find nip name>> print

! Print the population of the first city starting with 'A'.
data [ name>> first CHAR: A = ] find nip pop>> .
