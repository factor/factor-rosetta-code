! In epidemiology, retrospective analyses have well-known limitations
! compared to prospective studies.
! 
! One such limitation is the occurrence of selection bias in the choice of
! subjects between treated and untreated groups about whom the data is
! collected. For example, a treatment may have only been given to persons
! who were less severely ill, which would bias the results in favor of
! such subjects appearing to have done better because of the treatment
! when the biased group is then compared to those who who did not receive
! the study treatment. Or, in a retrospective study, there may a choice to
! place subjects in a particular study group using a method which is
! inadvertently biased by the outcome being measured. Creating a
! programming example of a simulation of such selection bias in the design
! of a retrospective study is the topic of this task.
! 
! The genuine, historical example (only partially approximated in this
! task) is of a study done of persons who, over a course of 180 days, may
! or may not have become infected with Covid-19. Prior to becoming ill,
! these subjects may or may not have taken an available medication, which
! was actually taken on a particular schedule not used here, but is
! approximated by stating the medication was taken in doses of 3, 6, or 9
! mg daily. The historical study then divided its subjects into three
! groups based on their cumulative dosage of the study medication:
! 
! -   Group UNTREATED were those who did not take the study medication at
!     all before they got Covid-19, including those who exited the study
!     period without Covid-19 and having never taken the study medication.
! 
! -   Group IRREGULAR is those who took the study medication but whose
!     cumulative dose was less than a certain amount (approximated for our
!     purposes as 100 mg) before they either came down with Covid-19
!     during the study or the study period ended.
! 
! -   Group REGULAR is those who took (our approximation is >= 100 mg) of
!     the study medication either before they came down with Covid-19 or
!     took >= 100 mg by the end of the study and never became infected
!     during the study.
! 
! ;Assumptions for the study simulation programming task:
! 
! -   Daily risk of getting Covid-19 infection for each subject was 0.1%
!     per day, or 18% over the 180 cumulative days of the study.
! 
! -   The probability of starting treatment medication for anyone not
!     already taking it was 0.5% per day. For those who started
!     medication, the chance of continuing the treatment was increased
!     50-fold to 25% each day, since most who started the medication
!     continued to take it to some extent.
! 
! -   Study dose per day is random between the approximation for the
!     simulation of 3, 6 and 9 mg. The daily cumulative dosage is used to
!     determine the group the subject is in, unless a subject develops
!     Covid-19. If a subject was diagnosed with Covid-19, their group at
!     the time of that diagnosis is used in the statistical analysis of
!     that group.
! 
! Task:
! 
! -   Create a simulation of the subjects, keeping track of their
!     medication dosages, group membership, and Covid-19 status during the
!     study.
! 
! -   Use at least 1000 subjects in the simulation over the 180 days
!     (historically, the study size was 80,000).
! 
! -   Statistics used are to be the Kruskal statistic for the analysis of
!     multiple groups, with the boolean study outcome variable whether the
!     subject got Covid-19 during the study period, analyzed versus
!     category. If the programming language does not have a statistical
!     package for such a test, calculation of the Kruskal H statistic may
!     be used, since any values of H over about 50 are considered very
!     highly indicative of significant group difference. A description of
!     that test is found at Kruskal-Wallis test.
! 
! -   You should get a statistical result highly favoring the REGULAR
!     group.
! 
! Stretch task
! 
! -   Show monthly outcomes.
! 
! A note regarding outcome: Note that by simulation design all subjects
! must have an IDENTICAL risk, that is 0.1 per cent or p = 0.001 per day,
! of developing Covid-19. Because of the design, any statistical
! differences between the groups CANNOT come from an influence of the
! treatment on that risk, but must come from some other feature of the
! study design.
! 
! See also:
! 
! :;*Wikipedia - Selection Bias
! 
! :;*Wikipedia - Retrospective studies
! 
! :;*UCDavis (pdf) Challenges in Retrospective studies


