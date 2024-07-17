! Given a polynomial, represented by an ordered list of its coefficients
! by increasing degree (e.g. [-1, 6, 5] represents 5x²+6x-1), calculate
! the polynomial representing the derivative. For example, the derivative
! of the aforementioned polynomial is 10x+6, represented by [6, 10]. Test
! cases: 5, -3x+4, 5x²+6x-1, x³-2x²+3x-4, -x⁴-x³+x+1
! 
! Related task:
! 
! -   -   Polynomial long division

USING: generalizations kernel math.polynomials prettyprint ;

{ 5 }
{ 4 -3 }
{ -1 6 5 }
{ -4 3 -2 1 }
{ 1 1 0 -1 -1 }

[ pdiff ] 5 napply .s clear
