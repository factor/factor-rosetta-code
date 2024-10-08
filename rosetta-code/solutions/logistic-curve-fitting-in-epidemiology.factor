! The least-squares method (see references below) in statistics is used to
! fit data to the best of a family of similar curves by finding the
! parameters for a curve which minimizes the total of the distances from
! each data point to the curve.
! 
! Often, the curve used is a straight line, in which case the method is
! also called linear regression. If a curve which uses logarithmic growth
! is fit, the method can be called logistic regression.
! 
! A commonly used family of functions used in statistical studies of
! populations, including the growth of epidemics, are curves akin to the
! logistic curve:
! 
!         ƒ(x) = L / (1 + e^(-k(x-x⁰))) 
! 
! Though predictions based on fitting to such curves may error, especially
! if used to extrapolate from incomplete data, curves similar to the
! logistic curve have had good fits in population studies, including
! modeling the growth of past epidemics.
! 
! Given the following daily world totals since December 31, 2019 for
! persons who have become infected with the novel coronavirus Covid-19:
! 
!     Daily totals:
!     27, 27, 27, 44, 44, 59, 59, 59, 59, 59, 59, 59, 59, 60, 60,
!     61, 61, 66, 83, 219, 239, 392, 534, 631, 897, 1350, 2023, 2820,
!     4587, 6067, 7823, 9826, 11946, 14554, 17372, 20615, 24522, 28273,
!     31491, 34933, 37552, 40540, 43105, 45177, 60328, 64543, 67103,
!     69265, 71332, 73327, 75191, 75723, 76719, 77804, 78812, 79339, 
!     80132, 80995, 82101, 83365, 85203, 87024, 89068, 90664, 93077, 
!     95316, 98172, 102133, 105824, 109695, 114232, 118610, 125497, 
!     133852, 143227, 151367, 167418, 180096, 194836, 213150, 242364, 
!     271106, 305117, 338133, 377918, 416845, 468049, 527767, 591704, 
!     656866, 715353, 777796, 851308, 928436, 1000249, 1082054, 1174652
! 
! Use the following variant of the logistic curve as a formula:
! 
!         ƒ(t) = n⁰ e^((r t)) / ((1 + n⁰ (e^((r t)) - 1) / K) 
! 
! Where:
! 
! -   -    r is the rate of growth of the infection in the population.
!     -    K is the world population, about 7.8 billion.
!     -    n₀ is 27, the number of cases found in China at the start of
!         the pandemic.
! 
! The R0 of an infection (different from r above) is a measure of how many
! new individuals will become infected for every individual currently
! infected. It is an important measure of how quickly an infectious
! disease may spread.
! 
! R0 is related to the logistic curve's r parameter by the formula:
! 
!         r ≈ ln(R0) / G 
! 
! where G the generation time, is roughly the sum of the incubation time,
! perhaps 5 days, and the mean contagion period, perhaps 7 days, so, for
! covid-19, roughly we have:
! 
!         R0 ≈ e^(12r) 
! 
! Task:
! 
! -   Demonstrate code that finds a least-squares fits of the curve to the
!     data.
! -   Show the calculated r for the logistic curve.
! -   Show the final R0 parameter you calculate from the logistic curve r
!     value parameter.
! 
! See also
! 
! :;*https://en.wikipedia.org/wiki/Basic_reproduction_number Basic
! reproduction number
! 
! :;*https://en.wikipedia.org/wiki/Logistic_function Logistic functions
! 
! :;*https://en.wikipedia.org/wiki/Least_squares Least squares
! 
! :;*https://ourworldindata.org/coronavirus#all-charts-preview World
! covid-19 case tallies
! 
! :;*https://www.zoology.ubc.ca/~bio310/Blank%20Page%204_files/DL%20R%20and%20r.htm
! Calculating r and R0


