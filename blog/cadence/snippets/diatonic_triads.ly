\version "2.18"

\include "./styles/roman_numeral_analysis_tool.ily"

bassline = \relative c {
  \clef bass
  \key c \major
  \time 7/4
  \override Staff.TimeSignature #'stencil = ##f
  <\tweak color #magenta c e g>4 <\tweak color #magenta d f a> <\tweak color #magenta e g b> <\tweak color #magenta f a c> <\tweak color #magenta g b d> <\tweak color #magenta a c e> <\tweak color #magenta b d f>
}

analysis = \lyricmode {
  \override LyricText.self-alignment-X = #-0.6
  \offset StanzaNumber.X-offset #-3
  \set stanza  = #"C:"
  % For bare Roman numerals, \rN simply outputs the string.
  %\markup \rN { I }
  I ii iii IV V vi
  \markup \rN { vii o }
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