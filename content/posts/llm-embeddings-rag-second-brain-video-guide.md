+++
draft = false
date = 2026-04-13T10:00:00-07:00
title = "AI Memory Home School: Embeddings, Vector DBs, RAG, and Karpathy's Second Brain"
slug = "llm-embeddings-rag-second-brain-video-guide"
tags = ["ai", "llm", "embeddings", "rag", "vector-databases", "karpathy"]
categories = ["AI"]
thumbnail = "images/benobi-one.png"
description = "A curated video guide to understanding LLM embeddings, vector databases, RAG, and Karpathy's Second Brain method — the clearest explanations on the internet, in the right order."
+++

If you want to understand how modern AI actually works under the hood — not at the PhD level, but well enough to build with it — these are the videos to watch.

I've organized this as a home school curriculum: 4 topics, 1 main video and 1 extra credit per topic, in the order that builds the most intuition. Each concept builds on the last. The whole path takes about 2 hours if you stick to the main videos, or 3-4 if you do the extra credit too.

---

## 1. Embeddings & Vectors

*Turning language into searchable numbers.*

Embeddings are the foundation of everything else on this list. They're how AI turns words, sentences, and documents into numbers that capture meaning — so that "dog" is closer to "puppy" than to "refrigerator" in mathematical space. If you don't understand these, nothing downstream will click.

### Main Video: Embedding Models in AI | Explained in 7 minutes

Short, visual, and perfect for beginners. Shows exactly what vectors and embeddings are, why they capture meaning, and how cosine similarity works — the foundation for everything else in this module.

{{< youtube z7IzJb23kSc >}}

### Extra Credit: LLM Vectors and Embeddings: From Basics to Generative AI

A deeper dive that connects embeddings to real LLMs and shows the evolution from older models (Word2Vec, GloVe) to today's systems. Watch this after the main one for stronger intuition.

{{< youtube F9_8ajwpddc >}}

---

## 2. Vector Databases

*The storage and search system for embeddings at scale.*

Once you understand embeddings, the question becomes: where do you put millions of them and how do you search them fast? Traditional databases can't do similarity search. Vector databases (Pinecone, Chroma, Weaviate) solve this with specialized indexes like HNSW that make nearest-neighbor search fast even at massive scale.

### Main Video: Vector Databases simply explained! (Embeddings & Indexes)

The clearest beginner explanation of why normal databases fail with vectors, how indexes enable fast similarity search, and real use cases. Short and visual.

{{< youtube dN0lsF2cvm4 >}}

### Extra Credit: What is a Vector Database? (IBM Technology)

Great follow-up with practical examples of how vector DBs power AI apps — recommendations, semantic search, and more. Ties embeddings directly to real-world performance.

{{< youtube t9IDoenf-lo >}}

---

## 3. RAG — Retrieval-Augmented Generation

*Giving LLMs a reliable memory by grounding them in your actual data.*

RAG is the pattern that lets LLMs pull relevant context from your documents instead of making things up. It's how you go from "the AI hallucinates" to "the AI cites sources." The flow: chunk your documents → embed them → store in a vector DB → retrieve the relevant ones → feed them to the LLM alongside your question.

### Main Video: Retrieval Augmented Generation (RAG) Explained in 8 Minutes!

Concise and focused on modern RAG, including why it still powers most AI workflows. Excellent visuals on the full flow: chunk → embed → retrieve → generate.

{{< youtube HREbdmOSQ18 >}}

### Extra Credit: RAG Explained For Beginners (KodeKloud)

Hands-on style that walks through documents turning into embeddings and retrieved context. Perfect for seeing the process in action rather than just hearing about it.

{{< youtube _HQ2H_0Ayy0 >}}

---

## 4. Karpathy's Second Brain / LLM Wiki

*AI-powered persistent knowledge that grows smarter over time.*

This is Andrej Karpathy's method (early 2026) of using an LLM — often Claude — to synthesize your notes, documents, and conversation history into a clean, interlinked Markdown wiki in Obsidian. It grows smarter over time as you feed it more material.

This isn't real-time RAG. It's structured knowledge synthesis. The LLM reads your raw material and produces organized, cross-referenced knowledge that you can browse, search, and build on. Karpathy shared a Gist that sparked an entire ecosystem of implementations. He prefers this approach over traditional RAG for personal use because the knowledge is pre-processed, organized, and always available — no retrieval latency, no chunking artifacts.

### Main Video: Build Your Second Brain With Claude Code, Karpathy's Method

Step-by-step practical tutorial showing exactly how to replicate Karpathy's workflow: using Claude to synthesize notes into a clean, interlinked Markdown wiki in Obsidian. This is the one that ties personal knowledge management to AI.

{{< youtube lnsExa1UbnM >}}

### Extra Credit: Claude + Karpathy's Second Brain is INSANE

A clear walk-through of the concept, his viral tweet/Gist, and the philosophy behind why structured synthesis beats real-time retrieval for personal knowledge.

{{< youtube 5FiHjotg2zU >}}

---

## Why This Matters to Me: mempalace

Full disclosure — this isn't just academic interest. I co-created [mempalace](/mempalace/) with Milla Jovovich, an open-source memory system for AI agents, and it uses everything on this list.

Under the hood, mempalace is built on embeddings. Every conversation, every fact, every interaction gets embedded and stored so agents can retrieve it later with high accuracy — 96.6% recall on the LongMemEval benchmark.

But what makes mempalace different from a pure RAG system is that it has **dual retrieval paths** — one designed for humans and one for agents. The human-facing system uses a spatial metaphor (wings, rooms, drawers) so you can browse and find things the way your brain naturally organizes information. The agent-facing system uses embedding-based semantic search so AI can find the right memory instantly, even across thousands of conversations.

The base layer is embeddings. The spatial organization on top is what makes it usable by both humans and machines. If you watch the videos above, you'll understand exactly how mempalace works — and why we built it the way we did.

[Learn more about mempalace →](/mempalace/)

---

## The Syllabus

Total time: ~2 hours (main videos only) or ~3-4 hours (with extra credit).

| # | Topic | Main Video | Extra Credit |
|---|-------|-----------|-------------|
| 1 | Embeddings | 7 min | 20 min |
| 2 | Vector DBs | 10 min | 8 min |
| 3 | RAG | 8 min | 15 min |
| 4 | Second Brain | 20 min | 15 min |

Watch the main videos first, in order. Then come back for extra credit if you want to go deeper. By the end you'll see how **embeddings → vector DB → RAG → Second Brain** all fit together as the modern LLM memory stack.
