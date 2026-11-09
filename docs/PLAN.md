# Tune Composer: Positioning and Development Plan

*Last updated November 8, 2026*

## Positioning

**One-liner:** Flat is where you write a score. Tune Composer is where a band's songs live, from the first chart to the release, and where other musicians come to play them.

**Who it's for, in order:**
1. **Bands and Acts.** The working unit is an Act with players, not a teacher with students. The core question it answers: what does each player need at Thursday's practice?
2. **The label.** Artists, songs, sessions and projects in one place.
3. **The musician community.** Public arrangements that other musicians find, play, fork and learn from. The public side is aimed at musicians, not fans.

**What's different from Flat, MuseScore and tab sites:**
- **Arrangements branch and fork.** They aren't single documents. You can have an acoustic branch and a full-band branch, and fork someone's public arrangement for your lineup. Every change has a version, and you can see what changed in the music.
- **Parts come first.** Every player gets their part in the format they read (notation, tab or both, in their tuning), and the app knows when someone's chart is stale.
- **The chart is connected to the music.** A song links its charts to the sessions recorded from them, and later to releases.
- **Community built around arrangements.** Musicians follow arrangers and Acts, fork and credit each other, and eventually buy and sell charts.

**Honest risks:**
- A notation editor never ends. We won't out-build Flat or MuseScore on engraving features, so we compete on the workflow around the chart.
- A community is worthless until people are in it. We seed it with real content from our own label and bands before opening it up.

## Community ideas (for the musician audience)

These build on what the tool already does, so they need little invention:
- **Forks with credit.** "Arranged by X, forked from Y." The fork tree is visible, so good arrangements spread and their authors get the credit.
- **Arranger and Act profiles.** Public arrangements, instruments played, and the forks and plays each one has received.
- **Browse by what you play.** Find songs that have a bass tab part in drop D, or 5-piece arrangements with horns.
- **Lineup-aware forking.** Fork an arrangement for my band (two guitars, bass and keys, no horns) and get a starting point with parts mapped to my players.
- **Requests.** "Looking for a full-band arrangement of ___", which arrangers can answer.
- **Comments on bars.** Feedback pinned to a measure, the way code review comments pin to a line.
- **Later: paid charts.** Arrangers sell charts and premium arrangements, with the creator keeping most of the money, Bandcamp-style.
- **Licensing:** Public arrangements of original songs are simple. Arrangements of covers need a licensing plan before charts can be sold. Free sharing of cover arrangements also needs a policy decision.

## Development order

The principle: each phase ships something useful on its own. Editor polish continues throughout, driven by what real charts expose rather than by a feature checklist.

### Phase 1: An editor good enough for real practice charts
- **Done (prototype):**
  - Parts: guitar, bass, keys and lead parts
  - Entry: piano entry, tab-first entry, stacked chords
  - Engraving: beaming, key and time signatures
  - Custom tunings
  - Chord lane and section labels
  - Playback
  - LilyPond export with a score and per-player parts
- **Still needed:** ties, triplets, repeats and endings, and a check that the LilyPond output compiles
- **Done when:** you can chart the next three songs your band actually plays without workarounds

### Phase 2: The backbone
- Accounts and sign-in
- Songs saved on a server instead of in one browser
- Every save is a version in git, with history and restore
- A server running LilyPond that produces real PDFs for the score and every part
- Pick hosting and set up deploys
- **Done when:** you can start a chart on the iPad, open it on a laptop, and print parts from either

### Phase 3: Private collaboration in your circle
- Acts and artist profiles; invite players and set roles (owner, editor, player)
- Songs owned by Acts; writer and player credits
- Visibility: you see what you created or are tied to
- Branches for arrangements, visual diffs, proposals the owner approves
- Player reading preferences on profiles drive part export, and the app flags stale charts
- **Done when:** your own bands use it for real practices

### Phase 4: Label tools
- Recording sessions (Tascam Model 12, MPC Live) with a file manifest from a folder import, each linked to a chart version
- Projects and scheduling for releases, rehearsals and sessions
- **Done when:** you run a release or a recording block through it

### Phase 5: The public community
- Public arrangements and profiles; browse and search by instrument, tuning and lineup
- Forking with credit and a visible fork tree
- Follows, comments pinned to bars, requests
- Seed with the label's own public arrangements before opening up
- **Done when:** musicians outside your circle fork and play arrangements

### Phase 6: Marketplace and business
- Paid charts and arrangements, with a licensing approach for covers
- Splits, registrations and release metadata
- Audio and project file storage

**Stretch goals:** playing parts in by MIDI or importing them from the MPC; chord-chart-first entry; Apple Pencil input.

## Architecture notes

- **The editor is a separate module** from the social and catalog app. It reads and writes one song model and produces LilyPond. The rest of the app never needs to know notation details.
- **One shared data model** underlies everything, so design it in Phase 2 even though most of it surfaces later:
  - User
  - Act or Artist
  - Membership (with role)
  - Song, with credits (writer or player)
  - Arrangement (a branch), Part, and Version (a git commit)
  - Session
  - Project
  - Visibility (private, Act, or public)
  - Fork (with a parent link)
- **LilyPond is the stored format.** It diffs as plain text and renders on the server. The editor's JSON model is what the UI edits, and it's regenerated from or saved alongside the LilyPond.
- **Web app, touch-first,** tested on iPad throughout. Offline read-only charts for practice can come later; offline editing is deferred.

## Open questions
- Hosting provider and stack for Phase 2
- Whether the editor's JSON model or the LilyPond file is the source of truth when they disagree. The current lean is JSON for editing and LilyPond as the versioned, rendered output, with both committed.
- Pricing and revenue split for paid charts
- Policy for public arrangements of cover songs

## Prototypes in this repo
- `prototypes/chart-editor/`: the editor (open `index.html`)
- `prototypes/part-export/`: the original score and per-player parts script
