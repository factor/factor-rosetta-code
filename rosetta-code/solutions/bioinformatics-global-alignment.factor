! Global alignment is designed to search for highly similar regions in two
! or more DNA sequences, where the sequences appear in the same order and
! orientation, fitting the sequences in as pieces in a puzzle.
! 
! Current DNA sequencers find the sequence for multiple small segments of
! DNA which have mostly randomly formed by splitting a much larger DNA
! molecule into shorter segments. When re-assembling such segments of DNA
! sequences into a larger sequence to form, for example, the DNA coding
! for the relevant gene, the overlaps between multiple shorter sequences
! are commonly used to decide how the longer sequence is to be assembled.
! For example, "AAGATGGA", GGAGCGCATC", and "ATCGCAATAAGGA" can be
! assembled into the sequence "AAGATGGAGCGCATCGCAATAAGGA" by noting that
! "GGA" is at the tail of the first string and head of the second string
! and "ATC" likewise is at the tail of the second and head of the third
! string.
! 
! When looking for the best global alignment in the output strings
! produced by DNA sequences, there are typically a large number of such
! overlaps among a large number of sequences. In such a case, the ordering
! that results in the shortest common superstring is generrally preferred.
! 
! Finding such a supersequence is an NP-hard problem, and many algorithms
! have been proposed to shorten calculations, especially when many very
! long sequences are matched.
! 
! The shortest common superstring as used in bioinfomatics here differs
! from the string task Shortest_common_supersequence. In that task, a
! supersequence may have other characters interposed as long as the
! characters of each subsequence appear in order, so that (abcbdab,
! abdcaba) -> abdcabdab. In this task, (abcbdab, abdcaba) -> abcbdabdcaba.
! 
! Task:
! 
! -   -   Given N non-identical strings of characters A, C, G, and T
!         representing N DNA sequences, find the shortest DNA sequence
!         containing all N sequences.
! 
! -   -   Handle cases where two sequences are identical or one sequence
!         is entirely contained in another.
! 
! -   -   Print the resulting sequence along with its size (its base
!         count) and a count of each base in the sequence.
! 
! -   -   Find the shortest common superstring for the following four
!         examples:
! 
!     
! 
! ("TA", "AAG", "TA", "GAA", "TA")
! 
! ("CATTAGGG", "ATTAG", "GGG", "TA")
! 
! ("AAGAUGGA", "GGAGCGCAUC", "AUCGCAAUAAGGA")
! 
! ("ATGAAATGGATGTTCTGAGTTGGTCAGTCCCAATGTGCGGGGTTTCTTTTAGTACGTCGGGAGTGGTATTAT",
! "GGTCGATTCTGAGGACAAAGGTCAAGATGGAGCGCATCGAACGCAATAAGGATCATTTGATGGGACGTTTCGTCGACAAAGT",
! "CTATGTTCTTATGAAATGGATGTTCTGAGTTGGTCAGTCCCAATGTGCGGGGTTTCTTTTAGTACGTCGGGAGTGGTATTATA",
! "TGCTTTCCAATTATGTAAGCGTTCCGAGACGGGGTGGTCGATTCTGAGGACAAAGGTCAAGATGGAGCGCATC",
! "AACGCAATAAGGATCATTTGATGGGACGTTTCGTCGACAAAGTCTTGTTTCGAGAGTAACGGCTACCGTCTT",
! "GCGCATCGAACGCAATAAGGATCATTTGATGGGACGTTTCGTCGACAAAGTCTTGTTTCGAGAGTAACGGCTACCGTC",
! "CGTTTCGTCGACAAAGTCTTGTTTCGAGAGTAACGGCTACCGTCTTCGATTCTGCTTATAACACTATGTTCT",
! "TGCTTTCCAATTATGTAAGCGTTCCGAGACGGGGTGGTCGATTCTGAGGACAAAGGTCAAGATGGAGCGCATC",
! "CGTAAAAAATTACAACGTCCTTTGGCTATCTCTTAAACTCCTGCTAAATGCTCGTGC",
! "GATGGAGCGCATCGAACGCAATAAGGATCATTTGATGGGACGTTTCGTCGACAAAGTCTTGTTTCGAGAGTAACGGCTACCGTCTTCGATT",
! "TTTCCAATTATGTAAGCGTTCCGAGACGGGGTGGTCGATTCTGAGGACAAAGGTCAAGATGGAGCGCATC",
! "CTATGTTCTTATGAAATGGATGTTCTGAGTTGGTCAGTCCCAATGTGCGGGGTTTCTTTTAGTACGTCGGGAGTGGTATTATA",
! "TCTCTTAAACTCCTGCTAAATGCTCGTGCTTTCCAATTATGTAAGCGTTCCGAGACGGGGTGGTCGATTCTGAGGACAAAGGTCAAGA")
! 
! Related tasks:
! 
! -   -   Bioinformatics base count.
!     -   Bioinformatics sequence mutation.
! 
! Category:Bioinfomatics Category:Strings


