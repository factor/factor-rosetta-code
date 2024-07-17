! Task:
! 
! Calculate the FFT (Fast Fourier Transform) of an input sequence.
! 
! The most general case allows for complex numbers at the input and
! results in a sequence of equal length, again of complex numbers. If you
! need to restrict yourself to real numbers, the output should be the
! magnitude (i.e.: sqrt(re² + im²)) of the complex result.
! 
! The classic version is the recursive Cooley–Tukey FFT. Wikipedia has
! pseudo-code for that. Further optimizations are possible but not
! required.


IN: USE math.transforms.fft
IN: { 1 1 1 1 0 0 0 0 } fft .
{
    C{ 4.0 0.0 }
    C{ 1.0 -2.414213562373095 }
    C{ 0.0 0.0 }
    C{ 1.0 -0.4142135623730949 }
    C{ 0.0 0.0 }
    C{ 0.9999999999999999 0.4142135623730949 }
    C{ 0.0 0.0 }
    C{ 0.9999999999999997 2.414213562373095 }
}

