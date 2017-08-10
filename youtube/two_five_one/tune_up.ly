\version "2.18"

harmonies = \chordmode {
    \repeat volta 2 {
      e1:m7 a:7 d:maj7   d:maj7    \break 
      d:m7  g:7 c:maj7   c:maj7     \break 
      c:m7  f:7 bes:maj7 bes:maj7 \break 
    }
    \alternative {
      {
      e:m7  f:7 bes:maj7 a:7 |  \break
      }
      {
      e:m7  a:7 d:maj7   d:maj7 | \break 
      }
    }
}
\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new Staff {
      \relative c' { \harmonies \bar "|."}
    }
  >>
  \layout {
    indent = 0
  }
}
