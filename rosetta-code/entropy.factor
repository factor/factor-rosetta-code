! Task:
! 
! Calculate the Shannon entropy H of a given input string.
! 
! Given the discrete random variable X that is a string of N "symbols"
! (total characters) consisting of n different characters (n=2 for
! binary), the Shannon entropy of X in bits/symbol is :
! 
! $$H_2(X) = -\sum_{i=1}^n \frac{count_i}{N} \log_2 \left(\frac{count_i}{N}\right)$$
! 
! where count_(i) is the count of character n_(i).
! 
! For this task, use X="1223334444" as an example. The result should be
! 1.84644... bits/symbol. This assumes X was a random variable, which may
! not be the case, or it may depend on the observer.
! 
! This coding problem calculates the "specific" or "intensive" entropy
! that finds its parallel in physics with "specific entropy" S⁰ which is
! entropy per kg or per mole, not like physical entropy S and therefore
! not the "information" content of a file. It comes from Boltzmann's
! H-theorem where S = k_(B)NH where N=number of molecules. Boltzmann's H
! is the same equation as Shannon's H, and it gives the specific entropy H
! on a "per molecule" basis.
! 
! The "total", "absolute", or "extensive" information entropy is
! 
! S = H₂N
! bits This is not the entropy being coded here, but it is the closest to
! physical entropy and a measure of the information content of a string.
! But it does not look for any patterns that might be available for
! compression, so it is a very restricted, basic, and certain measure of
! "information". Every binary file with an equal number of 1's and 0's
! will have S=N bits. All hex files with equal symbol frequencies will
! have S = Nlog₂(16) bits of entropy. The total entropy in bits of the
! example above is S= 10*18.4644 = 18.4644 bits.
! 
! The H function does not look for any patterns in data or check if X was
! a random variable. For example, X=000000111111 gives the same calculated
! entropy in all senses as Y=010011100101. For most purposes it is usually
! more relevant to divide the gzip length by the length of the original
! data to get an informal measure of how much "order" was in the data.
! 
! Two other "entropies" are useful:
! 
! Normalized specific entropy:
! 
! $$H_n=\frac{H_2 * \log(2)}{\log(n)}$$
! which varies from 0 to 1 and it has units of "entropy/symbol" or just
! 1/symbol. For this example, Hn<\sub>= 0.923.
! 
! Normalized total (extensive) entropy:
! 
! $$S_n = \frac{H_2 N * \log(2)}{\log(n)}$$
! which varies from 0 to N and does not have units. It is simply the
! "entropy", but it needs to be called "total normalized extensive
! entropy" so that it is not confused with Shannon's (specific) entropy or
! physical entropy. For this example, Sn<\sub>= 9.23.
! 
! Shannon himself is the reason his "entropy/symbol" H function is very
! confusingly called "entropy". That's like calling a function that
! returns a speed a "meter". See section 1.7 of his classic A Mathematical
! Theory of Communication and search on "per symbol" and "units" to see he
! always stated his entropy H has units of "bits/symbol" or
! "entropy/symbol" or "information/symbol". So it is legitimate to say
! entropy NH is "information".
! 
! In keeping with Landauer's limit, the physics entropy generated from
! erasing N bits is S = H₂Nk_(B)ln (2) if the bit storage device is
! perfectly efficient. This can be solved for H₂*N to (arguably) get the
! number of bits of information that a physical entropy represents.
! 
! Related tasks:
! 
! -   -   Fibonacci_word
!     -   Entropy/Narcissist

USING: assocs kernel math math.functions math.statistics
prettyprint sequences ;
IN: rosetta-code.entropy

: shannon-entropy ( str -- entropy )
    [ length ] [ histogram >alist [ second ] map ] bi
    [ swap / ] with map
    [ dup log 2 log / * ] map-sum neg ;
    
"1223334444" shannon-entropy .
"Factor is my favorite programming language." shannon-entropy .
