! Task:
! 
! Present a program which emits the lyrics to the song I Knew an Old Lady
! Who Swallowed a Fly, taking advantage of the repetitive structure of the
! song's lyrics.
! 
! This song has multiple versions with slightly different lyrics, so all
! these programs might not emit identical output.

USING: base85 compression.zlib ;

"c%1E4%WlIU5WMphn^P`UexSD=s^-?Jk$NVE7-Gs=fQ9_`T}Y~ggi4hvMSb{SX}vpQXJ;^Yqok7%xd(0
mjR3>N1W_UQ$c@1$1#sAzsbTkHfHerT%K*K_NT><Cl4r<3ZyEa}o#KN}<)twov|KQ@`BE=GXdzugXdWO
s-E}7At$_Vm9CX{KSX)nUpq1~~%N3WyS`ZLg9$IzcccWRh+KGlek2*-;TR+lUB6EZs0X5<&U()_dvQXE
CJ#gDjv>e5yCRDAFrgX{pAnt$DPGHxt*E9$RMRBPeRcoXvT{6xN%o=~9@t{fLM`G}XV^A6Hk!HSBn{YM
ylrFhv&t_M?=}Lzm^6W<+00(I)uM#EY@ah;z@Y)zDUk;J&o^8C<;g7LlMIS{^*(al_mjFQv=BG_DyZn
<}rUt#FCDtKB9S`Y4jg+0PuB?Qt-&(11p?caq^S=1C`$D1fa<y6|YD*77a{4949T_-MVet;6abaEn"

base85> 3215 <compressed> uncompress >string print
