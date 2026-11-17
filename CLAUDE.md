# Fiction Engine Framework — project notes

## Folder structure

| folder           | contents                                      |
|------------------|-----------------------------------------------|
| `foundation/`    | framework doc, Glossary, Thresholds ruleset   |
| `analysis/`      | Part II chapters                              |
| `limits/`        | Part V chapters                               |
| `handbook/`      | The Fiction Engine Handbook (EN, IT)          |
| `comparative/`   | Part II chapter (Same Thinness)               |
| `system_thinking/` | Part III chapters and Part IV (One Agent)   |

New essays go in the folder that matches their arc. Drop the `.md` file there, then register it in `index.html`.

## Adding a new essay

All navigation is driven by the `ESSAYS` array in `index.html`. To add an essay:

1. Place the `.md` file in the correct folder.
2. Add an entry to `ESSAYS` in the correct position (order determines prev/next links):

```js
{
    id: 'kebab-case-slug',              // becomes ?page=<id> in the URL
    file: 'folder/snake_case_file.md', // path relative to repo root
    title: 'Short Title',
    subtitle: 'The longer subtitle as it appears in the essay',
    desc: 'One-sentence description shown on the index page.',
    num: '09',                          // sequential two-digit string; '—' for unnumbered docs
    arc: 'systems'                      // see arc values below
}
```

3. Update `num` values of any entries that follow if inserting mid-sequence.
4. If adding a new arc, also add a key to `ARC_LABELS` and a filter + `arcSection()` call in `renderIndex()`.

## Current essay order and parts

The book has five parts. In `index.html` each part is an `arc`; in `master.qmd` each part opens with a raw Typst part page.

| num | id                      | arc (part)          | file                                              |
|-----|-------------------------|---------------------|---------------------------------------------------|
| —   | handbook                | null (Handbook)     | handbook/fiction_engine_handbook.md               |
| —   | framework               | framework (I)       | foundation/fiction_engine_framework.md            |
| 01  | transparency-threshold  | analysis (II)       | analysis/transparency_threshold_essay.md          |
| 02  | four-designs            | analysis (II)       | analysis/four_designs_one_framework.md            |
| 03  | same-thinness           | analysis (II)       | comparative/same_thinness_different_purposes.md   |
| 04  | fiction-memory          | systems (III)       | system_thinking/fiction_and_memory.md             |
| 05  | emergence-condition     | systems (III)       | system_thinking/emergence_condition.md            |
| 06  | threshold-trajectory    | systems (III)       | system_thinking/threshold_trajectory.md           |
| 07  | properties-behaviors    | systems (III)       | system_thinking/properties_behaviors.md           |
| 08  | one-agent-loop          | solo (IV)           | system_thinking/one_agent_one_loop.md             |
| 09  | limits-framing          | limits (V)          | limits/essay_limits_framing.md                    |
| 10  | limits-powerlessness    | limits (V)          | limits/limits_essay1_powerlessness.md             |
| 11  | limits-fixed-answer     | limits (V)          | limits/limits_essay2_the_fixed_answer.md          |
| 12  | limits-weight-system    | limits (V)          | limits/limits_essay3_weight_of_system.md          |
| 13  | limits-above-situation  | limits (V)          | limits/limits_essay4_above_the_situation.md       |
| 14  | limits-building-nothing | limits (V)          | limits/limits_essay5_building_into_nothing.md     |
| —   | glossary                | appendix            | foundation/glossary.md                            |

The Bet was merged into the framework chapter, and the Open Strategy Games essay was removed (2026-11-17): it was only a comparison, not part of the theory.

## Arc values

| arc value     | label in index                   |
|---------------|----------------------------------|
| `null`        | Handbook                         |
| `'framework'` | Part I. The Framework            |
| `'analysis'`  | Part II. Reading a Design        |
| `'systems'`   | Part III. Why It Works           |
| `'solo'`      | Part IV. One Player              |
| `'limits'`    | Part V. Where the Engine Stops   |
| `'appendix'`  | Appendix                         |

Chapters are numbered 01 to 14 in reading order; the handbook, the framework and the glossary are unnumbered (`num: '—'`).

## Design notes

- Font: ET-Book via jsDelivr CDN. Do not swap it.
- Color scheme: warm parchment light mode / warm dark mode, both driven by CSS variables in `:root` and `@media (prefers-color-scheme: dark)`. Change colors only there.
- Max content width: 720px (`--max-w`).
- The home/index route is `?` or `?page=home` — both render the editorial index, not an essay.
- Front matter (`---…---`) in `.md` files is stripped automatically before rendering.
