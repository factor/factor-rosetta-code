! The multiplicative order of a relative to m is the least positive
! integer n such that a^n is 1 (modulo m).
! 
! Example:
! 
! The multiplicative order of 37 relative to 1000 is 100 because 37^100 is
! 1 (modulo 1000), and no number smaller than 100 would do.
! 
! One possible algorithm that is efficient also for large numbers is the
! following: By the Chinese Remainder Theorem, it's enough to calculate
! the multiplicative order for each prime exponent p^k of m, and combine
! the results with the least common multiple operation.
! 
! Now the order of a with regard to p^k must divide Φ(p^k). Call this
! number t, and determine it's factors q^e. Since each multiple of the
! order will also yield 1 when used as exponent for a, it's enough to find
! the least d such that (q^d)*(t/(q^e)) yields 1 when used as exponent.
! 
! Task:
! 
! Implement a routine to calculate the multiplicative order along these
! lines. You may assume that routines to determine the factorization into
! prime powers are available in some library.
! 
! ------------------------------------------------------------------------
! 
! An algorithm for the multiplicative order can be found in Bach &
! Shallit, Algorithmic Number Theory, Volume I: Efficient Algorithms, The
! MIT Press, 1996:
! 
! Exercise 5.8, page 115:
! 
! Suppose you are given a primepand a complete factorization ofp-1. Show
! how to compute the order of an
! elementain(Z/(p))^(*)usingO((lg p)⁴/(lg lg p))bit operations.
! 
! Solution, page 337:
! 
! Let the prime factorization ofp-1 beq1^(e1)q2^(e2)...qk^(ek) .We use the
! following observation: ifx^((p-1)/qi^(fi)) = 1 (mod p) ,
! andfi=eiorx^((p-1)/qi^(fi+1)) != 1 (mod p) ,thenqi^(ei-fi)||ord_(p) x.
! (This follows by combining Exercises 5.1 and 2.10.)
! 
! Hence it suffices to find, for eachi ,the exponentfi such that the
! condition above holds.
! 
! This can be done as follows: first
! computeq1^(e1), q2^(e2), ... , qk^(ek) . This can be done
! usingO((lg p)²)bit operations. Next,
! computey1=(p-1)/q1^(e1), ... , yk=(p-1)/qk^(ek) . This can be done
! usingO((lg p)²)bit operations. Now, using the binary method,
! computex1=a^(y1)(mod p), ... , xk=a^(yk)(mod p). This can be done
! usingO(k(lg p)³)bit operations, andk=O((lg p)/(lg lg p))by Theorem
! 8.8.10. Finally, for eachi ,repeatedly raisexito theqi-th
! power(mod p)(as many asei-1 times), checking to see when 1 is obtained.
! This can be done usingO((lg p)³)steps. The total cost is dominated
! byO(k(lg p)³) ,which isO((lg p)⁴/(lg lg p)).

USING: kernel math math.functions math.primes.factors sequences ;

: (ord) ( a pair -- n )
    first2 dupd ^ swap dupd [ /i ] keep 1 - * divisors
    [ swap ^mod 1 = ] 2with find nip ;
    

: ord ( a n -- m )
    2dup gcd nip 1 =
    [ group-factors [ (ord) ] with [ lcm ] map-reduce ]
    [ 2drop 0/0. ] if ;
