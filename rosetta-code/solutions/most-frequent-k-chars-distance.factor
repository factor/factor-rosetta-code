! The string distance function (SDF) that is the subject of this entry was
! proposed in a paper published in 2014 as a method for quickly estimating
! how similar two ordered sets or strings are. This SDF has also been
! proposed as being suitable in bioinformatics, e.g. for comparing
! sequences in the wp:fasta format.
! 
! Unfortunately, the original paper by Sadi Evren Seker et al.
! (arXiv:1401.6596 [cs.DS]) [1] has a number of internal inconsistencies
! and for this and other reasons is not entirely clear in several key
! respects, but the paper does give some worked examples and several of
! these (notably the two given under the "Worked Examples" heading below)
! agree with the interpretation used by the authors of the Python entry
! herein, so that interpretation is used in the present task description.
! 
! The Task
! 
! (a) Show a time-efficient implementation of the SDF as if by a function
! mostFreqKSDF(s1, s2, k, n), where s1 and s2 are arbitrary strings, and k
! and n are non-negative integers as explained below;
! 
! (b) Show the values produced by the SDF for the following values of s1
! and s2, with k = 2 and n = 10:
! 
!   String Inputs                  "Top Two"         SDF Output (k=2, n=10)
!   ------------------------------ ----------------- ------------------------
!   'night' 'nacht'                n:1 i:1 n:1 a:1   8
!   'my' 'a'                       m:1 y:1 a:1       10
!   ‘research’ ‘research’          r:2 e:2 r:2 e:2   2
!                                                    
!   ‘significant’ ‘capabilities’   i:3 n:2 i:3 a:2   4
! 
! (c) Show the value produced by the SDF for k = 2, n = 100, and the two
! strings:
! 
! "LCLYTHIGRNIYYGSYLYSETWNTGIMLLLITMATAFMGYVLPWGQMSFWGATVITNLFSAIPYIGTNLV"
! "EWIWGGFSVDKATLNRFFAFHFILPFTMVALAGVHLTFLHETGSNNPLGLTSDSDKIPFHPYYTIKDFLG"
! 
! Reference Algorithm
! 
! The original paper employs an unusual scheme for encoding the
! frequencies of single letters as a string of letters and numbers. This
! scheme has several disadvantages, and so in the following we take a more
! abstract view and simply assume, solely for the purposes of this
! description, that two functions are available:
! 
! 1) MostFreqK(s, k) returns (in decreasing order of their frequency of
! occurrence) the k most frequently occurring letters in s, with any ties
! broken by the position of the first occurrence in s;
! 
! 2) For any letter c in MostFreqK(s, k), Freq(s,c) returns the frequency
! of c in s.
! 
! MFKsimilarity
! 
! Next define MFKsimilarlity(s1, s2, k) as if by the following
! pseudo-code:
! 
!     int function MFKsimilarity(string s1, string s2, int k):
!         let similarity = 0
!         let mfk1 = MostFreqK(s1, k)
!         let mfk2 = MostFreqK(s2, k)
!         for each c in mfk1
!             if (c occurs in mfk2) 
!             then similarity += Freq(s1, c) + Freq(s2, c)
!         end
!         return similarity
! 
! String Distance Wrapper Function
! 
! Now define MostFreqKSDF as if by:
! 
!     int function MostFreqKSDF(string s1, string s2, int k, int n)
!         return n - MFKsimilarity(s1, s2, k)
! 
! Worked Examples:
! 
! The original paper gives several worked examples, including these two:
! 
! (i) MostFreqKSDF("night", "nacht", 2, 10)
! 
! For "night", the "top two" letters with their frequencies are: n:1 and
! i:1.
! 
! For "nacht", the "top two" letters with their frequencies are: n:1 and
! a:1.
! 
! Since "n" is the only shared letter amongst these candidates, the SDF is
! 10 - 1 - 1 = 8, as per the original paper.
! 
! (2) MostFreqKSDF(
! "LCLYTHIGRNIYYGSYLYSETWNTGIMLLLITMATAFMGYVLPWGQMSFWGATVITNLFSAIPYIGTNLV",
! "EWIWGGFSVDKATLNRFFAFHFILPFTMVALAGVHLTFLHETGSNNPLGLTSDSDKIPFHPYYTIKDFLG",
! 2, 100)
! 
! For the first string, the "top two" letters with their frequencies are:
! L:9 and T:8; and for the second, the "top two" are F:9 and L:8.
! 
! Since "L" is the only shared letter amongst these top-k characters, and
! since the sum of the corresponding frequencies is 9+8 = 17, the SDF is
! 83.
! 
! [1]
! .


