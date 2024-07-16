! A "word wheel" is a type of word game commonly found on the "puzzle"
! page of newspapers. You are presented with nine letters arranged in a
! circle or 3×3 grid. The objective is to find as many words as you can
! using only the letters contained in the wheel or grid. Each word must
! contain the letter in the centre of the wheel or grid. Usually there
! will be a minimum word length of 3 or 4 characters. Each letter may only
! be used as many times as it appears in the wheel or grid.
! 
! An example: 
! 
!         {| class="wikitable"
! 
! | N | D | E |- | O | style="font-weight: bold;"| K | G |- | E | L | W |}
! 
! Task:
! 
! Write a program to solve the above "word wheel" puzzle.
! 
! Specifically:
! 
! -   -   Find all words of 3 or more letters using only the letters in
!         the string ndeokgelw.
!     -   All words must contain the central letter K.
!     -   Each letter may be used only as many times as it appears in the
!         string.
!     -   For this task we'll use lowercase English letters exclusively.
! 
! A "word" is defined to be any string contained in the file located at
! http://wiki.puzzlers.org/pub/wordlists/unixdict.txt.
! 
! If you prefer to use a different dictionary, please state which one you
! have used.
! 
! Optional extra:
! 
! Word wheel puzzles usually state that there is at least one nine-letter
! word to be found. Using the above dictionary, find the 3x3 grids with at
! least one nine-letter solution that generate the largest number of words
! of three or more letters.

USING: assocs io.encodings.ascii io.files kernel math
math.statistics prettyprint sequences sorting ;

! Only consider words longer than two letters and words that
! contain elt.
: pare ( elt seq -- new-seq )
    [ [ member? ] keep length 2 > and ] with filter ;

: words ( input-str path -- seq )
    [ [ midpoint@ ] keep nth ] [ ascii file-lines pare ] bi* ;

: ?<= ( m n/f -- ? ) dup f = [ nip ] [ <= ] if ;

! Can we make sequence 1 with the elements in sequence 2?
: can-make? ( seq1 seq2 -- ? )
    [ histogram ] bi@ [ swapd at ?<= ] curry assoc-all? ;

: solve ( input-str path -- seq )
    [ words ] keepd [ can-make? ] curry filter ;

"ndeokgelw" "unixdict.txt" solve [ length ] sort-with .
