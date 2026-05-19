---
name: text-polish
description: >
  Polish a prose document by systematically removing AI-formula language: clichés
  ("seamlessly", "tapestry", "vibrant"), weak intensifiers ("genuine", "meaningful",
  "compelling"), structural formulas ("This isn't just X it's Y", trailing adjective
  clauses on bullets, closing summary sentences that restate what was just said), and
  rhetorical sweep sentences. Use this skill whenever the user asks to polish, clean up,
  improve, or edit the prose quality of a markdown or text document — or says the writing
  "sounds AI-generated", "sounds generic", "is too flowery", or asks to "de-AI" it.
  Also trigger when the user shares a document and asks for a writing pass, even without
  naming specific problems.
---

Polish a prose document by finding and removing AI-formula language patterns. Operates on a single file.

**Invocation:** `/text-polish <file-path>`
If no path is given, use the file currently open in the editor.

---

## Steps

### 1. Read the file

Read the full target file before making any changes. Do not edit until the full read is complete.

### 2. Task 1 — Word-level replacements

Search for and replace the following patterns. Use targeted edits for lightly infected passages. Rewrite entire sections from scratch where multiple patterns cluster in the same paragraph.

Do not change legitimate uses: "navigate" as literal travel, "journey" as physical movement, "fluid" describing actual liquid.

| Pattern | Fix |
|---------|-----|
| `navigate / navigating` (metaphorical) | Replace with what is actually being done |
| `journey` (metaphorical) | Cut or replace |
| `immersive / immersion / immerse` | Replace with what it means: "present in the fiction", "grounded", etc. |
| `fluid` (narrative/storytelling) | Replace with "quick", "smooth", or cut |
| `unfolding` (story/narrative) | Cut the word, keep the noun |
| `weave` (metaphorical) | Replace with what is actually happening |
| `breathe life into` | Cut or replace with the specific action |
| `lean into` | Replace with the actual action |
| `seamlessly` | Cut |
| `one decision at a time` / `one choice at a time` | Cut |
| `dive into` / `dive deeper` | Replace with "start", "read", "look at" |
| `unlock its full potential` | Cut or replace with what becomes possible |
| `feels alive` / `world that feels alive` / `layered and alive` | Replace with what specifically makes it active |
| `genuine` as intensifier | Cut the word |
| `[X] is where [Y] lives` | Rewrite as a direct statement |
| `enjoy the journey` | Cut or rewrite as plain statement of purpose |
| `adapt to your vision` / `adapts to your vision` | Replace with what the system actually does |
| `deepen your [journey/connection/experience]` | Replace with what specifically changes |
| `rich and immersive` / `rich, immersive` | Cut both adjectives, describe what is there |
| `tapestry` | Cut |
| `spotlight` (metaphorical) | Rephrase |
| `robust` (describing systems/design) | Replace with what it actually does |
| `powerful` (content-free intensifier) | Replace with what it specifically enables |
| `dynamic` (narrative/characters) | Replace with what changes and how |
| `vibrant` | Cut; describe what is actually there |
| `compelling` (filler) | Cut or replace with mechanism |
| `engaging` (filler) | Same as compelling |
| `meaningful` (generic closer) | Replace with what the choice or moment does |
| `authentic` (non-specific) | Cut or replace with what is being contrasted |
| `nuanced` (without explanation) | Explain the nuance or cut |
| `complex / complexity` (as praise) | Elaborate or cut |
| `the rest is up to you` | Cut |
| `endless possibilities` / `the possibilities are endless` | Cut |
| `only your imagination limits` | Cut |
| `and so much more` | Cut |
| `at its core` | Cut the phrase, open with the statement directly |
| `at the heart of [X] is Y` | Rewrite as direct statement |
| `[X] ensures that [positive outcome]` | Replace with how it actually works |
| `[X] allows you to [vague empowerment]` | Replace with what the mechanic concretely does |

