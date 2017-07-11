\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 6/4
  \override Staff.TimeSignature #'stencil = ##f
  <e g \tweak color #magenta c> <\tweak color #magenta f a c> <e g \tweak color #magenta c> <d \tweak color #magenta g b> <e g \tweak color #magenta c>
}

bassline = \relative c {
  \clef bass
  <c e g>4 <c f a> <c e g> <b f' g> <c e g>2
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  \markup \rN { I 6}
  \markup \rN { IV } 
  \markup \rN { I 6 }
  \markup \rN { V 6 4 }
  \markup \rN { I 6 }
}

\score {
  \new PianoStaff = "piano" <<
    \new Voice = "upper" \upper
    %\new Voice = "lower" \bassline
    \new Lyrics \with {
      % to control distance of analysis from staff
      \override VerticalAxisGroup.nonstaff-relatedstaff-spacing = #'((basic-distance . 6.5))
    } \lyricsto "upper" { \analysis }
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