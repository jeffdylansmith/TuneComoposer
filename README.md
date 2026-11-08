# Tune Composer

A catalog manager for running a music label: charts, versions, artists and recordings in one place.

LilyPond handles notation. Every song is backed by git, so arrangements get diffs, branches and multiple collaborators. The app is a web app built touch-first so it works well on an iPad.

## What's here

- `prototypes/chart-editor/`: A touch-first chart editor for full band arrangements, in one HTML file. Open `index.html` in a browser. It has multiple parts, stacked chords, beaming, key and time signatures, and custom tunings. You can enter notes from a piano keyboard or write tab first. It exports LilyPond for the full score plus one part per player.
- `prototypes/part-export/`: The "Export parts" idea. One arrangement file produces a full score plus a part for each player in the format they read (notation, tab, or both). It needs Python and LilyPond 2.24 or newer. See its README.
- `docs/PLAN.md`: The product plan and roadmap.
