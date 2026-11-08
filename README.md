# Tune Composer

A catalog manager for running a music label: charts, versions, artists and recordings in one place.

LilyPond handles notation. Every song is backed by git, so arrangements get diffs, branches and multiple collaborators. The app is a web app built touch-first so it works well on an iPad.

## What's here

- `prototypes/chart-editor/`: A touch-first chart editor in one HTML file. Open `index.html` in a browser. You can enter notes from a piano keyboard, or write tab first from a string and fret pad. Both edit the same music, and the editor shows the LilyPond source it generates.
- `prototypes/part-export/`: The "Export parts" idea. One arrangement file produces a full score plus a part for each player in the format they read (notation, tab, or both). It needs Python and LilyPond 2.24 or newer. See its README.
- `docs/PLAN.md`: The product plan and roadmap.
