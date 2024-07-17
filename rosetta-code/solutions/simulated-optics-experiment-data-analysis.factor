! Introduction
! 
! In this task, you will write a program to analyze the "raw data"
! outputted by one of the Simulated optics experiment/Simulator
! implementations. The analysis will estimate the following numbers:
! 
! -   Four correlation coefficients: one for each of the four possible
!     combinations of the two polarizing beam splitter angles. These
!     measure the interrelatedness of light detection events on the two
!     sides of the experiment.
! -   A CHSH contrast, which is derived from the correlation coefficients.
! 
! The estimated CHSH contrast is what we are really interested in, because
! what we intend to show is that it contradicts what many physicists
! believe.
! 
! Quantum mechanics predicts a CHSH contrast of approximately
! $2\sqrt{2}\approx{2.828427}$. The Simulated optics experiment/Simulator
! simulation will be shown (by our analysis) to have a CHSH contrast very
! close to that. Note that our simulation does not employ any quantum
! mechanics, but instead simulates light "classically". Also our
! simulation clearly involves only causation that in each instance takes a
! finite amount of forward-moving time. That is, there is no
! "instantaneous action at a distance".
! 
! The prevailing view in physics, however, is that a CHSH contrast greater
! than 2 (which we certainly achieve) is possible only with quantum
! mechanics, and also that taking measurements on one side of the
! apparatus "instantaneously" determines what the measurements will be on
! the other side. Although quantum mechanics actually has no concept of
! "causation", this "determination" is often described as being
! "instantaneous action at a distance".
! 
! Thus, we are left with a conundrum: we clearly get a CHSH contrast not
! only greater than 2, but in fact very close to the theoretical value
! that quantum mechanics predicts. This is, in fact, a validation of the
! quantum mechanical mathematics: the mathematics is producing the correct
! result for this kind of experiment. On the other hand, the strong
! prevailing view in physics is that this cannot be happening if the
! physics involved is "classical"--which our simulated physics very much
! is. The prevailing view is that experiments similar to ours prove that
! "instantaneous action at a distance" is a real thing that exists. One
! sometimes sees such "proof" touted in the popular media.
! 
! I leave it to each individual to think about that conundrum and come to
! their own opinions. I am not a physicist and probably neither are you,
! so we can think whatever we want, and no one cares. But we likely are
! both computer programmers. What we mainly want to do here is demonstrate
! the use of computers to simulate physical events and analyze the data
! generated.
! 
! Task description
! 
! You will write a program to perform the mathematical data analysis
! described in the open access paper
! 
!    A. F. Kracklauer, ‘EPR-B correlations: non-locality or geometry?’,
!    J. Nonlinear Math. Phys. 11 (Supp.) 104–109 (2004).
!    https://doi.org/10.2991/jnmp.2004.11.s1.13
! 
! The program will read the raw data that was outputted by any of the
! Simulated optics experiment/Simulator implementations. The ATS, Object
! Icon, Python, and RATFOR programs below can serve as reference
! implementations. The ATS program stores the raw data in a big array. The
! RATFOR does not store the raw data at all, but instead calculates as it
! inputs. The other programs use set data structures.
! 
! The analysis proceeds as follows.
! 
! 1.  Read in the raw data. You do not have to retain the order of the
!     data lines. In other words, you can, if you wish, store the data in
!     a set structure.
! 2.  For each of the data lines, if its first entry is a "1", then swap
!     the last two entries with each other, and do the same with the two
!     entries before them. This is to account for the difference in
!     geometry: the original light pulses are rotated 90° with respect to
!     the apparatus, relative to if the first entry were a "0".
! 3.  Split the data into four groups, based on the values of the second
!     and third line entries. In other words, one group for lines that
!     look like ∘ 0 0 ∘ ∘ ∘ ∘, one for lines that look like ∘ 0 1 ∘ ∘ ∘ ∘,
!     one for lines that look like ∘ 1 0 ∘ ∘ ∘ ∘, and one for lines that
!     look like ∘ 1 1 ∘ ∘ ∘ ∘. Thus each group corresponds to a particular
!     setting of the two polarizing beam splitters.
! 4.  Separately compute a correlation coefficient for each group. This is
!     done as follows.
!     1.  Let N equal the total number of lines in a group.
!     2.  Let N_(L1) equal the number of lines that have a "1" in the
!         fourth entry. This is the number of detections by one of the
!         light detectors on the left side.
!     3.  Let N_(L2) equal the number of lines that have a "1" in the
!         fifth entry. This is the number of detections by the other light
!         detector on the left side.
!     4.  Add up similar numbers for the right side: N_(R1) for the sixth
!         entry in a line, and N_(R2) for the seventh entry.
!     5.  Compute the following numbers: $sin_L = \sqrt{N_{L1}/N}$,
!         $cos_L = \sqrt{N_{L2}/N}$, $sin_R = \sqrt{N_{R1}/N}$, and
!         $cos_R = \sqrt{N_{R2}/N}$. These numbers represent an estimate
!         of the orientations of the two beam splitters, by inference from
!         detection events in the light detectors.
!     6.  Compute cos_(LR) = (cos_(R) ⋅ cos_(L)) + (sin_(R) ⋅ sin_(L)) and
!         sin_(LR) = (sin_(R) ⋅ cos_(L)) − (cos_(R) ⋅ sin_(L)). These are
!         angle difference formulas from trigonometry. We are "eliminating
!         the coordinate system".
!     7.  Compute κ = cos_(LR)² − sin_(LR)². This is the correlation
!         coefficient for the group, estimated by inference from detection
!         events.
! 5.  Designate each of the four correlation coefficients according to
!     which group it is for. The Python example, for instance, refers to
!     them as kappaL1R1, kappaL1R2, kappaL2R1, and kappaL2R2.
! 6.  Compute the estimated CHSH contrast:
!     -kappaL1R1 + kappaL1R2 + kappaL2R1 + kappaL2R2.
! 7.  Display the number of "pulse pair events" that were simulated, the
!     four correlation coefficients, and the estimated CHSH contrast. Also
!     display the theoretical value of the CHSH contrast
!     ($2\sqrt{2}\approx{2.828427}$) and the difference between the
!     estimated CHSH contrast and the theoretical value. Also display what
!     we will call the CHSH violation: the difference between the
!     estimated CHSH contrast and the number 2. Any value significantly
!     greater than zero seems to be supposed to mean that the simulation
!     is inherently "quantum mechanical" and involves "instantaneous
!     action at a distance". But you can decide for yourself whether it
!     really means that. Just do the calculations and print them. One
!     should get an estimated CHSH contrast that is close to the
!     theoretical value, and thus a relatively "huge" CHSH violation of
!     about +0.8.
! 
! Extra "credit"
! 
! Here is a snapshot of what contains a thought experiment I have been
! working on:
! http://web.archive.org/web/20230529223105/https://crudfactory.com/Bell-assumes-his-conclusion.pdf
! The thought experiment concerns the same subject as this task, but more
! directly addresses the conundrum. It aims to illustrate the
! fallaciousness (despite their widespread acceptance by people regarded
! as "experts") of certain arguments underlying the conundrum, and thus to
! resolve the technical aspects of the conundrum. Whether it succeeds is
! up to you to decide. I am just a computer programmer, after all. And,
! even if I succeed in resolving the technical aspects of the conundrum, I
! have barely touched on the social aspects of it. Nevertheless, the
! thought experiment begs to be computer-animated, and I am not that kind
! of a programmer.
! 
! For extra "credit" (in the form of contribution to the community), write
! an animation or animations of the thought experiment.
! 
! --Chemoelectric (talk) 22:50, 29 May 2023 (UTC)
! 
! See also
! 
! -   Simulated optics experiment/Simulator
! -   E. T. Jaynes, "Clearing up mysteries -- the original goal" Opening
!     lecture of the eighth International MAXENT Workshop. 1988. This is a
!     classic from the same physicist as the Jaynes-Cummings model is
!     named for.


