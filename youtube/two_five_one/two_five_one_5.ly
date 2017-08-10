\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  <c f a> <b f' a> <b e g>2
  <bes ees g>4 <a ees'? g> <a d f>2
  <aes des f>4 <g des'? f> <g c ees>2
}

bassline = \relative c {
  \clef bass
  d4 g c,2 c4 f bes,2 bes4 ees aes,2
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min7 }
  \markup \rN { V 9 }
  \markup \rN { I maj7 }
  \set stanza  = \markup { B\flat: }
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min7 }
  \markup \rN { V 9 }
  \markup \rN { I maj7 }
  \set stanza  = \markup { A\flat: }
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min7 }
  \markup \rN { V 9 }
  \markup \rN { I maj7 }
}

harmonies = \chordmode {
  d4:m7 g:9 c2:maj7       
  c4:m7 f:9 bes2:maj7     
  bes4:m7 ees:9 aes2:maj7 
}

\score {
  \new PianoStaff = "piano" <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff = "upper" \upper
    \new Voice = "lower" \bassline
    \new Lyrics \with {
      % to control distance of analysis from staff
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6.5))
    } \lyricsto "lower" { \analysis }
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
