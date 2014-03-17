
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
\mark \markup { \teeny { "a.11" } }c'8. [c'16 ]  |
f'4. a'8 [c''8 f''8 ]  |
\mark \markup { \teeny { "b.11" } }a''8 [f''8 f'''8 c'''8 a''8 f''8 ]  |
\mark \markup { \teeny { "c.11" } }e''8 [g''8 bes''8 g''8 e''8 c''8 ]  |
\mark \markup { \teeny { "d.11" } }bes'4. b'8 [c''8 bes'8 ]  |
\mark \markup { \teeny { "e.11" } }a'8 [f''8 e''8 f''8 g''8 f''8 ]  |
\mark \markup { \teeny { "f.11" } }g'8 [bes'8 d''8 g''8 bes''8 f'8 ]  |
\mark \markup { \teeny { "g.11" } }e'4  \acciaccatura f'8 e'8. [d'16 e'8. c'16 ]  |
f'4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key f \minor \mark \markup { \teeny { "h.11" } } r4  |
<<{ r4  r4 } \\ { s2 c''8. [c''16 ] }>> |
\mark \markup { \teeny { "i.11" } }c'''8 [bes''8 bes''8 g''8 g''8 es''8 ]  |
\mark \markup { \teeny { "k.11" } }f''8 aes''4 f''8 [aes''8 f''8 ]  |
\mark \markup { \teeny { "l.11" } }c''4. f'8 [aes'8 f'8 ]  |
\mark \markup { \teeny { "m.11" } }es'8 [des''8 c''8 bes'8 g'8 es'8 ]  |
\mark \markup { \teeny { "n.11" } }f'8 [f'8 aes'8 f'8 c''8 aes'8 ]  |
\mark \markup { \teeny { "o.11" } }f''8 [aes''8 f''8 c''8 aes'8 f'8 ]  |
 < c'' es'  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major \mark \markup { \teeny { "p.11" } }f''8. [f''16 ]  |
f''8 [d''8 bes''8 f''8 d'''8 bes''8 ]  |
\mark \markup { \teeny { "q.11" } }f''4. bes''8 [d''8 es''8 ]  |
\mark \markup { \teeny { "r.11" } }g''8 [f''8 ]  r8 f''8 [d''8 bes'8 ]  |
\mark \markup { \teeny { "s.11" } }b'8 [c''8 f''8 es''8 c''8 a'8 ]  |
\mark \markup { \teeny { "t.11" } }f'8 [ r16 d''16 es''8  r16 d''16 es''8  r16 d''16 ]  |
\mark \markup { \teeny { "u.11" } }es''8\>  es''8 [es'''8 es''8 es'''8 es''8\!  ]  |
\mark \markup { \teeny { "v.11" } }<<{d''8 [f''8 bes''8 bes'8 ] d''8. [c''16 ] } \\ { s2 a'4 }>> |
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
f,4  < c' a f  >4  < c' a f  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
c4  < c' bes g  >4  < c' bes g  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < c' a f  >4  < c' a f  >4  |
 < d' bes  >2.  |
<<{c8 [g8 bes8 g8 bes8 g8 ] } \\ {c2. }>> |
 < a f  >4 f,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key f \minor c'8. [c'16 ]  |
\change Staff = "1" c''8-. [\change Staff = "1" g'8-. \change Staff = "1" es'8-. \change Staff = "2" c'8-. g8-. es8-. ]  |
c8 [c'8  < bes g  >8 c'8  < bes g  >8 c'8 ]  |
c8 [c'8 ]  < aes f  >8 [c'8  < aes f  >8 c'8 ]  |
c8 [c'8 ]  < aes f  >8 [c'8  < aes f  >8 c'8 ]  |
c8 [c'8 ]  < bes g  >8 [c'8  < bes g  >8 c'8 ]  |
c8 [c'8 ]  < aes f  >8 [c'8  < aes f  >8 c'8 ]  |
c8 [c'8 ]  < aes f  >8 [c'8  < aes f  >8 c'8 ]  |
 < c' g c  >4 c,4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major  r4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
bes,4  < d' bes f  >4  < d' bes f  >4  |
 < es' a f  >2.  |
f,4  < c' a f  >4  < c' a f  >4  |
 < c' a f  >4 
\clef "treble"  < c'' a' f'  >2 
\clef "bass"  |
bes,4  < d' bes  >4  < es' f  >4  |
 < d' bes  >4 bes,4  |

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
\new PianoStaff
    \unfoldRepeats
    <<
    \set PianoStaff.instrumentName = #"Piano  " 
    \righthand
    \lefthand
    >>
    \midi {
    midiMinimumVolume = #0.5
    midiMaximumVolume = #0.9
    }
}

