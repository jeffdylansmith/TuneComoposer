# Tune Composer: Positioning and Development Plan

*Last updated November 9, 2026*

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

**Focus on original work.** The community is for people making new things: original songs, original arrangements, and new parts. Cover songs are out of scope for now (see Deferred).

**Honest risks:**
- A notation editor never ends. We won't out-build Flat or MuseScore on engraving features, so we compete on the workflow around the chart.
- A community is worthless until people are in it. We seed it with real content from our own label and bands before opening it up.

## Community ideas (for the musician audience)

These build on what the tool already does, so they need little invention:
- **Forks with credit.** "Arranged by X, forked from Y." The fork tree is visible, so good arrangements spread and their authors get the credit. See Credit tracking below.
- **Arranger and Act profiles.** Public arrangements, instruments played, and the forks and plays each one has received.
- **Browse by what you play.** Find songs that have a bass tab part in drop D, or 5-piece arrangements with horns.
- **Lineup-aware forking.** Fork an arrangement for my band (two guitars, bass and keys, no horns) and get a starting point with parts mapped to my players.
- **Requests.** "Looking for a full-band arrangement of ___", which arrangers can answer.
- **Comments on bars.** Feedback pinned to a measure, the way code review comments pin to a line.
- **Later: paid charts.** Arrangers sell charts and premium arrangements, with the creator keeping most of the money, Bandcamp-style.
## Credit tracking (core principle)

Credit is what makes people comfortable sharing creative work. It's tracked from day one, not bolted on with the community.

- **Roles:** composer, lyricist, arranger, part writer (a specific instrument part), transcriber and performer. A song or arrangement can have several of each.
- **Credit follows the work.** Credits live on the song (who wrote it), on each arrangement (who arranged it), and on each part (who wrote that part). A bass player who writes the bass line is credited for it even if someone else wrote the song.
- **The history is the evidence.** Every version records who made it. The app can show who wrote which bars and when, from the git history. Credits can be edited, but changes to them are themselves recorded.
- **Forks carry lineage.** A fork always points to its parent and keeps the original credits. New contributions are added on top, so a chart can show "Song by A, arrangement by B, forked and re-voiced for horns by C."
- **Originality declaration.** Making a song public includes confirming it's original work, or your own arrangement of material you have rights to.
- **Credits print on the charts.** Exported PDFs show the credits in the header, so they travel with the paper.
- **Later:** credits feed splits and payouts when paid charts arrive.

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
- **Also done:** ties (including across barlines and lines), triplets, repeats with 1st/2nd/3rd endings, and playback that follows repeats and sustains ties
- **Still needed:** a check that the LilyPond output compiles. This happens naturally in Phase 2, when LilyPond runs on the server.
- **Done when:** you can chart the next three songs your band actually plays without workarounds

### Phase 2: The backbone
- Invite-only accounts and sign-in (see Accounts, sign-in and permissions)
- A basic Act with members and roles, enough that your band's songs are private to the band
- Songs saved on a server instead of in one browser
- Every save is a version in git, with history and restore
- A server running LilyPond that produces real PDFs for the score and every part
- Host on Azure (see Hosting) and set up automatic deploys from GitHub
- The credit model from the start: version authorship, plus composer and arranger credits on songs
- **Done when:** you can start a chart on the iPad, open it on a laptop, and print parts from either

