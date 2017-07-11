\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"
upper = \relative c' {
  \clef treble
  \key c \major
  \time 6/4
  \override Staff.TimeSignature #'stencil = ##f
  <\tweak color #magenta c e g> <c \tweak color #magenta f a> <\tweak color #magenta c e g> <b d \tweak color #magenta g> <\tweak color #magenta c e g>
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
  I 
  \markup \rN { IV 6 4 } 
  I 
  \markup \rN { V 6 }
  I
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