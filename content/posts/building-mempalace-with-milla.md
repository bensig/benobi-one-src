+++
draft = false
date = 2026-04-06T10:00:00-07:00
title = "Building the Memory System AI Agents Were Missing"
slug = "building-mempalace-with-milla"
tags = ["ai", "agents", "memory", "mempalace", "open-source"]
categories = ["AI"]
thumbnail = "images/multi-mempalace.jpeg"
description = "How a 20-year friendship, an obsession with AI agents, and a frustration with lossy memory systems led to mempalace."
+++

I've known [Milla](https://www.instagram.com/p/DWzNnqwD2Lu/) for over 20 years. In that time, we've talked about working together on just about everything -- video games, mobile apps, marketplaces. We always had ideas but never the right moment.

This year, the moment arrived.

<img src="/images/multi-mempalace.jpeg" alt="mempalace" style="max-width: 100%; margin-bottom: 20px;" />

## The Spark

It started as an experiment with AI. I can't talk about the exact details, but basically she asked me to help her free an agent from ChatGPT. So I introduced her to [Claude Code](https://claude.ai/code). She went deep -- building agents, talking to them, having them talk to one another. Before long, she had created literally hundreds of conversation files and logs.

Then she needed a way to file and search them.

## The Problem Nobody Had Solved

Milla is a meticulous record-keeper. She tested every memory system she could find, and none of them worked. The fundamental issue? They all truncated results. They tried to "summarize" things. They lost the context of the original high-fidelity conversations.

She couldn't ask "when did we talk about making the balloons blue?" and get an honest answer. She couldn't ask "when did I first mention this idea?" and trust the result. Every system she tried would compress, paraphrase, or hallucinate -- destroying the very details that mattered.

If you've ever worked extensively with AI agents, you know this pain. The conversations are the artifact. The exact words, the exact sequence, the exact moment something was said -- that's the data. Any system that summarizes it away is not a memory system. It's a forgetting system.

## So We Built One

That frustration became [mempalace](https://github.com/mempalace/mempalace) -- an open source memory system for AI agents that stores everything and makes it findable. No truncation. No lossy summarization. You put something in, you get the same thing back out.

The idea borrows from the ancient Greek memory palace technique -- orators would memorize speeches by placing ideas in rooms of an imaginary building. Walk through the building, find the idea. MemPalace applies the same principle to AI memory: your data is organized into **wings** (one per project or person), **rooms** (topics within a wing), **closets** (compressed summaries that point to the original), and **drawers** (the original files, verbatim). **Halls** connect related rooms within a wing, and **tunnels** cross-reference the same topic across different wings.

The structure isn't cosmetic. In our benchmarks, wing-and-room filtering alone improved retrieval by 34%. And the system hit **96.6% recall on LongMemEval** -- the highest published score with zero API calls, no cloud, no subscription. Just local search on your machine.

It's free, it's open source, and it's a `pip install` away:

```bash
pip install mempalace
```

Twenty years of talking about building something together, and it took AI to finally make it happen. Sometimes the right project finds you at the right time.

Check out [Milla's post about it](https://www.instagram.com/p/DWzNnqwD2Lu/), the [GitHub repo](https://github.com/mempalace/mempalace), and follow the project at [benobi.one/mempalace](/mempalace/).