### Phase 3: Private collaboration in your circle
- Artist profiles, multiple Acts, and owners inviting their own players (building on Phase 2's basic Act and roles)
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
- Paid charts and arrangements of original work, with payouts based on credits
- Splits, registrations and release metadata
- Audio and project file storage

**Stretch goals:** playing parts in by MIDI or importing them from the MPC; chord-chart-first entry; Apple Pencil input.

## Accounts, sign-in and permissions

**Starts locked down.** The first version is invite-only, for your band. Opening sign-ups later is a setting change, not a rebuild.

**No passwords, ever.** The app never stores passwords. People sign in with:
- **Google**
- **An emailed one-time code or link,** for anyone without a Google account

Apple and Microsoft sign-in can be added later.

**How invite-only works:**
1. You (the label admin) create an invite: the person's email, the Acts they belong to, and their role in each.
2. They sign in with Google or an email code.
3. On first sign-in, the app matches their email to the invite and activates their account.
4. Anyone without an invite sees "This is invite-only for now."

**Data model:** "who you are" is kept separate from "how you signed in," so new sign-in methods never require changes elsewhere.
- **User:** the app's own record (name, profile, reading preferences, label-admin flag)
- **Sign-in identity:** linked to a user, such as a Google account or a verified email. One user can have several.
- **Invite:** email, Acts, role per Act, status (pending, accepted, revoked), and who invited them
- **Membership:** user, Act and role

**Roles:**
- **Label admin (you):** manages invites, Acts and everything else
- **Act owner:** manages the Act's members and songs
- **Editor:** creates and changes charts
- **Player:** views charts and exports their parts

One person can hold different roles in different Acts, such as editor in one band and player in another.

**Permission rules:**
- Songs are private to their Act until Phase 5 adds public visibility.
- The server checks permissions on every request, not just in the screens, so a guessed link never exposes a song.
- Removing someone from an Act removes their access right away. Their credits and version history stay, because credit belongs to the work.

**Implementation options (decide with the Phase 2 stack):**
1. **Built-in sign-in for Azure Container Apps:** handles Google and Microsoft sign-in in front of the app with very little code. Fastest, but less flexible.
2. **Microsoft Entra External ID, or a standard auth library in the app:** supports Google, email codes and Apple, with full control over the sign-in screens and the invite check. **Current lean:** a well-known library, since it's portable, testable locally, and not tied to one host.

## Architecture notes

- **The editor is a separate module** from the social and catalog app. It reads and writes one song model and produces LilyPond. The rest of the app never needs to know notation details.
- **One shared data model** underlies everything, so design it in Phase 2 even though most of it surfaces later:
  - User, Sign-in identity, Invite
  - Act or Artist
  - Membership (with role)
  - Song, with credits (role, person, and what they're credited on: song, arrangement or part)
  - Arrangement (a branch), Part, and Version (a git commit)
  - Session
  - Project
  - Visibility (private, Act, or public)
  - Fork (with a parent link)
- **LilyPond is the stored format.** It diffs as plain text and renders on the server. The editor's JSON model is what the UI edits, and it's regenerated from or saved alongside the LilyPond.
- **Web app, touch-first,** tested on iPad throughout. Offline read-only charts for practice can come later; offline editing is deferred.

## Hosting: Azure

Decided: host on the existing Azure account. The likely shape, to confirm when Phase 2 starts:
- **App and API:** Azure Container Apps. LilyPond runs in its own container, rendering PDFs on request and scaling to zero when idle to keep costs down.
- **Database:** Azure Database for PostgreSQL (Flexible Server), for users, Acts, songs, credits and visibility.
- **Files:** Azure Blob Storage for rendered PDFs now, and for audio and project files later.
- **Git repos for songs:** stored by the app on persistent storage, with Blob backups.
- **Sign-in:** invite-only, with Google and email codes and no passwords. See Accounts, sign-in and permissions.
- **Deploys:** GitHub Actions from the TuneComoposer repo.

## Deferred
- **Cover songs.** Public arrangements of covers, and selling them, need licensing and a policy decision. Parked; the focus is original work. Private charts of covers for your own band's practice are fine to support, since they're never published.

## Open questions
- Exact Azure setup, app stack, and which sign-in option to use (Phase 2)
- Whether the editor's JSON model or the LilyPond file is the source of truth when they disagree. The current lean is JSON for editing and LilyPond as the versioned, rendered output, with both committed.
- Pricing and revenue split for paid charts

## Prototypes in this repo
- `prototypes/chart-editor/`: the editor (open `index.html`)
- `prototypes/part-export/`: the original score and per-player parts script
