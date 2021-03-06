\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"

bassline = \relative c'' {
  \clef treble
  \key c \major
  \time 7/4
  \override Staff.TimeSignature #'stencil = ##f
  g a b d e
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"G:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \scaleDegree { 1 }
  \markup \scaleDegree { 2 }
  \markup \scaleDegree { 3 }
  \markup \scaleDegree { 5 }
  \markup \scaleDegree { 6 }
}

\score {
  \new Staff <<
    \new Voice = "bass" { \bassline }
    \new Lyrics \with {
      % to control distance of analysis from staff
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6.5))
    } \lyricsto "bass" { \analysis }
  >>
  \layout {
    \context {
      \Score
      % to control horizontal spacing
      \override SpacingSpanner.shortest-duration-space = #6
    }
    \context {
      \Lyrics
      % to control global size
      %\override LyricText.font-size = #-1
    }
  }
}