| `--` (double hyphen) | Evaluate every double hyphen as an em-dash. Where it joins two independent clauses, replace with a period or semicolon. Where it introduces an explanation or list, replace with a colon. Where it sets off a parenthetical aside — like this one — keep it. The test: could you remove the dashed phrase and still have a complete sentence on each side? If yes, consider a period or restructuring. |
| `—` (em-dash as crutch connector) | Evaluate every em-dash. Where it joins two independent clauses, replace with a period or semicolon. Where it introduces an explanation or list, replace with a colon. Where it sets off a parenthetical aside — like this one — keep it. The test: could you remove the dashed phrase and still have a complete sentence on each side? If yes, consider a period or restructuring. |

Do not touch em-dashes in dialogue to mark interruption ("I was just—") or in genuine parenthetical asides where no other punctuation would work as cleanly.

**High-frequency words** — `dynamic`, `powerful`, `engaging`, `meaningful`, `authentic`, `ultimately` — are too common to catch by grep alone. After the grep pass, scan for each word manually and evaluate by context. Fix only filler uses.

---

### 3. Task 2 — Structural rewrites (mandatory)

Every instance of every pattern below must be changed. These are not optional.

**Pattern A — "This isn't just X, it's Y"**
Delete the meta-commentary. Open directly with the actual content.
> Before: *"This isn't just a rulebook, it's a toolkit for collaborative storytelling."*
> After: *"The rulebook provides tools for collaborative play."*

**Pattern B — "Welcome to..." / "Think of this as..."**
Delete the opener. Begin with the first substantive sentence.
> Before: *"Welcome to the world of Ashes. Here you will find..."*
> After: *"Ashes is a game about..."*

**Pattern C — Closing summary sentences**
Delete the final sentence of any section that restates what was just said and labels it meaningful, memorable, impactful, or similar.

**Pattern D — Trailing clauses on bullet points**
Cut at the comma or conjunction introducing the positive-adjective trailer. Keep only the functional part.
> Before: *"- Choose your action, making each moment feel true to your character's journey."*
> After: *"- Choose your action."*

**Pattern E — Adjective-saturated paragraphs**
Any paragraph where three or more sentences end with a positive adjective or adjective phrase: rewrite it. Remove at least half those adjectives; where one was doing work, replace it with a concrete description.

**Pattern F — Rhetorical sweep sentences**
Cut or replace with a direct, specific statement.
> Before: *"Whether you prefer combat or diplomacy, the system adapts to your playstyle."*
> After: *"The system handles both combat and diplomacy through the same resolution mechanic."*

**Pattern G — "Above all" / "Ultimately" closers**
Delete the sentence. If it contains a specific point not made elsewhere, extract it and integrate it as a plain statement in the paragraph body.

---

### 4. Verify

Run the Grep tool on the target file for each of the following patterns. Fix any remaining hits before finishing.

**Pass 1:**
```
navigate|immersive|immerse\b|fluid\b|lean into|one decision at a time|one choice at a time|dive deeper|dive into|unlock its|feels alive|layered and alive|deepen your|seamlessly|tapestry|unfolding narrative|weave.*story|breathe life|adapt.*vision|enjoy the journey|isn't just|is not just|more than just|welcome to|think of this as|making each moment|feel meaningful|feel memorable|feel impactful|robust|vibrant|nuanced|at its core|at the heart of|the rest is up to you|endless possibilities|only your imagination|and so much more
```

Also grep separately for double hyphens (`--`). Each hit is either a typographic error (replace with `—`) or a crutch connector (restructure per the em-dash rule in Task 1).

**Pass 2:**
```
whether you|whether.*or.*you|from.*to.*every|allows you to|ensures that|above all,|ultimately,
```

Both passes must return zero hits on the pattern list before the task is complete.

---

### 5. Report

State the number of changes made and which sections were affected. Do not summarise what the document says.
