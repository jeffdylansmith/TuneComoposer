# Tune Composer: Plan

## Vision

A web app for running a label. Artists, Acts and collaborators work on songs together. Charts are engraved by LilyPond, and every change is versioned. Each recording session is linked to the exact chart version it was tracked against.

## Core ideas

- **LilyPond is the source of truth.** The editor keeps its own simple model of notes, frets, chords and sections, and generates LilyPond from it. Users never have to edit LilyPond by hand, but the plain text still diffs and merges cleanly.
- **Git under the hood.** Each song is a repo. The app adds music-aware features on top: visual score diffs, commit notes such as "bridge rewrite", and branches named after arrangements (`acoustic`, `full-band`).
- **Write once, export many.** An arrangement has parts and sections. Each player has preferences (notation, tab or both, tuning, capo). "Export parts" generates the score plus a PDF for every player, tagged with its version, so stale charts are easy to spot.
- **Touch-first web app.** It runs in iPad Safari and can be added to the home screen, from a single codebase. The editor is designed for fingers first, and hardware keyboard shortcuts also work.

## Data model (draft)

- **User**: a person with an account. Reading preferences live on their profile.
- **Artist / Act**: an artist profile or a band. Users join Acts.
- **Song**: belongs to an Artist or Act. It lists users as writers/composers and as players.
- **Arrangement**: a version of a song (full band, acoustic) with parts and sections. Stored as LilyPond in the song's repo.
- **Part**: an instrument within an arrangement.
- **Session**: a recording date. It records the device (Tascam Model 12 or MPC Live), a file manifest with names, sizes and hashes, the takes, and the chart commit it was recorded against.
- **Project**: a release, rehearsal series or other plan, with a schedule, linked to songs and people.

**Visibility:** Users see what they create or are tied to through an Act, an Artist or a credit on a song. Songs and profiles marked public are discoverable by anyone.

## Roadmap

1. **Chart editor**
   - Notation entry: pick durations and enter notes from an on-screen piano keyboard
   - Tab-first entry: pick strings and enter frets, for players who compose in tab. Notation and tab are two views of the same music.
   - Chords and section labels
   - Guitar and bass tunings, including custom tunings
   - Later in this phase: chord-chart-first entry (type the progression and sections, then fill in parts)
2. **Part export**: full score plus per-player PDFs in each player's preferred format, with transposing instruments and collapsed multi-measure rests
3. **Version history**: commits, branches, text and visual diffs, merging
4. **Users, Acts and permissions**: profiles, membership, credits, visibility, public discovery
5. **Sessions**: recording logs with a Tascam/MPC folder import that builds the manifest automatically
6. **Projects and business**: planning and scheduling, then splits, registrations, licensing and releases
7. **File storage**: audio and project files (git LFS or cloud storage), added without changing the session data model

**Stretch goal:** playing parts in via MIDI or importing them from the MPC.

## Prototype status

- `prototypes/chart-editor`: single-voice, 4/4, guitar or bass. It has piano and tab entry, chords and sections, playback and LilyPond output. Not yet: stacked chords, beaming, key signatures, multiple parts.
- `prototypes/part-export`: a working generator for the score and per-player parts. It's untested against a real LilyPond install so far.

## Open questions

- Hosting: a small server runs LilyPond and git and holds the database.
- Read-only offline charts for practice (easy) vs offline editing (hard, deferred).
