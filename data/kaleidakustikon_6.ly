
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
\mark \markup { \teeny { "a.6" } } \acciaccatura d''8 c''8 [b'8 ]  |
 \acciaccatura d''8 c''8 [b'8  \acciaccatura {d''8 } c''8 b'8 c''8 f''8 ]  |
\mark \markup { \teeny { "b.6" } }a''4. e''8 [g''8 f''8 ]  |
\mark \markup { \teeny { "c.6" } }bes''8 [fis''8 a''8 g''8 e''8 c''8 ]  |
\mark \markup { \teeny { "d.6" } }bes'4. g'8 [c''8 bes'8 ]  |
\mark \markup { \teeny { "e.6" } }a'8 [c''8 f''8 a''8 c'''8 a'8 ]  |
\mark \markup { \teeny { "f.6" } }g'8 [g''8 aes'8 aes''8 f'8 f''8 ]  |
\mark \markup { \teeny { "g.6" } }e'8 [g'8 bes'8 d''8 c''8 e'8 ]  |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\mark \markup { \teeny { "" } }c''4  |
c''2.  |
\mark \markup { \teeny { "i.6" } }c'''8 [bes''8 a''8 g''8 f''8 e''8 ]  |
\mark \markup { \teeny { "k.6" } }g''8 [f''8 a''8 e''8 f''8 d''8 ]  |
\mark \markup { \teeny { "l.6" } }c''4. e'8 [g'8 f'8 ]  |
\mark \markup { \teeny { "m.6" } }e'8 c''4 bes'8 [g'8 e'8 ]  |
\mark \markup { \teeny { "n.6" } }f'8 [a'8 a'8 c''8 c''8 f''8 ]  |
\mark \markup { \teeny { "o.6" } }f''8 [e''8 g''8 f''8 a''8 b'8 ]  |
c''2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key bes \major \mark \markup { \teeny { "p.6" } }f''8 [a''8 ]  |
c'''8 [bes''8 d'''8 a''8 bes''8 g''8 ]  |
\mark \markup { \teeny { "q.6" } }f''4. d''8 [bes'8 d''8 ]  |
\mark \markup { \teeny { "r.6" } }f''8 [d'''8 bes''8 f''8 d''8 bes'8 ]  |
\mark \markup { \teeny { "s.6" } }b'8 [c''8 es''8 d''8 c''8  r16 f'16 ]  |
\mark \markup { \teeny { "t.6" } }f'8 [g'8 a'8 bes'8 c''8 d''8 ]  |
\mark \markup { \teeny { "u.6" } }es''8 [c'''8~ ] \times 2/3 { c'''8 bes''8 a''8  }
  \times 2/3 { g''8 f''8 es''8  }
   |
\mark \markup { \teeny { "v.6" } }<<{cis''8 [d''8 ] f''8 [es''8 ] d''8 [cis''8 ] } \\ { s4 g'4 a'4 }>> |
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
s64
 r4  |
f,4  < f a c'  >4  < f a c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
 < bes d'  >4  < b d' f'  >4  < b, d aes  >4  |
<<{c4  < g bes  >4  < g bes  >4 } \\ {c2. }>> |
 < a f  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
c4  |
c2.  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
 < d f b  >2.  |
c8 [e8 g8 c'8 ]  |

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
 < g bes  >4  < es c'  >4  < f es'  >4  |
 < bes d'  >4 bes,  |

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


