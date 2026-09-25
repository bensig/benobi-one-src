+++
draft = false
date = 2026-06-26T14:30:00-07:00
title = "How I Gave Myself a Google Knowledge Panel"
slug = "google-knowledge-panel-guide"
tags = ["seo", "wikidata", "knowledge-panel", "schema", "guide"]
categories = ["Guide"]
thumbnail = "images/google-knowledge-panel.png"
description = "The full playbook for getting a Google Knowledge Panel without a PR firm or a Wikipedia article. 10 weeks. Validated by my own panel going live in June 2026."
+++

> A scroll-snap slide presentation of this guide lives at [benobi.one/panel.html](/panel.html).
> If you just want the wow + the recipe, start there. The article below is the full manual.

# Google Knowledge Panel Setup Guide

A step-by-step guide for getting a Google Knowledge Panel as an author/entrepreneur. Based on what worked for Ben Sigman's setup.

---

## 1. Schema Markup (JSON-LD on your website)

Add this to the `<head>` of every page on your site. It tells Google exactly who you are in machine-readable format.

```json
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@graph": [
    {
      "@type": "Person",
      "@id": "https://yoursite.com/#you",
      "name": "Your Full Name",
      "alternateName": "your_handle",
      "url": "https://yoursite.com/",
      "image": "https://yoursite.com/images/headshot.jpg",
      "description": "One-line description of who you are and what you do.",
      "jobTitle": "Your Title",
      "homeLocation": {
        "@type": "Place",
        "name": "City, State, USA"
      },
      "knowsAbout": ["Topic 1", "Topic 2", "Topic 3"],
      "sameAs": [
        "https://x.com/yourhandle",
        "https://github.com/yourhandle",
        "https://www.linkedin.com/in/yourhandle/",
        "https://www.imdb.com/name/nmXXXXXXX/",
        "https://www.crunchbase.com/person/your-name",
        "https://www.amazon.com/stores/Your-Name/author/BXXXXXXXXXX"
      ],
      "affiliation": [
        {
          "@type": "Organization",
          "name": "Your Company",
          "url": "https://yourcompany.com/",
          "founder": {"@id": "https://yoursite.com/#you"}
        }
      ]
    },
    {
      "@type": "Book",
      "@id": "https://yoursite.com/your-book/#book",
      "name": "Book Title",
      "url": "https://www.amazon.com/your-book-link",
      "isbn": "978-XXXXXXXXXX",
      "description": "Short description of the book.",
      "datePublished": "2025",
      "inLanguage": "en",
      "author": [
        {"@type": "Person", "@id": "https://yoursite.com/#you"},
        {"@type": "Person", "name": "Co-Author Name"}
      ]
    },
    {
      "@type": "WebSite",
      "@id": "https://yoursite.com/#website",
      "url": "https://yoursite.com/",
      "name": "Your Full Name",
      "author": {"@type": "Person", "@id": "https://yoursite.com/#you"}
    }
  ]
}
</script>
```

**Key points:**
- Use `@graph` with `@id` references so everything is connected
- `sameAs` links tell Google all your profiles are the same person
- `affiliation` with `founder` on the Organization is the correct way to show you founded something
- Add a separate `Book` entry for each book with ISBN and Amazon URL
- Site title should be your name, not a brand name
- `og:site_name` should also be your name

**Validate at:** https://validator.schema.org/ — aim for 0 errors and 0 warnings.

---

## 2. Do not create a Wikidata item for SEO

We did. Admins deleted it.

