! The probability density function (pdf) of the chi-squared (or χ2)
! distribution as used in statistics is
! 
! $$f(x;\,k) =
! 
!   \dfrac{x^{\frac k 2 -1} e^{-\frac x 2}}{2^{\frac k 2} \Gamma\left(\frac k 2 \right)}$$
! , where x > 0 Here, Γ(k/2) denotes the Gamma_function.
! 
! The use of the gamma function in the equation below reflects the
! chi-squared distribution's origin as a special case of the gamma
! distribution.
! 
! In probability theory and statistics, the gamma distribution is a
! two-parameter family of continuous probability distributions. The
! exponential distribution, Erlang distribution, and chi-square
! distribution are special cases of the gamma distribution.
! 
! The probability density function (pdf) of the gamma distribution is
! given by the formula
! 
! $$f(x;k,\theta) =  \frac{x^{k-1}e^{-x/\theta}}{\theta^k\Gamma(k)} \quad \text{ for } x > 0 \text{ and } k, \theta > 0.$$
! 
! where Γ(k) is the Gamma_function, with shape parameter k and a scale
! parameter θ.
! 
! The cumulative probability distribution of the gamma distribution is the
! area under the curve of the distribution, which indicates the increasing
! probability of the x value of a single random point within the gamma
! distribution being less than or equal to the x value of the cumulative
! probability distribution. The gamma cumulative probability distribution
! function can be calculated as
! 
! $$F(x;k,\theta) = \int_0^x f(u;k,\theta)\,du = \frac{\gamma\left(k, \frac{x}{\theta}\right)}{\Gamma(k)},$$
! 
! where $\gamma\left(k, \frac{x}{\theta}\right)$ is the lower incomplete
! gamma function.
! 
! The lower incomplete gamma function can be calculated as
! 
! $x^s \, e^{-x} \sum_{m=0}^\infty\frac{x^m}{\Gamma(s+m+1)}$
! 
! and so, for the chi-squared cumulative probability distribution and
! substituting chi-square k into s as k/2 and chi-squared x into x as x /
! 2,
! 
!     $F(x;\,k) = (x/2)^{(k/2)} \, e^{-x/2} \sum_{m=0}^\infty\frac{(x/2)^m}{\Gamma(\frac{k}{2}+m+1)}.$
! 
! Because series formulas may be subject to accumulated errors from
! rounding in the frequently used region where x and k are under 10 and
! near one another, you may instead use a mathematics function library, if
! available for your programming task, to calculate gamma and incomplete
! gamma.
! ;Task:
! 
! -   Calculate and show the values of the χ2(x; k) for k = 1 through 5
!     inclusive and x integer from 0 and through 10 inclusive.
! 
! * Create a function to calculate the cumulative probability function for
! the χ2 distribution. This will need to be reasonably accurate (at least
! 6 digit accuracy) for k = 3.
! * Calculate and show the p values of statistical samples which result in
! a χ2(k = 3) value of 1, 2, 4, 8, 16, and 32. (Statistical p values can
! be calculated for the purpose of this task as approximately 1 - P(x),
! with P(x) the cumulative probability function at x for χ2.)
! :: The following is a chart for 4 airports:
! {| class="wikitable" style="margin:auto" |+ Flight Delays |- ! Airport
! !! On Time !! Delayed !! Totals |- | Dallas/Fort Worth || 77 || 23 ||
! 100 |- | Honolulu || 88 || 12 || 100 |- | LaGuardia || 79 || 21 || 100
! |- | Orlando || 81 || 19 || 100 |- | All Totals || 325 || 75 || 400 |- |
! Expected per 100 || 81.25 || 18.75 || 100 |}
! :: χ2 on a 2D table is calculated as the sum of the squares of the
! differences from expected divided by the expected numbers for each entry
! on the table. The k for the chi-squared distribution is to be calculated
! as df, the degrees of freedom for the table, which is a 2D parameter,
! (count of airports - 1) * (count of measures per airport - 1), which
! here is (4 - 1 )(2 - 1) = 3.
! * Calculate the Chi-squared statistic for the above table and find its p
! value using your function for the cumulative probability for χ2 with k =
! 3 from the previous task.
! ; Stretch task:
! 
! -   Show how you could make a plot of the curves for the probability
!     distribution function χ2(x; k) for k = 0, 1, 2, and 3.
! 
! Related Tasks:
! 
! -   Statistics/Basic
! -   Statistics/Normal_distribution
! 
! See also:
! 
! https://en.wikipedia.org/wiki/Chi-squared_test Chi Squared Test
! https://www.itl.nist.gov/div898/handbook/eda/section3/eda3666.htm NIST
! page on the Chi-Square Distribution


