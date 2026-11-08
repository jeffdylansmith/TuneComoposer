# Band Chart Prototype

One arrangement in, a full score plus a part for every player out.

## Files
- `music.ly`: the arrangement, with each part written once at concert pitch. This is the file the app versions.
- `band.json`: the parts, plus each player and the format they read (`notation`, `tab`, or `notation+tab`).
- `export.py`: the "Export parts" button. It generates `practice-arrangement.ly` and runs LilyPond.

## Run it
1. Install LilyPond 2.24 or newer from lilypond.org.
2. Run `python3 export.py`.

You get:
- `practice-arrangement-score.pdf`: full score
- `practice-arrangement-guitar-jeff.pdf`: chords, notation, and tab
- `practice-arrangement-bass-sam.pdf`: tab with rhythms
- `practice-arrangement-keys-ria.pdf`: chords and piano staff, with the intro rest collapsed

To change a player's format, edit `band.json` and run the script again. To add a player, add a line under `players`.
