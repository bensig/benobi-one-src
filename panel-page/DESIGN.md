# benobi.one/panel.html — Design Spec

**Date:** 2026-06-25
**Author:** Ben Sigman + Claude
**Purpose:** Standalone HTML presentation telling the story of getting a Google Knowledge Panel live, designed for scroll-snap web viewing AND single-slide screenshot sharing on X / private groups.

---

## Goals

1. **Viral-shareable on X.** Each slide must work as a standalone screenshot — quotable line, byline, no "continued from previous" reasoning.
2. **Credibility for PEF and similar private groups.** Aesthetic must read as "expensive, considered, lasting" — not meme-y.
3. **Definitive playbook.** Builders who scroll through act II get a self-contained reference.
4. **Linked to the canonical guide.** Closing slide drives traffic to the guide. Initial target: GitHub raw view of `google-knowledge-panel-guide.md` in the `benobi-one-src` repo. Can change to a Hugo-rendered page later without breaking the deck.

## Non-goals

- Not a presentation deck for in-person speaking (no PDF export, no speaker notes).
- Not a SEO landing page (lives at `benobi.one/panel.html`, not nested in site nav).
- Not a substitute for the full guide — it's the trailer.

---

## File location

Single file: `static/panel.html` in `benobi-one-src` Hugo project.
Hugo copies `static/*` verbatim → deploys to `benobi.one/panel.html`.
No Hugo templating, no site chrome, no nav, no footer.

## URL

**`https://benobi.one/panel.html`** — share this on X / DMs.

---

## Slide map (20 slides, 2 acts + break)

### Act I — Story (1–9)

| # | Slide | Quotable line (screenshot test) |
|---|---|---|
| 1 | Hook | "10 weeks. No PR firm. No Wikipedia. Here's how I gave myself a Google Knowledge Panel." |
| 2 | What is it | "Google calls it a Knowledge Panel. You don't apply. You give it the right signals." |
| 3 | What you DON'T need | "❌ Wikipedia article. ❌ PR firm. ❌ $5k SEO consultant. ❌ Tier-1 press." |
| 4 | The 5-step recipe | "Schema. Wikidata. Commons image. Consistency. Wait." |
| 5 | Steps 1 + 2 | "JSON-LD on your site. Wikidata Q-item, every claim referenced. ~3 hours of work." |
| 6 | Step 3 — THE UNLOCK | "I uploaded my headshot to Wikimedia Commons. 5 weeks later, the panel appeared." |
| 7 | Steps 4 + 5 | "Make every profile say the same things. Then wait." |
| 8 | Timeline visual | "April 12: first commit. June 23: panel live. 73 days." |
| 9 | Outcome | [Real panel screenshot] + "It worked." |

### Break

| 10 | Want the manual? | "If you're trying to build your own → scroll. If you're done → screenshot and share." |

### Act II — Deep dive (11–20)

| # | Slide | Quotable line |
|---|---|---|
| 11 | JSON-LD `@graph` anatomy | "Person, Books, Software, WebSite — all linked by @id. One brain, four bodies." |
| 12 | Wikidata P-codes | "P31. P106. P800. P18. P551. The five that mattered most." |
| 13 | Commons upload walkthrough | "CC-BY-SA, your own work, paste the filename into Wikidata's P18. Done." |
| 14 | Cross-platform consistency | "Same city. Same title. Same bio. Everywhere." |
| 15 | Validators | "validator.schema.org → 0 errors. Rich Results Test → eligible. Then you wait." |
| 16 | Cloudflare gotcha | "Googlebot hit a stale Fastly edge. Indexed the old version. Always purge after schema deploys." |
| 17 | Wikipedia post-mortem | "I submitted a Wikipedia article. It got declined. The panel went live anyway." |
| 18 | What to skip | "Don't create org Q-items without press. Don't draft Wikipedia articles with LLMs." |
| 19 | Timing benchmark | "Bare start → panel: 10 weeks. All signals in place → panel: 5.5 weeks." |
| 20 | Resources + CTA | "Full guide → benobi.one/[link]. Follow → @bensig." |

---

## Visual system

**Type:**
- Display: `ui-serif, "New York", "Source Serif Pro", Georgia, serif` — large display sizes (5rem–10rem), generous leading
- Body: `ui-monospace, "SF Mono", Menlo, monospace` — small, used for stats, code, captions
- No web fonts. System fonts only — instant load, no FOIT, screenshots render consistently.

**Color:**
- Background: `#fafafa` (warm off-white)
- Body text: `#0a0a0a`
- Accent: `#0066ff` (one accent per slide, used for the key number/word)
- Muted: `#6b7280` (slide numbers, bylines, captions)
- Slide 6 (THE UNLOCK) inverts to dark — `#0a0a0a` bg, `#fafafa` text, `#0066ff` accent. Provides visual punctuation at the story's pivot. Decided.

**Layout per slide:**
- Full-bleed viewport, `min-height: 100vh`
- 16:9 aspect ratio assumed on desktop; content stays within a centered 4:5 safe area
- Padding: `6vw` all sides
- Slide content vertically centered
- Slide number `01 / 20` top-right, small, muted
- `ben sigman · benobi.one` bottom-right, small, muted

**Motion (subtle):**
- `scroll-snap-type: y mandatory` on container
- `scroll-snap-align: start` on each slide
- Content fade-up on enter (intersection observer adds `.in-view` → CSS transition)
- No parallax, no swooshes, no text-by-text reveal

## Interactive behavior

- Scroll-snap is the primary navigation
- Down arrow / Space / Page Down advances one slide
- Up arrow / Page Up goes back
- No nav rail, no progress bar (would distract in screenshots)
- "Skip to deep dive" link on slide 10 (anchor jump to slide 11)

## Assets needed

| Asset | Source | Notes |
|---|---|---|
| Knowledge Panel screenshot (real) | User must capture | Slide 1, 9. Desktop incognito search of "Ben Sigman" |
| Wikidata Q139266967 screenshot | User can capture | Slide 12 |
| Wikimedia Commons upload screenshot | User can capture | Slide 13 |
| benobi.one schema.html screenshot | I can generate from the file | Slide 11 |
| Decline notification screenshot | User has this | Slide 17 |
| Author headshot (already on Commons) | https://commons.wikimedia.org/wiki/File:Ben_Sigman_headshot_2026.jpg | Slide 1 hero or bg accent |

For first cut: I'll build with placeholder boxes labeled "[screenshot: X]". User captures and drops in.

---

## Out of scope (explicit YAGNI)

- Dark mode toggle (one tone wins; slide 6 inversion gives the visual rest)
- PDF export
- Per-slide deep-links (`#slide-3`) — would require JS routing, not worth it
- Custom illustration / generated visuals
- Embedded video/audio
- Analytics beyond what Cloudflare already provides
- i18n
- Print stylesheet

## Done = ready when

- [ ] `static/panel.html` exists and renders cleanly in Chrome, Safari, Firefox
- [ ] Each of 20 slides is screenshot-shareable in isolation
- [ ] No FOIT/FOUT — system fonts only
- [ ] Real screenshots embedded (or placeholder boxes ready for swap)
- [ ] Deployed to `https://benobi.one/panel.html`
- [ ] Cloudflare cache purged after deploy
- [ ] Verified on desktop (1440 + 1920) and mobile (375 + 414)
