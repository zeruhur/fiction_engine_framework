# Fiction Engine Framework — project notes

## Folder structure

| folder           | contents                                      |
|------------------|-----------------------------------------------|
| `foundation/`    | framework doc, Glossary, Thresholds ruleset   |
| `analysis/`      | Analysis Arc essays (01–02)                   |
| `limits/`        | Limits sub-series                             |
| `handbook/`      | The Fiction Engine Handbook (EN, IT)          |
| `comparative/`   | Comparative essays (standalone, unnumbered)   |
| `system_thinking/` | Systems Thinking Arc essays (03–07)         |

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

## Current essay order and arcs

| num | id                     | arc         | file                                              |
|-----|------------------------|-------------|---------------------------------------------------|
| —   | handbook               | null        | handbook/fiction_engine_handbook.md               |
| —   | framework              | null        | foundation/fiction_engine_framework.md            |
| 01  | transparency-threshold | analysis    | analysis/transparency_threshold_essay.md          |
| 02  | four-designs           | analysis    | analysis/four_designs_one_framework.md            |
| —   | same-thinness          | comparative | comparative/same_thinness_different_purposes.md   |
| 03  | fiction-memory         | systems     | system_thinking/fiction_and_memory.md             |
| 04  | emergence-condition    | systems     | system_thinking/emergence_condition.md            |
| 05  | threshold-trajectory   | systems     | system_thinking/threshold_trajectory.md           |
| 06  | properties-behaviors   | systems     | system_thinking/properties_behaviors.md           |
| 07  | one-agent-loop         | systems     | system_thinking/one_agent_one_loop.md             |
| —   | limits-framing         | limits      | limits/essay_limits_framing.md                    |
| 08  | limits-powerlessness   | limits      | limits/limits_essay1_powerlessness.md             |
| 09  | limits-fixed-answer    | limits      | limits/limits_essay2_the_fixed_answer.md          |
| 10  | limits-weight-system   | limits      | limits/limits_essay3_weight_of_system.md          |
| 11  | limits-above-situation | limits      | limits/limits_essay4_above_the_situation.md       |
| 12  | limits-building-nothing| limits      | limits/limits_essay5_building_into_nothing.md     |
| —   | glossary               | appendix    | foundation/glossary.md                            |

The Bet was merged into the framework chapter, and the Open Strategy Games essay was removed (2026-11-17): it was only a comparison, not part of the theory.

## Arc values

| arc value     | label in index       | section                  |
|---------------|----------------------|--------------------------|
| `null`        | Foundation           | Framework + intro docs   |
| `'analysis'`  | Analysis Arc         | Essays 01–02             |
| `'comparative'` | Comparative        | Standalone comparisons   |
| `'systems'`   | Systems Thinking Arc | Essays 03–07             |
| `'limits'`    | Limits               | Framing + essays 08–12   |
| `'appendix'`  | Appendix             | Glossary and reference   |

Unnumbered documents (`num: '—'`) belong to Foundation, Comparative, or Appendix. Sequential numbers belong to Analysis and Systems arcs only.

## Design notes

- Font: ET-Book via jsDelivr CDN. Do not swap it.
- Color scheme: warm parchment light mode / warm dark mode, both driven by CSS variables in `:root` and `@media (prefers-color-scheme: dark)`. Change colors only there.
- Max content width: 720px (`--max-w`).
- The home/index route is `?` or `?page=home` — both render the editorial index, not an essay.
- Front matter (`---…---`) in `.md` files is stripped automatically before rendering.
