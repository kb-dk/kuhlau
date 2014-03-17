righthand = \new Staff =
"1" {
\time 3/4
\clef "treble"
    \partial 4 
  \key f \major 
% start repeat
\repeat volta 2 
{
f'8 [c'8 ]  |
a8 [c'8 f'8 a'8 c''8 f''8 ]  |
a''8 [f''8 c'''8 gis''8 a''8 f''8 ]  |
e''4  \acciaccatura {fis''8 [e''8 dis''8 ] } e''8 [fis''8 fis''8 g''8 ]  |
bes'4. bes'8 [g''8 bes'8 ]  |
a'8 [a''8 f''8 c''8 a'8 f'8 ]  |
d''8 [c''8 b'8 c''8 a'8 f'8 ]  |
e'4  < e' g' bes' e''  >4  < e' g' bes' e''  >4  |
 < f' a' f''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
c''4  |
bes''2 g''8 [e''8 ]  |
f''8 [a'''8 f'''8 c'''8 a''8 f''8 ]  |
c''8 [c'''8 a'8 a''8 f'8 f''8 ]  |
<<{e'8 [c''8 ] d''8 [c''8 ] d''8 [c''8 ] } \\ {e'4 e'4 e'4 }>> |
c''8 [a'8 f'8 f'8 a''8 g''8 ]  |
f''8  < b' f'' b''  >4  < b' f'' b''  >4  < b' f'' b''  >8  |
 < c'' e'' c'''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
\key bes \major f'8 [a'8 ]  |
c''8 [bes'8 es''8 d''8 g''8 f''8 ]  |
f''8 [ r16 e''16 f''8  r16 e''16 f''8  r16 e''16 ]  |
f''8 [e''8 g''8 f''8 d''8 bes'8 ]  |
b'4(  c''4)  f'8. [f'16 ]  |
f'8 [a'8 c''8 bes'8 a'8 c''8 ]  |
es''8 [bes'8 c''8 g''8 f''8 es''8 ]  |
d''8 [f''8 bes''8 d'''8 c'''8 a''8 ]  |
bes''4(  bes'''4)   |

}
% ending repeat
}
lefthand = \new Staff =
"2" {
\time 3/4
\clef "bass"
    \partial 4 
  \key f \major 
% start repeat
\repeat volta 2 
{
 r4  |
f,4  < f a c'  >4  < f a c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
c,4  < g bes c'  >4  < g bes c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
<<{c8 [c'8  < g bes  >8 c'8  < g bes  >8 c'8 ] } \\ {c2. }>> |
 < f a  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
c4  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
 < d f b  >4  < d' f'  >4  < d' f'  >4  |
 < c' g'  >4 c4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
\key bes \major  r4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
 < f a es'  >2.  |
f,4  < f c' es'  >4  < f c' es'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
 < bes, bes  >4 
\clef "treble"  < d' bes'  >4  < f' c''  >4  |

\clef "bass"  < f d  >2  |

}
% ending repeat
}


\score {
  {
    <<
      \righthand
      \lefthand
    >>
  }
%  \layout {}
%  \midi {}
}

