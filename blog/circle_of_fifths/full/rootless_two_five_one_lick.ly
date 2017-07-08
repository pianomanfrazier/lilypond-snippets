\version "2.18"

\include "./styles/size.ily"
\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  g'16 e \tuplet 3/2 {f a c} e d c a bes8 aes16 bes? g8 f16 g 
  | \tuplet 3/2 { e g b } c a f d e g r2 \bar "|."
}

bassline = \relative c {
  \clef bass
  <f c' e>2 <f b e> | <e b' d>1 \bar "|."
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { ii min9 }
  \markup \rN { V 13sharp9}
  \markup \rN { I maj9 }
}

\score {
  \new PianoStaff = "piano" <<
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