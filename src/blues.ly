\include "../styles/gonville.ily"
\include "../styles/roman_numeral_analysis_tool.ily"
\include "../styles/size.ily"
\version "2.18.2"

melody = \relative c' {
  %show all measure numbers
  \override Score.BarNumber.break-visibility = ##(#f #t #t)
  \clef treble
  \key c \major
  \time 4/4
  \bar ".|:"
  s1 s s s \break
  s s s s \break
  s s s s \bar ":|."
}

harm = \chordmode {
  c1:7 f:7 c:7 c:7
  f:7 f:7 c:7 c:7
  g:7 f:7 c:7 c:7
}

analysis = \lyricmode {
  \set stanza = \markup \keyIndication { C } %% after 2.19.15 use E-flat
  %\override LyricText.self-alignment-X = #LEFT
  \markup \rN { I 7}1
  \markup \rN { IV 7}
  \markup \rN { I 7}
  \markup \rN { I 7}
  \markup \rN { IV 7}
  \markup \rN { IV 7}
  \markup \rN { I 7}
  \markup \rN { I 7}
  \markup \rN { V 7}
  \markup \rN { IV 7}
  \markup \rN { I 7}
  \markup \rN { I 7}
  % Equivalent to the following:
  % V2.
}

\score {
  <<
  \new ChordNames {
    \harm
  }
  \new Staff \melody
  \new Lyrics \analysis
  >>
  \layout { indent = 0.0 }
}
