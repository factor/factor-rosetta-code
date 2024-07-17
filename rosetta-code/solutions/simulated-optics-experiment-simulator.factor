! Introduction
! 
! Simulation by computer modeling is done in the natural sciences for
! various reasons. Consider, for instance, simulation of the weather: it
! might be done to try to predict the actual weather for the next few
! days.
! 
! In this task, you will write a simulation of an experiment in optics,
! the physics of light. The simulation will be based on the following open
! access paper, but written independently of the paper's author's own
! simulation:
! 
!    A. F. Kracklauer, ‘EPR-B correlations: non-locality or geometry?’,
!    J. Nonlinear Math. Phys. 11 (Supp.) 104–109 (2004).
!    https://doi.org/10.2991/jnmp.2004.11.s1.13
! 
! The purpose of the simulation is demonstrate flaws in some physicists'
! interpretations of certain actual experiments, by presenting a simulated
! counterexample to their reasoning.
! 
! Task description
! 
! In this task you should write the program or set of programs that
! simulate the experimental apparatus, so generating raw data. The
! Simulated optics experiment/Data analysis task handles analysis of the
! raw data. There should be no need for the simulator and the data
! analysis to be in the same programming language. Therefore any
! implementation of the data analysis can be used to check your
! implementation of the simulator.
! 
! Write simulations of the following experimental devices. The
! descriptions may seem complicated, but the Object Icon, Python, and
! RATFOR examples can serve as references. The RATFOR is certainly the
! simplest, but the Object Icon may seem more familiar to "object
! oriented" programmers. The two are similar. The Python reformulates some
! calculations as Gibbs vectors (the "arrow" kind of vector), and runs as
! multiple processes.
! 
! -   A light source, which occasionally emits two pulses of
!     plane-polarized light, one towards the left, the other towards the
!     right. Both pulses have an amplitude of 1. About half the time the
!     pulses are polarized, respectively, at an angle of 0° on the left
!     and 90° on the right. The rest of the time the angles are reversed:
!     90° on the left, 0° on the right. A random number generator should
!     be used to select between the two settings. If the 0° angle is on
!     the left, then a "0" should be recorded in a log. Otherwise a "1" is
!     recorded.
! 
! -   A polarizing beam splitter. Actually you will need two of these
!     devices, but the two should share their implementation. Each beam
!     splitter has an angle setting, which for our own convenience is
!     required to be greater than or equal to 0° but less than 90°. (The
!     simulation in the paper does not impose this requirement, but
!     imposing it does not change the results.) A polarizing beam splitter
!     does the following. For input it receives one of the light pulses
!     emitted by the light source, and for output it emits two new light
!     pulses, whose directions of travel we will not worry about. One of
!     the new light pulses has amplitude equal to the cosine of the
!     difference between the angle of the incoming light and the angular
!     setting of the beam splitter. The other new light pulse has
!     amplitude equal to the absolute value of the sine of the difference
!     between angles. The new light pulses are plane-polarized but this
!     information is not used by the next device in line, so may be
!     ignored if one wishes. (The reference Python example does compute
!     the directions of polarization.) The beam splitters will actually
!     have two angle settings, with the first of the two settings chosen
!     randomly about half the time. If the first angle setting was chosen,
!     "0" is recorded in a log. Otherwise a "1" is recorded.
! 
! -   A light detector, or actually four of them that share their
!     implementation. Each light detector receives as input, respectively,
!     one of the four output pulses from the two polarizing beam
!     splitters. A light detector first squares the amplitude of the
!     incoming light pulse. This square is the intensity of the pulse.
!     Then it compares the intensity it just computed with a uniform
!     random number between 0.0 and 1.0. If the random number is less than
!     or equal to the intensity, the light detector outputs a "1", meaning
!     that it has detected a light pulse. Otherwise the detector outputs a
!     "0", representing the quiescent state of the detector. (That is, the
!     detector has failed to detect the pulse.) The output of each light
!     detector is recorded in a log.
! 
! The angle settings of the polarizing beam splitters will be as follows:
! 
! -   On the left, the first setting angle is 0° and the second is 45°.
! -   On the right, the first angle is 22.5° and the second is 67.5°.
! 
! The simulation is run by having the light source emit some number of
! pulses and letting the other devices do their work. How you arrange this
! to work is up to you. The Python example, for instance, runs each device
! as a separate process, connected to each other by queues. But you can
! instead have, for instance, an event loop, coroutines, etc.--or even
! just ordinary, procedural calculation of the numbers. The last method is
! simplest, and perfectly correct. It is what the Object Icon and RATFOR
! examples do. However, surely all the methods have their place in the
! world of simulations.
! 
! The program must output its "raw data" results in the format shown here
! by example:
! 
!     3
!     0 1 1 0 0 1 1
!     1 1 0 1 1 0 1
!     0 0 1 0 0 1 1
! 
! The first line is how many pulses were emitted by the light source. (You
! should have this be at least 1000. The number 3 here is for the sake of
! depicting the format.) This line is followed by that many more lines,
! each of which contains seven "0"s and "1"s, separated from each other by
! one space character. The seven entries, left to right, represent the
! following data, one line for each light pulse pair emitted by the
! source:
! 
! 1.  The log recording of the light source setting.
! 2.  The log recording of the setting of the polarizing beam splitter
!     that is on the left.
! 3.  The log recording of the setting of the polarizing beam splitter
!     that is on the right.
! 4.  The output of the light detector on the left that is receiving the
!     "cosine" pulses.
! 5.  The output of the light detector on the left that is receiving the
!     "sine" pulses.
! 6.  The output of the light detector on the right that is receiving the
!     "cosine" pulses.
! 7.  The output of the light detector on the right that is receiving the
!     "sine" pulses.
! 
! You should feed this "raw data" output as input to one of the Simulated
! optics experiment/Data analysis programs and display your results.
! 
! Extra "credit"
! 
! The "credit" one gets is the feeling of having contributed to the
! community.
! 
! The simulation above uses classical optics theory, including the Law of
! Malus, and assumes light detectors are the source of "randomness" in
! detections. Instead write a simulation with these differences:
! 
! -   The light source works exactly as above, but now we call it a source
!     of photons-containing-hidden-variables and pay no attention to the
!     amplitude of the light pulses. They are now simply little "pellets"
!     of light, but containing some inner state that quantum mechanics
!     pointedly ignores.
! -   A polarizing beam splitter, rather than emit light of reduced
!     amplitude, emits up to two new photons-containing-hidden-variables,
!     again of arbitrary amplitude. A photon-containing-hidden-variables
!     possibly is emitted towards one of the light detectors, with
!     probability equal to the square of the cosine of the difference in
!     angle between the impinging photon and the beam splitter. The other
!     light detector gets a photon-containing-hidden-variables with
!     probability equal to the square of the sine.
! -   The light detector we will now call a photodetector. It detects
!     impinging photons-containing-hidden-variables with probability one.
!     It is a perfect photon-containing-hidden-variables detector.
! -   Output must be in the format described above, so the data analyzers
!     can analyze them.
! 
! Though the simulation now includes "photons" instead of classical
! optics, it will be perfectly valid for the data analyzer to take into
! account which direction of travel got which photon. This is because
! these are not "photons" as physicists usually assume them to be, but
! photons-containing-hidden-variables. The analysis therefore must take
! into account which photon is which.
! 
! All but a few physicists either claim
! photons-containing-hidden-variables cannot possibly explain actual
! experimental results, or take the word of other physicists for this.
! There supposedly is a "mathematical" proof of it. Our simulation should
! end up contradicting that claim, indicating that the "mathematics" must
! be incorrect in some fashion. How to interpret that result that I leave
! to the individual.
! 
! (It is not necessary to have an experimentally proven model of
! photons-containing-hidden-variables, for the simulation to achieve its
! goal. Such a model probably would explain deterministically why some
! photons get "re-emitted" and some do not, whereas we are assuming that
! polarizing beam splitters respond in some unknown fashion. But, in the
! realm of mathematics, even a facetious counterexample would be absolute
! disproof of the "theorem".)
! 
! There is an example of the extra "credit" simulation in ML-like ATS.
! 
! See also
! 
! -   Simulated optics experiment/Data analysis


