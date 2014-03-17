
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
% s64

s64
\mark \markup { \teeny { "a.7" } }a'8 [bes'8 ]  |
c''8 [d''8 e''8 f''8 g''8 gis''8 ]  |
\mark \markup { \teeny { "b.7" } }a''8 [f''8 c''8 c'''8 a''8 f''8 ]  |
\mark \markup { \teeny { "c.7" } }dis''8 [e''8 g''8 fis''8 a''8 g''8 ]  |
\mark \markup { \teeny { "d.7" } }bes'4  < c' g' bes'  >4. bes'8  |
\mark \markup { \teeny { "e.7" } }a'8 [e''8 f''8 c''8 bes'8 a'8 ]  |
\mark \markup { \teeny { "f.7" } }cis''8 [d''8 a'8 c''8 bes'8 g'8 ]  |
\mark \markup { \teeny { "g.7" } }<<{e'8 [c''8 b'8 c''8 d''8 c''8 ] } \\ { s4 e'4 e'4 }>> |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\mark \markup { \teeny { "" } }c''4  |
\mark \markup { \teeny { "i.7" } }bes''4. g''8 [c'''8 e''8 ]  |
\mark \markup { \teeny { "k.7" } }f''4  \acciaccatura {g''8 [f''8 ] } e''8 [f''8 a''8 f''8 ]  |
\mark \markup { \teeny { "l.7" } }c''4 b'8 [c''8 a'8 f'8 ]  |
\mark \markup { \teeny { "m.7" } }e'8 [c''8 ] c''8 [e'8 ] c''8 [e'8 ]  |
\mark \markup { \teeny { "n.7" } }f'8 [f''8 e''8 f''8 a''8 g''8 ]  |
\mark \markup { \teeny { "o.7" } }f''4  < bes' c'' g''  >4  < a' c'' f''  >4  |
 < g' c'' e''  >4  < c'' e'' c'''  >4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major \mark \markup { \teeny { "p.7" } }f'''8 [e'''8 ]  |
g'''8 [f'''8 cis'''8 d'''8 a''8 bes''8 ]  |
\mark \markup { \teeny { "q.7" } }f''8  r8 f''4. f''8  |
\mark \markup { \teeny { "r.7" } }g''8 [f''8 d''8 bes'8 a'8 bes'8 ]  |
\mark \markup { \teeny { "s.7" } }f''8 [es''8 c''8 a'8 ] f'4~  |
\mark \markup { \teeny { "t.7" } }f'4 f'4 f'4  |
\mark \markup { \teeny { "u.7" } }es''4. c''8 [f''8 es''8 ]  |
\mark \markup { \teeny { "v.7" } }d''8 [bes''8 c''8 g''8 f''8 a'8 ]  |
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
% s64

s64
 r4  |
f,4  < f a c'  >4  < f a c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
c4  < g bes c'  >4  < g bes c'  >4  |
c,8 [e,8 g,8 c8 e8 c8 ]  |
f,4  < f c'  >4  < f c'  >4  |
bes,4  < bes d'  >4  < bes d'  >4  |
<<{c4  < g bes  >4  < g bes  >4 } \\ {c2. }>> |
 < f a  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
c4  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8 ]  < g bes  >8 [c'8  < g bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8  < e g  >8 c'8  < f a  >8 c'8 ]  |
c4  < g' c'  >4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major  r4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
 < f a es'  >2.  |
f,8 [c'8 a8 f8 c8 a,8 ]  |
f,4  < f a c'  >4  < f a c'  >4  |
 < g bes  >4  < es c'  >4  < f es'  >4  |
 < bes d'  >4 bes,  |

}
% ending repeat
}


\score {
\new PianoStaff
    <<
    \set PianoStaff.instrumentName = #"Piano  " 
    \righthand
    \lefthand
    >>
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