On 2026-06-29, [User:Ziv](https://www.wikidata.org/wiki/User:Ziv) deleted person item Q139266967 after an [RfD](https://www.wikidata.org/wiki/Wikidata:Requests_for_deletions): notability, plus **spam / advertising**, citing this playbook at [benobi.one/panel](https://benobi.one/panel). The book items and Fred Krueger item went with it.

Wikidata is not a Knowledge Graph CDN. Recreating the same cluster will get the same RfD. Independent press first. A thin person item later, if ever.

Keep `sameAs` to profiles you control. Do not point `sameAs` at a deleted QID.

---

## 3. Google Search Console

1. Go to https://search.google.com/search-console
2. Add your site as a property (DNS verification is most reliable)
3. Submit your sitemap: `https://yoursite.com/sitemap.xml`
4. Use URL Inspection on your key pages and click "Request Indexing":
   - Homepage
   - About page
   - Book pages
   - Project pages
5. Check back in a few days to confirm pages are indexed

---

## 4. Amazon Author Central

1. Go to https://author.amazon.com
2. Sign in and claim your books
3. Add your bio (plain text, no URLs, no HTML, under 1000 characters)
4. Upload your headshot
5. Takes 1-2 days to go live
6. Once live, your author ID (the BXXXXXXXXXX in the URL) goes into your schema markup

---

## 5. Consistency Across Platforms

Make sure your name, description, and key facts match across:
- Your website (schema + visible content)
- LinkedIn
- Amazon Author Central
- Crunchbase
- X/Twitter bio
- About.me or similar

Google cross-references these. Inconsistencies weaken the entity signal.

---

## 6. Website Checklist

- [ ] Site title = your name (not a brand)
- [ ] og:site_name = your name
- [ ] og:title includes your name and descriptor
- [ ] twitter:site = @yourhandle
- [ ] JSON-LD schema on every page
- [ ] About page with bio, credentials, press mentions
- [ ] Press section linking to independent articles (Forbes, etc.)
- [ ] Sitemap.xml is current and submitted to Search Console
- [ ] Social links in footer (GitHub, X, LinkedIn)

---

## 7. Optional: llms.txt

Create a `/llms.txt` file at your site root (like robots.txt but for AI crawlers):

```
# About Your Name
Your Name is a [description]. Based in [City].
[Key facts about you, your companies, your books.]
Official website: https://yoursite.com
```

This is an emerging standard that some AI crawlers read.

---

## 8. Claiming the Knowledge Panel

Once Google creates your panel (usually 2-6 weeks after all signals are in place):

1. Search your name on Google while signed into the Google account you actually use
2. Scroll to the bottom of the Knowledge Panel
3. Click "Claim this knowledge panel"
4. Verify via a linked social account (X, YouTube, etc.)

Google often **never sends the email**. Check spam on the Gmail/Workspace account you were signed in as — not your site's contact@ address. Stay logged in and retry from the panel. There is no separate "claim inbox" on your domain.

---

## Timeline

- Day 1: Schema markup + Search Console
- Day 2-3: Amazon Author Central, LinkedIn update, Crunchbase
- Week 1: Google reindexes your site
- Week 2-6: Knowledge Panel appears (if notability signals are strong enough)

The strongest signals are: independent press coverage mentioning you by name, and published books on Amazon. Not a self-made Wikidata graph.

---

## 9. Validation Workflow

After deploying schema, run validators in this order:

1. **Schema.org Validator** — https://validator.schema.org/
   - Reads everything in your JSON-LD. Aim for 0 errors / 0 warnings.
   - Counts every entity (Person, Book, SoftwareApplication, WebSite).

2. **Google Rich Results Test** — https://search.google.com/test/rich-results
   - Only flags types eligible for *display* features (Article, Book, SoftwareApplication, etc.).
   - Person and WebSite are read by Google but won't appear here — that's normal.
   - **Cache-busting:** Google caches test results per URL. To force fresh re-fetch, append a query string: `https://yoursite.com/?v=2`

3. **Search Console** → URL Inspection → **Request Indexing**
   - Single most important nudge after schema changes.
   - Tells Google to re-crawl with the latest `sameAs` links.

### Common false alarms

- **"Marina del Rey" still shows after deploying Santa Monica** — Cloudflare/CDN edges propagate at different speeds. Verify with: `curl -s -A "Googlebot" https://yoursite.com/` 5–10× and check for consistency. If 10/10 return new content, the live site is fine; the validator is showing its own cached result. Use a `?v=N` cache-buster.
- **Rich Results Test only shows SoftwareApplication, not Person/WebSite** — expected. Google's tool only flags rich-result-eligible types. Schema.org validator is the source of truth for completeness.
- **"Non-critical issues" on SoftwareApplication** — `offers` and `aggregateRating` are optional and don't apply to free open-source projects. Safe to ignore.

---

## 10. Wikidata is not a step

Skip it. See §2. The person item Q139266967 is gone; do not recreate it as part of this playbook.

---

## 11. Hugo + GitHub Pages Deploy Checklist

For Hugo sites where `public/` is a git submodule pointing to a separate `*-html` repo (GitHub Pages flow):

```bash
# 1. Edit source schema
$EDITOR layouts/partials/schema.html

# 2. Build
hugo --minify

# 3. Push the public submodule first
cd public
git add -u
git commit -m "Update schema: <what changed>"
git push origin master
cd ..

# 4. Push the parent repo with the new submodule pointer
git add layouts/partials/schema.html public
git commit -m "<what changed>"
git push origin master

# 5. Wait ~30-60s for GitHub Pages to deploy, then verify
until curl -s https://yoursite.com/ | grep -q "<expected new string>"; do sleep 5; done
echo "DEPLOYED"
```

### robots.txt + sitemap.xml

Hugo emits `sitemap.xml` automatically. For `robots.txt`, drop a file at `static/robots.txt`:

```
User-agent: *
Allow: /

Sitemap: https://yoursite.com/sitemap.xml
```

It will be copied verbatim to `public/robots.txt` on `hugo --minify`.

---

## 11a. Critical: Purge the CDN after schema deploys

**This step matters more than it sounds.** GitHub Pages serves through Fastly, and the apex is fronted by Cloudflare. After a deploy:

- Cloudflare may report `cf-cache-status: DYNAMIC` (not caching) but the `Age:` header from origin can be 30–60 minutes stale on individual edges, because Fastly TTL on Pages HTML defaults to ~10 min and per-edge purges aren't always thorough.
- A single Googlebot fetch hitting one of those stale edges will index the OLD content, even though every other request returns the new version.
- Once Google has a stale snapshot, it sticks until the next crawl — could be days. Knowledge Graph signals are NOT counted from a stale snapshot.

**Real example:** benobi.one schema was deployed at 9 PM. Googlebot crawled at 5:47 AM (~9 hours later) and got the OLD version because that specific edge still had a stale Fastly cache. 20/20 manual Googlebot fetches at the same time returned the NEW version. Cache was purged via Cloudflare → next crawl was clean.

### Standard post-deploy sequence

```bash
# 1. Push schema change (parent + submodule)
git push origin master
cd public && git push origin master && cd ..

# 2. Optional: force fresh Pages rebuild via empty commit on the public repo
cd public && git commit --allow-empty -m "Force rebuild to flush CDN" && git push && cd ..

# 3. Verify origin is serving new content with low Age
curl -sI -A "Googlebot" "https://yoursite.com/?p=$(date +%s)" | grep -iE "^age:|cf-cache"
# If Age is high (>600), purge is needed

# 4. Purge Cloudflare (if you control the zone)
# Dashboard → Caching → Configuration → Purge Everything
# Or via API: curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE/purge_cache" \
#   -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" \
#   --data '{"purge_everything":true}'

# 5. Re-verify Age dropped
for i in {1..5}; do
  curl -sI -A "Googlebot" "https://yoursite.com/?p=$i$(date +%s)" | grep -iE "^age:|cf-ray" | tr '\n' ' '; echo ""
done
# All should be Age: <30

# 6. Search Console → URL Inspection → TEST LIVE URL → REQUEST INDEXING
```

### Diagnostic: stale-edge pocket

If you suspect Google has indexed a stale version, run:

```bash
for i in {1..20}; do
  curl -s -A "Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)" \
    "https://yoursite.com/?gb=$i" | grep -o "<old-string>\|<new-string>" | head -1
done
```

If even 1/20 returns the old string, there's a stale edge → purge before requesting indexing.

### Why "View Crawled Page" lies

Search Console's **View Crawled Page** shows Google's snapshot from the last crawl, not the live site. It will display the stale version *until Google re-crawls and successfully replaces it*. The two buttons that matter are:

- **TEST LIVE URL** — fetches fresh through a different pipeline, bypasses most caches
- **REQUEST INDEXING** — queues a re-crawl that will replace the snapshot

Always run TEST LIVE URL first to confirm Google's own fetcher gets the new content, then REQUEST INDEXING.

---

## 12. Done-state Checklist (real example: benobi.one, May 2026)

Use this as a reference for what "complete" looks like before the Knowledge Panel waiting game:

- [x] JSON-LD with @graph: Person + multiple Books + SoftwareApplication + WebSite, all linked via `@id`
- [x] Person `sameAs` is live profiles you control (X, GitHub, LinkedIn, Amazon) — not a deleted Wikidata QID
- [x] `homeLocation` in JSON-LD matches llms.txt and every public profile
- [x] llms.txt at site root with name, description, all sameAs URLs
- [x] robots.txt at site root with sitemap reference
- [x] sitemap.xml served and submitted to Search Console
- [x] Schema.org validator: 0 errors, 0 warnings, all entities detected
- [x] Google Rich Results Test: SoftwareApplication / Book detected as eligible
- [x] Search Console: Request Indexing triggered after final schema change
- [x] Cross-platform name + bio + location consistency (LinkedIn, X, Amazon Author, Crunchbase)

After all of the above: wait 2–6 weeks. The Knowledge Panel is on Google's clock from here.

---

## 13. Real-world execution log (benobi.one, May–June 2026)

This is the actual story of how Ben Sigman's Knowledge Panel went live, including what worked, what didn't, and how long each step took. Treat this as the validated reference; sections 1–12 above are general method.

### Timeline (verified from git + Wikidata revision history)

| Date | Event |
|---|---|
| **2026-04-12 23:26 PT** | **First JSON-LD schema deployed** — initial `Person` markup for Knowledge Panel. Within hours: LinkedIn URL fix, Amazon author ID fix. |
| **2026-04-13 00:50–00:55 PT** | Schema refactored to `@graph` format with `@id` references; Crunchbase added to sameAs; Amazon URLs + ISBNs added for both books. |
| **2026-04-13 06:34 UTC** | Wikidata item Q139266967 created (later deleted). |
| **2026-04-13 11:28 PT** | Schema fix: `affiliation` with nested `founder` on Organization (the canonical pattern). |
| **2026-04-14 22:45 PT** | `llms.txt` deployed at site root. |
| **2026-04-16 08:50 PT** | Amazon author page added to `sameAs`. |
| **2026-05-07 21:09 PT** | Santa Monica added to schema. Marina del Rey → Santa Monica consistency fix. Wikidata Q-URL also added to `sameAs` (later removed). |
| **2026-05-07 21:32 PT** | `robots.txt` deployed. |
| **2026-05-08** | Search Console "View Crawled Page" still showed stale Marina del Rey snapshot. Cloudflare full-purge unstuck it. |
| **2026-05-11** | Wikidata cluster expanded (books + Fred Krueger). Do not copy this step — deleted 18 days later. |
| **2026-05-16 14:16 PT** | **Big schema upgrade**: structured `PostalAddress`, `nationality`, `gender`, `alumniOf` UCLA, `OrganizationRole` with `roleName`. |
| **2026-05-16 14:37 PT** | Goodreads added to `sameAs`. |
| **2026-05-16 15:27 PT** | Instagram added to `sameAs`. |
| **2026-05-16 15:30 PT** | b1m.io added as `SoftwareApplication` node. |
| **2026-05-16 16:11 PT** | Schema correction: Libre → Libre Labs at bitcoinlibre.io, role = Founder & CEO. |
| **2026-05-16** | **Wikimedia Commons image upload + schema image.** Wikipedia article submitted via AfC. (P18 was also set; that is not a step to copy.) |
| **2026-05-18** | Wikipedia AfC **declined** by reviewer Bonadea (notability sources + LLM-detection flag). |
| **~2026-06-23** | **Knowledge Panel went live.** |
| **2026-06-24** | Confirmed visible. |
| **2026-06-29** | Wikidata person + book items deleted (RfD: notability / advertising). |

### What the dates actually mean

- **~73 days (10.5 weeks) from first JSON-LD commit (Apr 12) to panel live (~Jun 23).** This is the "started from zero" number — if you have no schema, plan for ~10 weeks.
- **~38 days (5.5 weeks) from Commons + schema image (May 16) to panel live.** Treat Wikidata as coincidental, not causal — the person item was deleted 6 days after the panel went live.

The original guide's "2–6 weeks" estimate is correct *only* measured from full-completion to panel. From bare-schema-start, plan ~10 weeks.

### What actually worked

The Knowledge Panel materialized **without** Wikipedia, despite the Wikipedia article being the goal of significant effort. The combination that was sufficient:

1. **Comprehensive JSON-LD `@graph`** linking Person → Books → SoftwareApplications → WebSite via shared `@id`s
2. **Cross-platform consistency** — Santa Monica everywhere, role descriptions aligned across LinkedIn / X / about.me / Crunchbase / Amazon Author
3. **One independent press piece per claim** — Forbes (Pearce) on mempalace was the biggest single lever, with secondary coverage from Decrypt, Bitcoin.com News, BeInCrypto, The Block, Thought Catalog, Free Press Journal
4. **Wikidata did not survive.** Person + book items were RfD'd as SEO/advertising on 2026-06-29. Do not copy that step.

### The single highest-impact lever, in hindsight

**A stable `schema.org/image` Google can fetch** (we also put a CC-BY-SA file on Commons). Do not add a Wikidata P18 as an SEO move.

### What we tried that didn't work

#### Wikipedia article via Articles for Creation

Submitted 2026-05-16, declined 2026-05-18. Two reasons cited by reviewer:

1. **Notability/sources** — most cited sources were articles about *other things* (Jovovich + mempalace, a shark sculpture, quantum threats) that *mentioned* the subject. Wikipedia's WP:GNG demands "significant coverage" — meaning the source is ABOUT the person. None of the 10 citations met this strictly.
2. **LLM-generated content flag** — the article had clear LLM-drafting tells (citation-dense compound sentences, neutral-but-stilted tone, generic biographical framing). 2026 AfC reviewers are actively trained to spot this; once flagged, the article is harder to push through even if rewritten.

**Lesson for future attempts:**
- Don't draft Wikipedia articles with LLMs. Draft in your own voice, then use an LLM only to review for policy violations.
- Don't submit until you have at least one source that is *about you*, not one that mentions you. Tier-2/3 outlets that count: CoinDesk profile, Bitcoin Magazine longform, Decrypt interview, Wired piece. Brief quotes in topic articles don't qualify.
- Wait minimum 2-3 months between decline and re-attempt. Two strikes leads to rejection (harsher than decline).

#### Organization Q-items for XAVIOR, Libre Labs, 2718 Capital

Skipped. Same RfD risk as the person item. Do not create org Q-items as an SEO step.

### Schema additions worth shipping (not in original guide §1)

The original `Person` schema template covers the basics. These extras shipped on benobi.one and may have helped:

```json
"gender": "Male",
"nationality": {"@type": "Country", "name": "United States"},
"homeLocation": {
  "@type": "Place",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Santa Monica",
    "addressRegion": "CA",
    "addressCountry": "US"
  }
},
"alumniOf": {
  "@type": "CollegeOrUniversity",
  "name": "University of California, Los Angeles",
  "sameAs": "https://www.wikidata.org/wiki/Q174710"
}
```

For affiliations, convert plain `Organization` to **`OrganizationRole`** with `roleName`:

```json
"affiliation": [{
  "@type": "OrganizationRole",
  "roleName": "Founder & CEO",
  "memberOf": {
    "@type": "Organization",
    "@id": "https://yourcompany.com/#org",
    "name": "Your Company",
    "url": "https://yourcompany.com/",
    "founder": {"@id": "https://yoursite.com/#you"}
  }
}]
```

This makes the role explicit and queryable. Plain `Organization` works but is less expressive.

### Common pitfalls we hit

1. **Cloudflare + Fastly stale-edge after schema deploy.** The `Age:` header on edge responses was 30–60 min stale even when `cf-cache-status: DYNAMIC`. Googlebot hit a stale edge once and indexed the old schema. Fix: always **Cloudflare → Purge Everything** after schema commits, then verify with `curl -A "Googlebot"` 10–20×.

2. **{{Wikidata}} template in Wikipedia draft caused Lua errors.** That template is for *computing data from* Wikidata, not linking *to* a Wikidata item. Do not add a Wikidata interwiki as an SEO move — our person QID is gone.

3. **"Marina del Rey" vs "Santa Monica" inconsistency.** Initial schema and llms.txt disagreed. Google reads both. Pick one canonical city and ensure it matches across ALL platforms (schema, llms.txt, LinkedIn, X, Crunchbase, Amazon).

4. **Fred Krueger wikilink in Wikipedia draft pointed to the wrong target.** Plain `[[Fred Krueger]]` resolves to the *Nightmare on Elm Street* character. Use a disambiguated red link: `[[Fred Krueger (author)|Fred Krueger]]`.

5. **Adding "bestselling" without citation.** AfC reviewers strip unsourced superlatives. Either cite (Amazon ranking page won't count) or remove.

6. **Connecting an "app integration" expecting it to expose as MCP for scheduled agents.** Some claude.ai connectors (notably Slack) connect as app integrations, not MCP servers. For scheduled-agent notifications, use an Incoming Webhook URL hardcoded into the trigger prompt instead.

### Validated timing benchmark for future use

For a person with:
- 2 bestselling books with ISBNs
- 1 strong tier-2 press piece (Forbes-level)
- 4–5 tier-3 press pieces
- No Wikipedia article
- No existing Knowledge Graph entity

…**Expect ~5 weeks from Commons + schema image to live Knowledge Panel**, assuming all signals in §12 checklist are in place. Do not treat Wikidata as a required step.

Faster timelines are possible with:
- A Wikipedia article (often instant if it exists)
- Tier-1 press (NYT, WSJ, Reuters — extremely hard but instant signal)
- Existing Knowledge Graph entity that just needs reactivation

Slower timelines if:
- Press is below tier-3 (crypto exchange news, aggregators)
- Cross-platform consistency has gaps
- Recreating a Wikidata person cluster for SEO (ours was RfD'd)

### After the panel goes live

1. **Claim it.** Search your name while signed into the Google account you actually use → bottom of panel → "Claim this knowledge panel" → verify via X or LinkedIn. Google often never sends the email. Retry from the panel; check spam on that Google account, not contact@.
2. **Screenshot it** for baseline. Panels can disappear if signals weaken; you want a reference.
3. **Note where Google sourced each fact** — sometimes the panel pulls from unexpected places (Crunchbase, IMDb, old conference bios). If anything's wrong, fix that source.
4. **Don't keep tweaking.** Once live, leave it alone for a few months. Constant changes can cause Google to re-evaluate and occasionally retract.
5. **Wikipedia article becomes higher leverage post-panel.** A Wikipedia article post-panel upgrades the bio paragraph and the source set, making the panel harder to remove. Worth resubmitting in 3–6 months if you have new tier-2 press.

