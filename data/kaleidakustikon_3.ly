righthand = \new Staff =
"1" {
\time 3/4
\clef "treble"
    \partial 4 
  \key f \major 
% start repeat
\repeat volta 2 
{
c'8 [f'8 ]  |
a'8 [f'8 c''8 a'8 f''8 c''8 ]  |
a''8 [f''8 d'''8 c'''8 a''8 f''8 ]  |
e''8 bes''4 g''8 [e''8 c''8 ]  |
b'8 [c''8 b'8 c''8 g'8 c''8 ]  |
a'8 [a''8 g''8 f''8 e''8 f''8 ]  |
g'8 [bes'8 d''8 g''8 bes''8 d'''8 ]  |
e'8 c''4 e'8 [c''8 e'8 ]  |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
c''4  |
bes''2 a''8 [g''8 ]  |
f''8 [e''8 g''8 f''8 a''8 f''8 ]  |
\times 2/3 { c''8 f''8 a''8  }
  \times 2/3 { c'''8 a''8 f''8  }
  \times 2/3 { c''8 a'8 f'8  }
   |
e'8 d''4 b'8 [c''8 e'8 ]  |
e'(  [f' a' c'' a'' g'')  ]  |
f''4  < a' a''  >4  < f' f''  >4  |
 < c'' c'''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
\key bes \major f'4~  |
f'8 [d''8 a'8 bes'8 g''8 f''8 ]  |
f''4. f'''8 [d'''8 bes''8 ]  |
g''8 [f''8 cis''8 d''8 a'8 bes'8 ]  |
b'8 [c''8 es''8 d''8 c''8 f'8 ]  |
f'4  \acciaccatura {g'8 [f'8 e'8 f'8 ] }
	a'8 [f'8 c''8 a'8 ]  |
es''8 [es'''8 c'''8 a''8 f''8 es''8 ]  |
d''8 [bes'8 g'8 c''8 a'8 f'8 ]  |
bes4  r4  |

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
f,4  < c' a f  >4  < c' a f  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
c4  < c' bes g  >4  < c' bes g  >4  |
c4  < c' g e  >4  < c' g e  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
 < bes d'  >2.  |
<<{c4  < g bes  >4  < g bes  >4 } \\ {c2. }>> |
 < a f  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
c4  |
c8 [c'8 ]  < e g  >8 [c'8  < e g  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 a,8 a8 f,8 f8 ]  |
c,2  |

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
 < g bes  >4  < es es'  >4  < f c'  >4  |
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
  \layout {}
  \midi {}
}

