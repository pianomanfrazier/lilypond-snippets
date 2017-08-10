\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  <g' e'> <c, g'> <e c'> <c e g> <e g c>
}

bassline = \relative c {
  \clef bass
  c4 e g e, c
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  I 
  \markup \rN { I 6 } 
  \markup \rN { I 6 4 } 
  \markup \rN { I 6 }
  I
}

\score {
  \new PianoStaff = "piano" <<
    \new Voice = "upper" \upper
    \new Voice = "bass" \bassline
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