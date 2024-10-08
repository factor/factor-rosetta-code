! Background on the task
! 
! In decision theory, The Sleeping Beauty Problem is a problem invented by
! Arnold Zoboff and first publicized on Usenet. The experimental subject,
! named Sleeping Beauty, agrees to an experiment as follows: Sleeping
! Beauty volunteers to be put into a deep sleep on a Sunday. There is then
! a fair coin toss. If this coin toss comes up heads, Sleeping Beauty
! wakes once (on Monday) and is asked to estimate the probability that the
! coin toss was heads. Her estimate is recorded and she is then put back
! to sleep for 2 days until Wednesday, at which time the experiment's
! results are tallied.
! If instead the coin toss is tails, Sleeping Beauty wakes as before on
! Monday and asked to estimate the probability the coin toss was heads,
! but is then given a drug which makes her forget that she had been woken
! on Monday before being put back to sleep again. She then wakes only 1
! day later, on Tuesday. She is then asked (on Tuesday) again to guess the
! probability that the coin toss was heads or tails. She is then put back
! to sleep and awakes as before 1 day later, on Wednesday.
! Some decision makers have argued that since the coin toss was fair
! Sleeping Beauty should always estimate the probability of heads as 1/2,
! since she does not have any additional information. Others have
! disagreed, saying that if Sleeping Beauty knows the study design she
! also knows that she is twice as likely to wake up and be asked to
! estimate the coin flip on tails than on heads, so the estimate should be
! 1/3 heads.
! 
! Task
! 
! Given the above problem, create a Monte Carlo estimate of the actual
! results. The program should find the proportion of heads on waking and
! asking Sleeping Beauty for an estimate, as a credence or as a percentage
! of the times Sleeping Beauty is asked the question.

USING: combinators.random io kernel math prettyprint ;

: sleeping ( n -- heads wakenings )
    0 0 rot [ 1 + .5 [ [ 1 + ] dip ] [ 1 + ] ifp ] times ;

"Wakenings over 1,000,000 experiments: " write
1e6 sleeping dup . /f
"Sleeping Beauty should estimate a credence of: " write .
