! Goal:
! 
! Convert UPC bar codes to decimal.
! 
! Specifically:
! 
! The UPC standard is actually a collection of standards -- physical
! standards, data format standards, product reference standards...
! 
! Here, in this task, we will focus on some of the data format standards,
! with an imaginary physical+electrical implementation which converts
! physical UPC bar codes to ASCII (with spaces and # characters
! representing the presence or absence of ink).
! 
! Sample input:
! 
! Below, we have a representation of ten different UPC-A bar codes read by
! our imaginary bar code reader:
! 
!              # #   # ##  #  ## #   ## ### ## ### ## #### # # # ## ##  #   #  ##  ## ###  # ##  ## ### #  # #       
!             # # #   ##   ## # #### #   # ## #   ## #   ## # # # ###  # ###  ##  ## ###  # #  ### ###  # # #         
!              # #    # # #  ###  #   #    # #  #   #    # # # # ## #   ## #   ## #   ##   # # #### ### ## # #         
!            # # ##  ## ##  ##   #  #   #  # ###  # ##  ## # # #   ## ##  #  ### ## ## #   # #### ## #   # #        
!              # # ### ## #   ## ## ###  ##  # ##   #   # ## # # ### #  ## ##  #    # ### #  ## ##  #      # #          
!               # #  #   # ##  ##  #   #   #  # ##  ##  #   # # # # #### #  ##  # #### #### # #  ##  # #### # #         
!              # #  #  ##  ##  # #   ## ##   # ### ## ##   # # # #  #   #   #  #  ### # #    ###  # #  #   # #        
!             # # #    # ##  ##   #  # ##  ##  ### #   #  # # # ### ## ## ### ## ### ### ## #  ##  ### ## # #         
!              # # ### ##   ## # # #### #   ## # #### # #### # # #   #  # ###  #    # ###  # #    # ###  # # #       
!             # # # #### ##   # #### # #   ## ## ### #### # # # #  ### # ###  ###  # # ###  #    # #  ### # #         
! 
! Some of these were entered upside down, and one entry has a timing
! error.
! 
! Task:
! 
! Implement code to find the corresponding decimal representation of each,
! rejecting the error.
! 
! Extra credit for handling the rows entered upside down (the other option
! is to reject them).
! 
! Notes:
! 
! Each digit is represented by 7 bits:
! 
!         0:  0 0 0 1 1 0 1
!         1:  0 0 1 1 0 0 1
!         2:  0 0 1 0 0 1 1
!         3:  0 1 1 1 1 0 1
!         4:  0 1 0 0 0 1 1
!         5:  0 1 1 0 0 0 1
!         6:  0 1 0 1 1 1 1
!         7:  0 1 1 1 0 1 1
!         8:  0 1 1 0 1 1 1
!         9:  0 0 0 1 0 1 1
! 
! On the left hand side of the bar code a space represents a 0 and a #
! represents a 1.
! 
! On the right hand side of the bar code, a # represents a 0 and a space
! represents a 1
! 
! Alternatively (for the above): spaces always represent zeros and #
! characters always represent ones, but the representation is logically
! negated -- 1s and 0s are flipped -- on the right hand side of the bar
! code.
! 
! The UPC-A bar code structure:
! 
! -   -   It begins with at least 9 spaces (which our imaginary bar code
!         reader unfortunately doesn't always reproduce properly),
!     -   then has a # # sequence marking the start of the sequence,
!     -   then has the six "left hand" digits,
!     -   then has a # # sequence in the middle,
!     -   then has the six "right hand digits",
!     -   then has another # # (end sequence), and finally,
!     -   then ends with nine trailing spaces (which might be eaten by
!         wiki edits, and in any event, were not quite captured correctly
!         by our imaginary bar code reader).
! 
! Finally, the last digit is a checksum digit which may be used to help
! detect errors.
! 
! Verification:
! 
! Multiply each digit in the represented 12 digit sequence by the
! corresponding number in (3,1,3,1,3,1,3,1,3,1,3,1) and add the products.
! 
! The sum (mod 10) must be 0 (must have a zero as its last digit) if the
! UPC number has been read correctly.

USING: combinators combinators.short-circuit formatting grouping
kernel locals math math.functions math.vectors sequences
sequences.repeating unicode ;

CONSTANT: numbers {
    "   ## #"
    "  ##  #"
    "  #  ##"
    " #### #"
    " #   ##"
    " ##   #"
    " # ####"
    " ### ##"
    " ## ###"
    "   # ##"
}

: upc>dec ( str -- seq )
    [ blank? ] trim 3 tail 3 head* 42 cut 5 tail
    [ 35 = 32 35 ? ] map append 7 group [ numbers index ] map ;

: valid-digits? ( seq -- ? ) [ f = ] none? ;

: valid-checksum? ( seq -- ? )
    { 3 1 } 12 cycle v* sum 10 divisor? ;

: valid-upc? ( seq -- ? )
    { [ valid-digits? ] [ valid-checksum? ] } 1&& ;

:: process-upc ( upc -- obj upside-down? )
    upc upc>dec :> d
    {
        { [ d valid-upc? ] [ d f ] }
        { [ upc reverse upc>dec dup valid-upc? ] [ t ] }
        { [ drop d valid-digits? ] [ "Invalid checksum" f ] }
        [ "Invalid digit(s)" f ]
    } cond ;

{
 "         # #   # ##  #  ## #   ## ### ## ### ## #### # # # ## ##  #   #  ##  ## ###  # ##  ## ### #  # #       "
  "        # # #   ##   ## # #### #   # ## #   ## #   ## # # # ###  # ###  ##  ## ###  # #  ### ###  # # #      "
 "         # #    # # #  ###  #   #    # #  #   #    # # # # ## #   ## #   ## #   ##   # # #### ### ## # #       "
   "       # # ##  ## ##  ##   #  #   #  # ###  # ##  ## # # #   ## ##  #  ### ## ## #   # #### ## #   # #        "
 "         # # ### ## #   ## ## ###  ##  # ##   #   # ## # # ### #  ## ##  #    # ### #  ## ##  #      # #       "
"          # #  #   # ##  ##  #   #   #  # ##  ##  #   # # # # #### #  ##  # #### #### # #  ##  # #### # #    "
 "         # #  #  ##  ##  # #   ## ##   # ### ## ##   # # # #  #   #   #  #  ### # #    ###  # #  #   # #     "
  "        # # #    # ##  ##   #  # ##  ##  ### #   #  # # # ### ## ## ### ## ### ### ## #  ##  ### ## # #      "
 "         # # ### ##   ## # # #### #   ## # #### # #### # # #   #  # ###  #    # ###  # #    # ###  # # #       "
  "        # # # #### ##   # #### # #   ## ## ### #### # # # #  ### # ###  ###  # # ###  #    # #  ### # #      "
}
[ process-upc "(upside down)" "" ? "%u %s\n" printf ] each
