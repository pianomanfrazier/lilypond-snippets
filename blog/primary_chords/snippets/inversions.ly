\version "2.18.2"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 9/4
  \override Staff.TimeSignature #'stencil = ##f
  <\tweak color #magenta c e g>
  <e g \tweak color #magenta c>
  <g \tweak color #magenta c e>
  <\tweak color #magenta c e g>
  <g \tweak color #magenta c e>
  <e g \tweak color #magenta c>
  <\tweak color #magenta c e g>
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  a2 c
}
chordnames = \lyricmode {
  "root" "1st" "2nd"
}
analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I }
  \markup \rN { I 6 }
  \markup \rN { I 6 4 }
  \markup \rN { I }
  }

\score {
  <<
    \new Voice = "upper" \upper
    \new Lyrics \lyricsto "upper" \chordnames
  >>
  \layout {
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
    }
  }
}
