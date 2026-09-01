+++
draft = false
date = 2026-09-01T10:00:00-07:00
title = "Are Subscription Apps Dead? I Built One Anyway"
slug = "are-subscription-apps-dead"
tags = ["subscriptions", "indie-hacking", "stripe", "cloudflare", "saas", "birdchess"]
categories = ["Guide"]
thumbnail = "images/subscription-app-playbook.png"
description = "I built a chess app I'd pay for, showed it to my peers, and iterated on real use. Point your agent at github.com/bensig/subscription-app-playbook."
+++

> Screenshot deck: [benobi.one/subscription-app.html](/subscription-app.html). This page is the full guide.

**Skip the essay if you want.** Point any coding agent at the repo and say this:

```text
Use https://github.com/bensig/subscription-app-playbook
to build a small paid app for my niche.
Charge once for a download, or subscribe if I keep improving the platform.
```

Skill, schema, Stripe sandbox path, privacy, and terms are in there. CC0. The rest of this post is why that machine works, and how I shipped [BirdChess](https://birdchess.com) with it.

# Are subscription apps dead?

No. Boring ones are.

The [2026 State of Subscription Apps](https://www.revenuecat.com/state-of-subscription-apps) looked at more than 115,000 apps representing over $16 billion in revenue.

One number at a time:

- **15,000** new subscription apps launch every month.
- That is **7×** the ~2,000 a month of early 2022.
- The **top quartile grew 80%** year over year. The top 10% grew 306%.
- The **bottom quartile shrank 33%**.

The market is rising. It is also polarized. Generic apps are getting crushed inside a growing category — which is the opposite of dead.

The old pitch was: find a feature, wrap it in an app, add a weekly trial, buy installs, and let forgotten renewals do the work. Users are wise to that now. App stores are full of interchangeable AI wrappers, scanner apps, wallpaper apps, and utilities asking for rent before they have provided value.

What still works is smaller and more honest: find a group of people with a problem that genuinely returns, build the tool they want to keep using, let them complete something useful for free, and charge for the deeper version.

That is what I did with [BirdChess](https://birdchess.com).

I play chess. I wanted the obvious practice loop: pick an opening, face it, face it again.

That tool barely exists. You can play a smart bot on Lichess or Chess.com. You cannot tell it “the Italian, from the black side, again.” The engine is strong. The opening is random. Every game starts somewhere else, so you never actually learn one line.

BirdChess is that missing loop. It plays the opening moves of a chosen line, hands you the important decision, grades what you play, and explains the idea — as positions and plans, not move-order trivia. Then you can do it again tomorrow. The free plan is a daily opening, capped drills, and a daily coaching allowance. Pro is $7/month or $49/year and opens every line, unlimited drills, and advanced coaching.

I built it because I would pay for it, and I use it. Then I showed it to chess players I already talk to. A few of them became users. Their complaints are why the product looks the way it does now. That was the whole launch: a tool I needed, then a handful of honest peers.

This is the product and technical playbook I wish I had when I started.

---

## A subscription is a promise

The promise is not "we successfully attached Stripe."

The promise is: **this will keep being useful.**

The machine can charge **once** or **again**. Pick from the product, not from a template.

**Buy once** when the customer gets a finished thing: a book, a guide, a PDF, a template pack, a downloadable course. Done is done. You can still patch a file. You are not promising a living platform.

**Subscribe** when you keep improving the product because the job keeps coming back. Openings practice, monitoring, coaching, a tool with history. You owe them the next month.

BirdChess is recurring because the repertoire is a platform. An openings ebook would be one-time. Same Stripe checkout. Different `mode`. Do not bolt a subscription onto a file.

A promising subscription niche contains a repeating job:

- **Practice:** chess, piano, pronunciation, mobility, interviewing
- **Monitor:** search rankings, inventory, certifications, prices, uptime
- **Produce:** client reports, lesson plans, estimates, schedules, compliance records
- **Remember:** follow-ups, plant care, maintenance, medication, collections
- **Coordinate:** a team, class, club, household, or specialized workflow

The strongest products also accumulate something useful: history, a repertoire, a model of the user's preferences, team context, or a record that becomes more valuable over time.

BirdChess has a natural return loop because openings only stick with repetition. You pick a line, face the same ideas against a bot that actually plays them, then forget pieces of it over the board, then come back. I do not need a three-day trial countdown. The subject itself creates another useful session — and until BirdChess, there was no simple, intuitive place to get those reps.

## Pick the niche before the stack

Start with twenty people, not twenty database tables.

You want a group you can find and speak to in their own language. "Small businesses" is not a niche. "Independent piano teachers who schedule make-up lessons by text" might be. "Chess players" is broad. "People who want to drill one opening against a bot and cannot" is a job.

Before building accounts or billing:

1. Talk to people who already experience the problem.
2. Solve one narrow version manually or with a disposable prototype.
3. Watch at least five people use it without coaching.
4. Ask what they do immediately before and after your tool.
5. Show it to peers who already have the job, then ship what they complain about.

Listen for existing behavior. A spreadsheet, pile of screenshots, elaborate note-taking ritual, or expensive general-purpose tool bent into the wrong shape is evidence. Compliments are not.

## Free should be complete, not unlimited

Freemium works when free users finish one real job and understand why they might return.

For BirdChess, a free user can actually learn and drill an opening. That is not a demo with the last step removed. The limits are on choice and volume: the daily opening, ten drills, and a coaching allowance. Pro unlocks any opening and removes the caps.

Good paid boundaries tend to be one or more of:

- More volume
- More choices
- Deeper analysis
- Faster processing
- Saved history
- Collaboration
- Exports or integrations
- Commercial use

Do not make free deliberately miserable. You are trying to create informed customers, not hostages.

There is a real tradeoff here. RevenueCat's 2026 data says hard paywalls convert downloads to paid users roughly five times better than freemium at day 35: 10.7% median versus 2.1%. But one-year retention converges, and 23% of freemium conversions occur after six weeks. A hard paywall concentrates the decision early; freemium gives a niche product a longer trust-building window.

Choose based on how quickly a new user can experience the recurring value. Do not pick a paywall theology.

## Do the small-business math

Three hundred customers paying $7 a month is $2,100 in monthly recurring revenue before payment fees, taxes, refunds, infrastructure, and whatever the core feature costs to deliver.

That is not venture-scale math. It can still be meaningful little-business math.

Write down:

```text
monthly price × plausible customers
− payment fees
− variable cost per active customer
− fixed infrastructure
− refunds and taxes
= money available to pay for your time
```

For an AI product, calculate the free allowance and the worst-case paid user's usage before launch. A $7 plan with $9 of model inference is philanthropy. Caps, caching, smaller models, precomputed results, or bring-your-own-key may be product design—not merely optimization.

Annual pricing should reward commitment without mortgaging the future. BirdChess at $49/year is roughly seven months for the price of twelve. That improves cash flow and reduces monthly churn while keeping the promise supportable.

---

# The five-piece subscription machine

I wired Stripe myself. The production shape behind BirdChess is deliberately boring:

1. A Cloudflare Worker serves the API.
2. Static files come from the Worker's assets binding.
3. D1, Cloudflare's managed SQLite database, holds users and usage events.
4. Google OAuth and emailed magic links both land on one user table.
5. Stripe Checkout collects money; Stripe webhooks control paid access.

You can build the same shape with Next.js and Postgres, Rails, Laravel, Django, Supabase, or a hosted auth provider. The invariants matter more than the brands.

## Can an agent wire Stripe for you now?

Much more of it than I realized.

Stripe now has an official [MCP server](https://docs.stripe.com/mcp) that lets compatible coding agents search Stripe's documentation and work with Stripe objects. Its published tools include creating products, prices, and Payment Links, plus listing and updating subscriptions. Stripe also publishes an [Agent Toolkit](https://docs.stripe.com/agents) for OpenAI's Agents SDK, Vercel's AI SDK, LangChain, and CrewAI.

That means a good agentic setup can:

1. Inspect your product contract and propose monthly and annual plans.
2. Create the product and prices in a Stripe sandbox.
3. Put the resulting ids into your deployment's secret placeholders.
4. Implement Checkout, the customer portal, and verified webhooks in your repository.
5. Run test-mode purchases and cancellation cases.
6. Leave live activation as an explicit human-controlled step.

The safe version is not "paste a live secret key into chat and hope." Stripe recommends restricted keys with only the permissions the tool needs. Use a sandbox or a test-mode restricted key, keep it in the agent environment's secret store, review the proposed objects before creation, and separate setup permission from refunds, cancellations, payouts, or live charges. Stripe's MCP uses OAuth, which is better than copying a general-purpose secret into another tool.

I added this workflow to the [subscription app playbook](https://github.com/bensig/subscription-app-playbook). An agent can now do the repetitive setup and code generation while the human still owns the product, pricing, and live-money decisions.

## 1. One user table

Everything hangs from one boring row:

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  email TEXT NOT NULL UNIQUE COLLATE NOCASE,
  google_sub TEXT UNIQUE,
  name TEXT,
  subscription_status TEXT NOT NULL DEFAULT 'none',
  stripe_customer_id TEXT UNIQUE,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
```

Google sign-in looks up `google_sub` first, because Google's `sub` claim is the provider's stable identifier. Email is the fallback for linking someone who previously used a magic link. Both doors end with the same sequence:

```text
verify identity
→ find or create user
→ set session cookie
→ return to the app
```

The database stores only two pieces of billing state: Stripe's customer id and the most recent subscription status received from Stripe. Stripe remains the system of record for money.

## 2. Signed-cookie sessions

A small app does not necessarily need a session table.

BirdChess uses a payload containing the user id and expiry, signed with HMAC-SHA256 under a secret known only to the Worker:

```js
// Logical format; helper implementations omitted for clarity.
const expiresAt = Math.floor(Date.now() / 1000) + 30 * 24 * 60 * 60;
const payload = base64url(`${user.id}:${expiresAt}`);
const signature = await hmacHex(payload, env.SESSION_SECRET);
const cookie = `${payload}.${signature}`;

return new Response(null, {
  status: 302,
  headers: {
    location: "/",
    "set-cookie": `session=${cookie}; HttpOnly; Secure; SameSite=Lax; Path=/; Max-Age=2592000`,
  },
});
```

Verification recomputes the signature, compares it in constant time, decodes the payload, and rejects expired or malformed values. Every protected route uses one `currentUserId(request)` helper.

This is intentionally limited. You cannot revoke one session without changing the user model, and rotating `SESSION_SECRET` signs everybody out. That is a reasonable trade for many small apps. If you need per-device revocation, suspicious-session inspection, or enterprise controls, use stored sessions.

Generate the secret once and keep it out of source control:

```bash
openssl rand -hex 32
npx wrangler secret put SESSION_SECRET
```

## 3. Google and magic-link sign-in

Google login was also easier than I expected because BirdChess does not need a user's Google life. It needs identity.

Request the smallest useful OpenID Connect scopes: `openid email`. That gives you Google's stable subject id and the primary email claim. Add `profile` only if the product genuinely uses the person's name or avatar. Do not ask for Drive, contacts, calendar, birthday, or other API access just because the OAuth screen is already open. Google's [OpenID Connect guide](https://developers.google.com/identity/openid-connect/openid-connect) documents these identity scopes and claims.

Google OAuth is the usual authorization-code flow:

1. `/auth/google` creates a random `state`, stores it in a short-lived same-site cookie, and redirects to Google.
2. The callback verifies `state` before exchanging the code.
3. The Worker validates the ID token and reads `sub` and `email`, plus `name` only if you requested and use the profile scope.
4. It upserts the user and creates the same session cookie used by every other sign-in method.

Bind the Google account by `sub`, not email. Emails can change or be reassigned.

Magic links cover everyone who does not want to use Google. Four cheap rules make them defensible:

- Generate about 32 random bytes.
- Email the raw token but store only its SHA-256 hash.
- Expire it in 15 minutes.
- Consume it exactly once and rate-limit sends.

```sql
CREATE TABLE magic_links (
  token_hash TEXT PRIMARY KEY,
  email TEXT NOT NULL,
  expires_at TEXT NOT NULL,
  used_at TEXT
);
```

Always return the same "check your inbox" response, whether the email already has an account or not. That prevents account enumeration. Consume with one conditional update so two simultaneous clicks cannot both win:

```sql
UPDATE magic_links
SET used_at = datetime('now')
WHERE token_hash = ?
  AND used_at IS NULL
  AND expires_at > datetime('now');
```

Only continue when the database reports one changed row.

## 4. The atomic freemium meter

Use an append-only event for every action that has a daily allowance:

```sql
CREATE TABLE usage_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  kind TEXT NOT NULL CHECK (
    kind IN ('drill_round', 'play_game', 'analysis', 'import', 'coach_question')
  ),
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX usage_events_daily
  ON usage_events (user_id, kind, created_at);
```

The consume operation must be one atomic statement. Counting and then inserting in two calls creates a race: two requests can both see one remaining use.

```sql
INSERT INTO usage_events (user_id, kind)
SELECT ?, ?
WHERE (
  SELECT COUNT(*)
  FROM usage_events
  WHERE user_id = ?
    AND kind = ?
    AND date(created_at) = date('now')
) < ?;
```

Bind `user_id`, `kind`, `user_id`, `kind`, and the cap. One changed row means the action was consumed. Zero means the gate should show an upgrade prompt.

Three rules matter:

1. **The server consumes.** The browser may display remaining uses, but the protected API route owns the decision.
2. **Paid users still create events.** They skip the cap, not the analytics. Otherwise your activity chart goes flat for your best customers.
3. **Define what a day means.** SQLite's `date('now')` is UTC. If the promise is "per local calendar day," store a billing timezone and calculate explicit boundaries.

If you keep the `CHECK` constraint on `kind`, adding a new metered action requires a migration. Forgetting that produces a wonderfully opaque production error on feature-launch day.

## 5. Stripe Checkout

The browser sends an allowlisted plan name. The server picks the Stripe price **and** the Checkout mode. One-time products use `mode: "payment"`. Living products use `mode: "subscription"`.

```text
STRIPE_SECRET_KEY
STRIPE_PRICE_ID_ONCE
STRIPE_PRICE_ID_MONTHLY
STRIPE_PRICE_ID_YEARLY
STRIPE_WEBHOOK_SECRET
```

```js
const catalog = {
  guide:    { price: env.STRIPE_PRICE_ID_ONCE,    mode: "payment" },
  monthly:  { price: env.STRIPE_PRICE_ID_MONTHLY, mode: "subscription" },
  yearly:   { price: env.STRIPE_PRICE_ID_YEARLY,  mode: "subscription" },
};

const { plan } = await request.json();
const item = catalog[plan];
if (!item) return Response.json({ error: "Unknown plan" }, { status: 400 });

const form = new URLSearchParams({
  mode: item.mode,
  "line_items[0][price]": item.price,
  "line_items[0][quantity]": "1",
  customer_email: user.email,
  success_url: `${origin}/settings?checkout=success`,
  cancel_url: `${origin}/settings?checkout=canceled`,
  allow_promotion_codes: "true",
  "metadata[user_id]": String(user.id),
  "metadata[plan]": plan,
});

const stripeResponse = await fetch("https://api.stripe.com/v1/checkout/sessions", {
  method: "POST",
  headers: {
    authorization: `Bearer ${env.STRIPE_SECRET_KEY}`,
    "content-type": "application/x-www-form-urlencoded",
  },
  body: form,
});
```

Never accept an arbitrary Stripe price id from the browser. Never grant paid access because the user reached `success_url`. Redirects are user-controlled navigation, not payment evidence.

## 6. The webhook is the money truth

Configure a Stripe webhook for at least:

- `checkout.session.completed` — one-time purchases and the first subscription payment
- `customer.subscription.updated`
- `customer.subscription.deleted`

A download or book only needs the completed checkout with `payment_status = paid`. A living platform also listens for subscription changes. Stripe's [subscription webhook documentation](https://docs.stripe.com/billing/subscriptions/webhooks) lists the extra events for trials, payment failures, pauses, and renewals.

The handler must read the raw request body and verify the `Stripe-Signature` header with `STRIPE_WEBHOOK_SECRET` before parsing or changing anything. After verification:

```js
switch (event.type) {
  case "checkout.session.completed":
    // Link event.data.object.customer to metadata.user_id.
    break;

  case "customer.subscription.updated":
  case "customer.subscription.deleted":
    await env.DB.prepare(`
      UPDATE users
      SET subscription_status = ?
      WHERE stripe_customer_id = ?
    `).bind(
      event.data.object.status,
      event.data.object.customer,
    ).run();
    break;
}
```

Make webhook processing idempotent. Stripe retries delivery, so store processed event ids or design every update to be safely repeatable. If you later create credits, commissions, or other additive records, a unique Stripe event or invoice id is mandatory.

Finally, centralize product access:

```js
async function hasPaidAccess(userId, env) {
  const user = await env.DB.prepare(
    "SELECT subscription_status FROM users WHERE id = ?",
  ).bind(userId).first();

  return user?.subscription_status === "active";
}
```

BirdChess currently unlocks only `active`. Your business might intentionally allow `trialing` or a grace period for `past_due`; the important part is to decide once and make every route call the same function.

---

# Privacy and terms can be plain language

Google identity-only login, a small database, and Stripe Checkout give you a pleasantly short data story. Write that story down in words a customer can understand.

A privacy policy should describe the product you actually built:

- What account, product-usage, support, and billing data you collect
- What comes from Google, and the fact that you do not access unrelated Google services
- Which providers process data for hosting, email, analytics, AI, and payments
- What stays only in the browser
- How long information is kept
- How someone can export, correct, or delete their account
- Whether you sell personal information or use advertising trackers
- Whether the service is directed to children
- How to contact a real person

The FTC's [privacy guidance for app developers](https://www.ftc.gov/business-guidance/resources/marketing-your-mobile-app-get-it-right-start) is refreshingly practical: minimize what you collect, clearly explain what you do, make choices easy to find, and live up to the promises in the policy. A copied policy that does not match the code is worse than a short accurate one.

Terms should be just as direct. Explain the service, account responsibility, acceptable use, ownership, recurring price and renewal, how cancellation works, refund policy, third-party services, disclaimers, liability limits, changes, and contact details. Put the renewal and cancellation terms where the purchase happens too—not only inside a legal page.

I turned BirdChess's policies into two fill-in US starter documents:

- [Plain-language privacy policy template](https://github.com/bensig/subscription-app-playbook/blob/main/assets/legal/privacy-policy.md)
- [Plain-language terms of use template](https://github.com/bensig/subscription-app-playbook/blob/main/assets/legal/terms-of-use.md)

They are starting points, not legal advice. Replace every bracket, delete sections that do not match, add every provider the product really uses, and get qualified review if the app handles health, financial, biometric, precise-location, or children's data; user-generated content; regulated advice; international users; or enough California activity to trigger state-specific requirements.

---

# What to measure

Monthly recurring revenue is a result, not a diagnostic.

Track the loop:

- **Activation:** did the user complete the first useful job?
- **Return:** did they come back when the problem returned?
- **Limit contact:** did active free users naturally encounter the paid boundary?
- **Conversion:** did the people who experienced value upgrade?
- **Retention:** are customers still using the product before renewal?
- **Churn:** did they leave because the job disappeared, the product failed, or payment failed?
- **Unit cost:** does an active customer remain profitable at realistic heavy usage?

A cancellation survey is useful, but behavior is better. If subscribers stop doing the core action two weeks before canceling, your problem is not the cancellation screen.

The 2026 RevenueCat report also found that AI apps generate more revenue per payer but churn about 30% faster. That is the warning for this whole category: novelty can sell the first month; only recurring utility sells the twelfth.

# Launch checklist

- [ ] A new user can finish the core free job without help
- [ ] Google sign-in creates one user; the next sign-in reuses that row
- [ ] A magic link expires, works once, and refuses a replay
- [ ] The free gate trips at exactly the promised limit under concurrent requests
- [ ] Paid users bypass the cap but still log usage
- [ ] The charge matches the product: one-time for a finished thing, recurring only if you keep improving it
- [ ] One-time and/or subscription Checkout complete in test mode
- [ ] The webhook—not the redirect—sets paid status
- [ ] An unsigned webhook request is rejected
- [ ] Canceling a subscription removes access in the app
- [ ] Secrets exist only in the deployment secret store and gitignored local env
- [ ] The pricing page explains the recurring value in one sentence
- [ ] Privacy policy, terms, support contact, cancellation, and account deletion exist

# The answer

Subscription apps are not dead. Generic products with artificial recurring charges are being squeezed, and that is probably healthy.

You do not need a billion users. You need a group you understand, a job worth a tool, a free experience that proves you can do it, and an honest charge: once for a finished thing, again only if you keep improving the platform. The billing system can fit in one diagram and a handful of tables. Your moat is not the webhook.

It is knowing which problem deserves a permanent little tool — and which one is just a file.

You do not have to rebuild this from a thread. Point your agent at the repo:

```text
Use https://github.com/bensig/subscription-app-playbook
to build a small paid app for my niche.
Charge once for a download, or subscribe if I keep improving the platform.
```

The [playbook](https://github.com/bensig/subscription-app-playbook) includes an installable skill, a browser prompt, the schema, Stripe sandbox setup, and the privacy/terms starters. CC0.

Or go see the actual model at [birdchess.com](https://birdchess.com). One opening a day is free.
