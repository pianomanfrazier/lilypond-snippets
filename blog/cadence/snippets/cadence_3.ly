\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  \partial 4 <g c g'> <a d f> <a c ees> <g c e> <g b f'> <g c e>2
}

bassline = \relative c {
  \clef bass
  \partial 4 e4 f fis g g, c2
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I 6 } 
  \markup \rN { ii 6 5 } 
  \markup \rN { vii o 7 / V } 
  \markup \rN { I 6 4 } 
  \markup \rN { V 7 }
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
