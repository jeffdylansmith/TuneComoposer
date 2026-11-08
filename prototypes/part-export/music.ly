% music.ly — the "source of truth" for the arrangement.
% This is the file the app would version (diff, branch, merge).
% Every part is written ONCE here at concert pitch; layouts are generated.

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 112
}

% Section labels live in their own layer so every score and part gets them.
structure = {
  \mark \markup \box "Intro"  s1*4
  \mark \markup \box "Verse"  s1*8 \bar "||"
  \mark \markup \box "Chorus" s1*8 \bar "|."
}

harmony = \chordmode {
  % Intro
  g1 d e:m c
  % Verse
  g1 d e:m c g d c c
  % Chorus
  e1:m c g d e:m c a:m d
}

% ---------- Guitar (actual pitch; staff uses treble_8 clef) ----------
arpG  = { g,8 d g b d' b g d }
arpD  = { d8 a d' fis' a' fis' d' a }
arpEm = { e,8 b, e g b g e b, }
arpC  = { c8 g c' e' g' e' c' g }

strumEm = { <e, b, e g b e'>4 q q8 q q4 }
strumC  = { <c e g c' e'>4 q q8 q q4 }
strumG  = { <g, b, d g b g'>4 q q8 q q4 }
strumD  = { <d a d' fis'>4 q q8 q q4 }
strumAm = { <a, e a c' e'>4 q q8 q q4 }

guitar = {
  % Intro
  \arpG | \arpD | \arpEm | \arpC |
  % Verse
  \arpG | \arpD | \arpEm | \arpC |
  \arpG | \arpD | \arpC  | \arpC |
  % Chorus
  \strumEm | \strumC | \strumG  | \strumD |
  \strumEm | \strumC | \strumAm | \strumD |
}

% ---------- Bass (actual pitch; staff uses bass_8 clef) ----------
grooveEm = { e,,4. e,,8 r8 e,,8 g,,8 b,,8 }
grooveC  = { c,4. c,8 r8 c,8 e,8 g,8 }
grooveG  = { g,,4. g,,8 r8 g,,8 b,,8 d,8 }
grooveD  = { d,4. d,8 r8 d,8 fis,8 a,8 }
grooveAm = { a,,4. a,,8 r8 a,,8 c,8 e,8 }

bass = {
  % Intro
  g,,2. g,,8 g,, | d,2. d,8 d, | e,,2. e,,8 e,, | c,2. c,8 c, |
  % Verse
  \repeat unfold 8 g,,8 | \repeat unfold 8 d,8 | \repeat unfold 8 e,,8 | \repeat unfold 8 c,8 |
  \repeat unfold 8 g,,8 | \repeat unfold 8 d,8 | \repeat unfold 8 c,8  | \repeat unfold 8 c,8 |
  % Chorus
  \grooveEm | \grooveC | \grooveG  | \grooveD |
  \grooveEm | \grooveC | \grooveAm | \grooveD |
}

% ---------- Keys ----------
keysRH = {
  % Intro: tacet
  R1*4 |
  % Verse: whole-note pads
  <g b d'>1 | <fis a d'> | <g b e'> | <g c' e'> |
  <g b d'>  | <fis a d'> | <g c' e'> | <g c' e'> |
  % Chorus: half notes
  <g b e'>2 q | <g c' e'>2 q | <g b d'>2 q | <fis a d'>2 q |
  <g b e'>2 q | <g c' e'>2 q | <a c' e'>2 q | <fis a d'>2 q |
}

keysLH = {
  R1*4 |
  g,1 | d | e, | c | g, | d | c | c |
  e,1 | c | g, | d | e, | c | a, | d |
}
