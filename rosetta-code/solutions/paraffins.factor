! []
! 
! This organic chemistry task is essentially to implement a tree
! enumeration algorithm.
! 
! Task:
! 
! Enumerate, without repetitions and in order of increasing size, all
! possible paraffin molecules (also known as alkanes).
! 
! Paraffins are built up using only carbon atoms, which has four bonds,
! and hydrogen, which has one bond. All bonds for each atom must be used,
! so it is easiest to think of an alkane as linked carbon atoms forming
! the "backbone" structure, with adding hydrogen atoms linking the
! remaining unused bonds.
! 
! In a paraffin, one is allowed neither double bonds (two bonds between
! the same pair of atoms), nor cycles of linked carbons. So all paraffins
! with n carbon atoms share the empirical formula C_(n)H_(2n+2)
! 
! But for all n ≥ 4 there are several distinct molecules ("isomers") with
! the same formula but different structures.
! 
! The number of isomers rises rather rapidly when n increases.
! 
! In counting isomers it should be borne in mind that the four bond
! positions on a given carbon atom can be freely interchanged and bonds
! rotated (including 3-D "out of the paper" rotations when it's being
! observed on a flat diagram), so rotations or re-orientations of parts of
! the molecule (without breaking bonds) do not give different isomers. So
! what seem at first to be different molecules may in fact turn out to be
! different orientations of the same molecule.
! 
! Example:
! 
! With n = 3 there is only one way of linking the carbons despite the
! different orientations the molecule can be drawn; and with n = 4 there
! are two configurations:
! 
! -   -   a straight chain: (CH₃)(CH₂)(CH₂)(CH₃)
!     -   a branched chain: (CH₃)(CH(CH₃))(CH₃)
! 
! Due to bond rotations, it doesn't matter which direction the branch
! points in.
! 
! The phenomenon of "stereo-isomerism" (a molecule being different from
! its mirror image due to the actual 3-D arrangement of bonds) is ignored
! for the purpose of this task.
! 
! The input is the number n of carbon atoms of a molecule (for instance
! 17).
! 
! The output is how many different different paraffins there are with n
! carbon atoms (for instance 24,894 if n = 17).
! 
! The sequence of those results is visible in the OEIS entry:
! 
!     
! 
!         A00602: number of n-node unrooted quartic trees; number of
!         n-carbon alkanes C(n)H(2n+2) ignoring stereoisomers.
! 
! The sequence is (the index starts from zero, and represents the number
! of carbon atoms):
! 
! 1, 1, 1, 1, 2, 3, 5, 9, 18, 35, 75, 159, 355, 802, 1858, 4347, 10359,
! 24894, 60523, 148284, 366319, 910726, 2278658, 5731580, 14490245,
! 36797588, 93839412, 240215803, 617105614, 1590507121, 4111846763,
! 10660307791, 27711253769, ...
! 
! Extra credit:
! 
! Show the paraffins in some way.
! 
! A flat 1D representation, with arrays or lists is enough, for instance:
! 
!     *Main> all_paraffins 1
!                             [CCP H H H H]
!     *Main> all_paraffins 2
!                             [BCP (C H H H) (C H H H)]
!     *Main> all_paraffins 3
!                             [CCP H H (C H H H) (C H H H)]
!     *Main> all_paraffins 4
!                             [BCP (C H H (C H H H)) (C H H (C H H H)),
!                              CCP H (C H H H) (C H H H) (C H H H)]
!     *Main> all_paraffins 5
!                             [CCP H H (C H H (C H H H)) (C H H (C H H H)),
!                              CCP H (C H H H) (C H H H) (C H H (C H H H)),
!                              CCP (C H H H) (C H H H) (C H H H) (C H H H)]
!     *Main> all_paraffins 6
!                             [BCP (C H H (C H H (C H H H))) (C H H (C H H (C H H H))),
!                              BCP (C H H (C H H (C H H H))) (C H (C H H H) (C H H H)),
!                              BCP (C H (C H H H) (C H H H)) (C H (C H H H) (C H H H)),
!                              CCP H (C H H H) (C H H (C H H H)) (C H H (C H H H)),
!                              CCP (C H H H) (C H H H) (C H H H) (C H H (C H H H))]
! 
! Showing a basic 2D ASCII-art representation of the paraffins is better;
! for instance (molecule names aren't necessary):
! 
!            methane          ethane               propane               isobutane
! 
!               H              H   H              H   H   H              H   H   H
!               │              │   │              │   │   │              │   │   │
!           H ─ C ─ H      H ─ C ─ C ─ H      H ─ C ─ C ─ C ─ H      H ─ C ─ C ─ C ─ H
!               │              │   │              │   │   │              │   │   │
!               H              H   H              H   H   H              H   │   H
!                                                                            │
!                                                                        H ─ C ─ H
!                                                                            │
!                                                                            H
! 
! Links:
! 
! -   A paper that explains the problem and its solution in a functional
!     language:
! 
! http://www.cs.wright.edu/~tkprasad/courses/cs776/paraffins-turner.pdf
! 
! -   A Haskell implementation:
! 
! https://github.com/ghc/nofib/blob/master/imaginary/paraffins/Main.hs
! 
! -   A Scheme implementation:
! 
! http://www.ccs.neu.edu/home/will/Twobit/src/paraffins.scm
! 
! -   A Fortress implementation: (this site has been closed)
! 
! http://java.net/projects/projectfortress/sources/sources/content/ProjectFortress/demos/turnersParaffins0.fss?rev=3005


