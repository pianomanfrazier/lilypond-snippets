\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  <f c' e> <f b e> <e b' d>2
  <ees bes' d>4 <ees? a d> <d a' c>2
  <des aes'  c>4 <des? g c> <c g' bes>2
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
  \markup \rN { ii min9 }
  \markup \rN { V 13 }
  \markup \rN { I maj9 }
  \set stanza  = \markup { B\flat: }
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min9 }
  \markup \rN { V 13 }
  \markup \rN { I maj9 }
  \set stanza  = \markup { A\flat: }
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min9 }
  \markup \rN { V 13 }
  \markup \rN { I maj9 }
}

harmonies = \chordmode {
  d4:m9 g:13 c2:maj9       
  c4:m9 f:13 bes2:maj9     
  bes4:m9 ees:13 aes2:maj9 
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
