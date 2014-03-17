righthand = \new Staff =
"1" {
\time 3/4
\clef "treble"
    \partial 4 
  \key f \major 
% start repeat
\repeat volta 2 
{
 < c' f' a' c''  >8. [ < c' f' a' c''  >16 ]  |
 < c' f' a' c''  >4  < c' f' a' c''  >4 c''8. [f''16 ]  |
a''4. f''8 [a''8 f''8 ]  |
bes''8 [g''8 e''8 g''8 e''8 c''8 ]  |
c''4. d''8 [bes'8 c''8 ]  |
a'8 [gis''8 a''8 e''8 gis''8 f''8 ]  |
g'4  < d'' f'' aes'' d'''  >4. f'8  |
e'4  \acciaccatura {f'8 [e'8 cis'8 ] } e'8 [g'8 bes'8 e'8 ]  |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
c''4  |
c'''4. bes''8 [g''8 e''8 ]  |
g''8 [f''8 e''8 f''8 a''8 f''8 ]  |
c''4. c''8 [a'8 f'8 ]  |
e'8 [g'8 c''8 bes'8 g'8 e'8 ]  |
f'(  [a'8 c''8 a''8 a''8 g''8)  ]  |
f''4  < c'' f'  >4  < a' f'  >4  |
 < e' g'  >4  < c''' e'' c''  >4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
\key bes \major f'''4~  |
f'''8 [cis'''8 d'''8 a''8 bes''8 g''8 ]  |
f''4. f''8 [d'''8 bes''8 ]  |
f''8 [bes''8 d''8 f''8 bes'8 d''8 ]  |
<<{f''4~ es''4 f'8. [f'16 ] } \\ {a'2  s4 }>> |
f'4  \acciaccatura {g'8 [f'8 e'8 ] } f'8 [a'8 c''8 d''8 ]  |
\times 2/3 { e''8 d'''8 c'''8  }
  \times 2/3 { bes''8 a''8 g''8  }
  \times 2/3 { f''8 e''8 e''8  }
   |
\times 2/3 { d''8 f''8 bes''8  }
  \times 2/3 { f''8 d''8 bes'8  }
  \times 2/3 { es''8 c''8 a'8  }
   |
bes'4  r4  |

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
f,8. [f,16 ]  |
f,8 [f8 a8 f8 c8 a,8 ]  |
f,4  < f a c'  >4  < f a c'  >4  |
c4  < g bes c'  >4  < g bes c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
 < b d'  >4  < f' aes' b d'  >4.  r8  |
<<{c4  < g bes  >4  < g bes  >4 } \\ {c2. }>> |
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
c8 [c'8 a8 c'8 f8 c'8 ]  |
c4  < g' c'  >4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
\key bes \major  r4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
 < es' c' f  >2  r4  |
f,4  < es' c' f  >4  < es' c' f  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
bes,4  < bes d'  >4  < c' f  >  |
 < bes d'  >4 bes,4  |

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

