
%
% get it as pdf
%
righthand = \new Staff =
"1" {
\time 3/4
\set Score.tempoHideNote = ##t
\tempo 4 = 120
\clef "treble"
    \partial 4 
  \key f \major 
% start repeat
\repeat volta 2 
{
s64
\mark \markup { \teeny { "a.12" } }a''8 [f''8 ]  |
c''8 [f''8 a''8 f''8 c''8 f''8 ]  |
\mark \markup { \teeny { "b.12" } }a''4. a''8 [g''8 f''8 ]  |
\mark \markup { \teeny { "c.12" } }dis''8 [e''8 bes''8 g''8 e''8 c''8 ]  |
\mark \markup { \teeny { "d.12" } }b'8 [c''8 d''8 c''8 bes'8 c''8 ]  |
\mark \markup { \teeny { "e.12" } }a'8 [gis''8 a''8 f''8 c''8 a'8 ]  |
\mark \markup { \teeny { "f.12" } }g'8 [g''8 a'8 a''8 bes'8 bes''8 ]  |
\mark \markup { \teeny { "g.12" } }<<{e'8 c''4 b'8 [d''8 c''8 ] } \\ {e'2. }>> |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key f \minor \mark \markup { \teeny { "h.12" } }c''8. [c''16 ]  |
c'''4. bes''8 [des'''8 c'''8 ]  |
\mark \markup { \teeny { "i.12" } }c'''8 [b''8 bes''8 g''8 bes''8 es''8 ]  |
\mark \markup { \teeny { "k.12" } }es''8 [f''8 g''8 f''8 aes''8 f''8 ]  |
\mark \markup { \teeny { "l.12" } }\times 2/3 { c''8 [f''8 aes''8 ] }
  \times 2/3 { c'''8 [f'''8 aes'''8]  }
  bes'''8 [f'8 ]  |
\mark \markup { \teeny { "m.12" } }es'8 bes'4 g'8 [bes'8 es'8 ]  |
\mark \markup { \teeny { "n.12" } }f'8 [aes'8 des''8 c''8 b'8 c''8 ]  |
\mark \markup { \teeny { "o.12" } }f''4  < c'' g'' bes''  >4  < c'' f'' aes''  >4  |
 < c'' es'' g''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key bes \major \mark \markup { \teeny { "p.12" } }f'''4~  |
f'''8 [bes'''8 d'''8 es'''8 bes''8 d'''8 ]  |
\mark \markup { \teeny { "q.12" } }f''4. d''8 [es''8 e''8 ]  |
\mark \markup { \teeny { "r.12" } }f''8 [bes''8 d''8 g''8 f''8 bes'8 ]  |
\mark \markup { \teeny { "s.12" } }b'8 [c''8 d''8 c''8 ] f'8. [f'16 ]  |
\mark \markup { \teeny { "t.12" } }f'8 [a'8 c''8 gis'8 a'8 c''8 ]  |
\mark \markup { \teeny { "u.12" } }es''8 [g'''16 f'''16 ] es'''16 [d'''16 c'''16 bes''16 ] a''16 [g''16 f''16 es''16 ]  |
\mark \markup { \teeny { "v.12" } }\times 2/3 { d''8 d'8 f'8  }
  \times 2/3 { bes'8 d''8 f''8  }
  d'''8. [c'''16 ]  |
bes''4  r4  |

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
s64
 r4  |
f,4  < f a c'  >4  < f a c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
c4  < g bes c'  >4  < g bes c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
 < bes d'  >4  < fis c' '  >4  < g bes d'  >4  |
<<{c4  < g bes  >4  < g bes  >4 } \\ {c2. }>> |
 < f a  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key f \minor  r4  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f aes  >8 [c'8  < f aes  >8 c'8 ]  |
c8 [c'8 ]  < f aes  >8 [c'8  < f aes  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f aes  >8 [c'8  < f aes  >8 c'8 ]  |
c8 [c'8 es'8 c'8 f'8 f8 ]  |
c'4 c4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key bes \major  r4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
 < f a es'  >2.  |
f,4  < f c' es'  >4  < f c' es'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
bes,4  < bes d'  >4  < f a es'  >4  |
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
}

\score {
  \unfoldRepeats
  {
    <<
      \righthand
      \lefthand
    >>
  }
  \midi {
  midiMinimumVolume = #0.5
  midiMaximumVolume = #0.9
  }
}


