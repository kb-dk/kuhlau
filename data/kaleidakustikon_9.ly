
\paper {
paper-height = 150\mm
paper-width  = 297\mm 
top-margin = 0\mm
bottom-margin = 0\mm
ragged-last-bottom = ##f
last-bottom-spacing #'basic-distance = #0 
}

\header {
  tagline = ""  % removed
} 

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
\mark \markup { \teeny { "a.9" } }c''8 [bes'8 ]  |
c''8 [a'8 f'8 a'8 c''8 f''8 ]  |
\mark \markup { \teeny { "b.9" } }a''8 [f''8 ]  < c''' c''  >4. f''8  |
\mark \markup { \teeny { "c.9" } }bes''8 [g''8 bes''8 g''8 e''8 c''8 ]  |
\mark \markup { \teeny { "d.9" } }bes'4. fis''8 [g''8 bes''8 ]  |
\mark \markup { \teeny { "e.9" } }a'8 [f''8 e''8 f''8 c''8 a'8 ]  |
\mark \markup { \teeny { "f.9" } }g'8 [cis''8 d''8 bes'8 g'8 f'8 ]  |
\mark \markup { \teeny { "g.9" } }e'8 [bes''8 g''8 e''8 c''8 e''8 ]  |
f''4  r4  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\mark \markup { \teeny { "" } }c''4  |
\mark \markup { \teeny { "i.9" } }bes''4. d'''8 [c'''8 e''8 ]  |
\mark \markup { \teeny { "k.9" } }f''8 [f''8 f'''8 c'''8 a''8 f''8 ]  |
\mark \markup { \teeny { "l.9" } }c''2 c''8. [c''16 ]  |
\mark \markup { \teeny { "m.9" } }e'8 [g'8 d''8 c''8 bes'8 g'8 ]  |
\mark \markup { \teeny { "n.9" } }f'8 [a'8 c''8 f'8 a'8 c''8 ]  |
\mark \markup { \teeny { "o.9" } }f''4  < e' g' c'' e''  >4  < f' a' c'' f''  >4  |
 < g' c'' e'' g''  >2  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major \mark \markup { \teeny { "p.9" } } r4  |
 r4  r16 f'16 [g'16 a'16 ] bes'16 [c''16 d''16 es''16 ]  |
\mark \markup { \teeny { "q.9" } }f''4. e''8 [f''8 e''8 ]  |
\mark \markup { \teeny { "r.9" } }f''8 [e''8 g''8 f''8 a'8 bes'8 ]  |
\mark \markup { \teeny { "s.9" } }<<{f''4. es''8 [c''8 a'8 ] } \\ {a'2. }>> |
\mark \markup { \teeny { "t.9" } }f'8 [ r16 f'32 g'32 ] a'8 [ r16 a'32 bes'32 ] c''8 [ r16 c''32 d''32 ]  |
\mark \markup { \teeny { "u.9" } }es''4  \acciaccatura {f''8 [es''8 d''8 es''8 ] } a''8 [g''8 f''8 es''8 ]  |
\mark \markup { \teeny { "v.9" } }d''16 [bes''16 ]  r8 bes'16 [g''16 ]  r8 f''16 [a'16 ]  r8  |
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
f,4 
\clef "treble"  < a f'  >8 [ < c' g'  >8 ]  < f' a'  >4 
\clef "bass"  |
c4  < e g c'  >4  < e g c'  >4  |
c4  < e g c'  >4  < e g c'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
bes,4  < bes d'  >4  < bes d'  >4  |
c4 
\clef "treble"  < c' e' g'  >4  < c' g' bes'  >4  |
 < f' a'  >4 
\clef "bass" f  |

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
c8 [c'8 ]  < e bes  >8 [c'8  < e bes  >8 c'8 ]  |
c8 [c'8 ]  < f a  >8 [c'8  < f a  >8 c'8 ]  |
c8 [c'8  < g bes  >8 c'8  < f a  >8 c'8 ]  |
c [c' b c' ]  |

}
% ending repeat

% start repeat
\repeat volta 2 
{
% s64
\key bes \major  < f c'  >8. [ < f c'  >16 ]  |
 < bes d'  >4  < c' es'  >4  < f c'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
bes,4  < f bes d'  >4  < f bes d'  >4  |
 < f a es'  >2.  |
f,4  < f c' es'  >4  < f c' es'  >4  |
f,4  < f a c'  >4  < f a c'  >4  |
bes,8  r8  < bes d'  >8  r8  < f es'  >8  r8  |
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

