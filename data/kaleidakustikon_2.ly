
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
\mark \markup { \teeny { "a.2" } }c''8 [a'8 ]  |
f''4  \acciaccatura g''8 f''8 [e''8 f''8 c''8 ]  |
\mark \markup { \teeny { "b.2" } }a''8 [f''8 c'''8 a''8 f'''8 f''8 ]  |
\mark \markup { \teeny { "c.2" } }e''8 [d'''8 c'''8 bes''8 g''8 e''8 ]  |
\mark \markup { \teeny { "d.2" } }c''4. cis''8 [d''8 bes'8 ]  |
\mark \markup { \teeny { "e.2" } }a'8 [c''8 ] f''4. a'8  |
\mark \markup { \teeny { "f.2" } }g'8 [cis''8 e''8 d''8 bes'8 g'8 ]  |
\mark \markup { \teeny { "g.2" } }e'8 c''4 b'8 [b'8 g'8 ]  |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\mark \markup { \teeny { "h.2" } }c''8 [e''8 ]  |
g''4  \appoggiatura a''16 g''8 [fis''8 g''8 a''8 ]  |
\mark \markup { \teeny { "i.2" } }c'''4. b''8 [b''8 g''8 ]  |
\mark \markup { \teeny { "k.2" } }f''8 [a''8 g''8 f''8 e''8 f''8 ]  |
\mark \markup { \teeny { "l.2" } }c''4 c''4 c''4  |
\mark \markup { \teeny { "m.2" } }e'8 [g'8 bes'8 d''8 c''8 e'8 ]  |
\mark \markup { \teeny { "n.2" } }f'8 [a'8 c''8 f''8 a''8 g''8 ]  |
\mark \markup { \teeny { "o.2" } }f''8 [c''8 c'''8 c''8  < f'' c'''  >8 c''8 ]  |
 < c'' e'' c'''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
\key bes \major \mark \markup { \teeny { "p.2" } }f''4~  |
f''8 [d'''8 a''8 c'''8 bes''8 g''8 ]  |
\mark \markup { \teeny { "q.2" } }f''4. f''8 [f''8 f''8 ]  |
\mark \markup { \teeny { "r.2" } }f''8-. [bes''8-. d'''8-. f'''8-. bes'''8-. bes'8 ]  |
\mark \markup { \teeny { "s.2" } }b'8 [c''8 ]  r8 f'8 [f'8 f'8 ]  |
\mark \markup { \teeny { "t.2" } }f'8 [a'8 ] a'8 [c''8 ] c''8 [es''8 ]  |
\mark \markup { \teeny { "u.2" } }es''8 c'''4 a''8 [f''8 es''8 ]  |
\mark \markup { \teeny { "v.2" } }\times 2/3 { d''8 d'''8 bes''8  }
  \times 2/3 { f''8 d''8 bes'8  }
  \times 2/3 { a'8 g''8 f''8  }
   |
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
s64
 r4  |
f,4  < c' a f  >4  < c' a f  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
c4  < c' bes g  >4  < c' bes g  >4  |
c4  < c' g e  >4  < c' g e  >4  |
f,8 [a,8 c8 f8 a8 c'8 ]  |
bes,4  < d' bes  >4  < d' bes  >4  |
<<{c4  < c' bes e  >4  < c' bes e  >4 } \\ {c2. }>> |
 < c' a f  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
s64
 r4  |
c8 [c'8 ]  < e bes  >8 [c'8  < e bes  >8 c'8 ]  |
c8 [c'8 ]  < e bes  >8 [c'8  < e bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c4 
\clef "treble"  < f' a  >4  < a' f'  >4  |
 < c' g'  >2 
\clef "bass"  |

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
f,4  < f a es'  >4  < f a es'  >4  |
f,4  < f c' es'  >4  < f c' es'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
bes,4  < bes d'  >4  < f es'  >4  |
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


