\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \minor
  \time 4/4

  <f c' f> <f bes d> <ees bes' ees> <ees aes c> |
  <\tweak color #red \tweak Accidental.color #red des aes' \tweak color #red \tweak Accidental.color #red des> <f g b> <ees g c>2 \bar "|."
}

bassline = \relative c {
  \clef bass
  \key c \minor
  aes'4 bes g aes f g c,2
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"c:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { iv 6 }
  \markup \rN { VII }
  \markup \rN { III 6 }
  \markup \rN { VI }
  \tweak color #red \markup \rN { N 6 }
  \markup \rN { V 7 }
  \markup \rN { I }
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