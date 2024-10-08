! The Perlin noise is a kind of gradient noise invented by Ken Perlin
! around the end of the twentieth century and still currently heavily used
! in computer graphics, most notably to procedurally generate textures or
! heightmaps.
! 
! The Perlin noise is basically a pseudo-random mapping of $\R^d$ into
! $\R$ with an integer d which can be arbitrarily large but which is
! usually 2, 3, or 4.
! 
! Either by using a dedicated library or by implementing the algorithm,
! show that the Perlin noise (as defined in 2002 in the Java
! implementation below) of the point in 3D-space with coordinates 3.14,
! 42, 7 is 0.13691995878400012.
! 
! Note: this result assumes 64 bit IEEE-754 floating point calculations.
! If your language uses a different floating point representation, make a
! note of it and calculate the value accurate to 15 decimal places, or
! your languages accuracy threshold if it is less. Trailing zeros need not
! be displayed.

USING: kernel math math.functions literals locals prettyprint
sequences ;
IN: rosetta-code.perlin-noise

CONSTANT: p $[
    { 151 160 137 91 90 15 131 13 201 95 96 53 194 233 7 225 140
    36 103 30 69 142 8 99 37 240 21 10 23 190 6 148 247 120 234
    75 0 26 197 62 94 252 219 203 117 35 11 32 57 177 33 88 237
    149 56 87 174 20 125 136 171 168 68 175 74 165 71 134 139 48
    27 166 77 146 158 231 83 111 229 122 60 211 133 230 220 105
    92 41 55 46 245 40 244 102 143 54 65 25 63 161 1 216 80 73
    209 76 132 187 208 89 18 169 200 196 135 130 116 188 159 86
    164 100 109 198 173 186 3 64 52 217 226 250 124 123 5 202 38
    147 118 126 255 82 85 212 207 206 59 227 47 16 58 17 182 189
    28 42 223 183 170 213 119 248 152 2 44 154 163 70 221 153
    101 155 167 43 172 9 129 22 39 253 19 98 108 110 79 113 224
    232 178 185 112 104 218 246 97 228 251 34 242 193 238 210
    144 12 191 179 162 241 81 51 145 235 249 14 239 107 49 192
    214 31 181 199 106 157 184 84 204 176 115 121 50 45 127 4
    150 254 138 236 205 93 222 114 67 29 24 72 243 141 128 195
    78 66 215 61 156 180 } dup append
]

:: fade ( t -- x ) t 6 * 15 - t * 10 + t * t * t * ;

:: lerp ( t a b -- x ) b a - t * a + ;

:: grad ( hash x y z -- w )
    hash 15 bitand :> h
    h 8 < x y ? :> u
    h 4 < y h 12 = h 14 = or x z ? ? :> v
    h 1 bitand 0 = u u neg ? h 2 bitand 0 = v v neg ? + ;
    
:: noise ( x! y! z! -- noise )
    x floor >integer 255 bitand :> X
    y floor >integer 255 bitand :> Y
    z floor >integer 255 bitand :> Z
    x x floor - x!
    y y floor - y!
    z z floor - z!
    x fade :> u
    y fade :> v
    z fade :> w
    X p nth Y +     :> A
    A p nth Z +     :> AA
    A 1 + p nth Z + :> AB
    X 1 + p nth Y + :> B
    B p nth Z +     :> BA
    B 1 + p nth Z + :> BB
    
    w v u AA p nth x y z                 grad
          BA p nth x 1 - y z             grad lerp
        u AB p nth x y 1 - z             grad
          BB p nth x 1 - y 1 - z         grad lerp lerp
      v u AA 1 + p nth x y z 1 -         grad
          BA 1 + p nth x 1 - y z 1 -     grad lerp
        u AB 1 + p nth x y 1 - z 1 -     grad
          BB 1 + p nth x 1 - y 1 - z 1 - grad lerp lerp lerp ;

: main ( -- ) 3.14 42 7 noise . ;

MAIN: main
