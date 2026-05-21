# Fiction Engine Framework — project notes

## Folder structure

| folder           | contents                                      |
|------------------|-----------------------------------------------|
| `foundation/`    | framework doc, The Bet intro, Glossary        |
| `analysis/`      | Analysis Arc essays (01–03)                   |
| `comparative/`   | Comparative essays (standalone, unnumbered)   |
| `system_thinking/` | Systems Thinking Arc essays (04–08)         |

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

| num | id                    | arc         | file                                              |
|-----|-----------------------|-------------|---------------------------------------------------|
| —   | framework             | null        | foundation/fiction_engine_framework.md            |
| —   | the-bet               | null        | foundation/the_bet.md                             |
| 01  | transparency-threshold | analysis   | analysis/transparency_threshold_essay.md          |
| 02  | four-designs          | analysis    | analysis/four_designs_one_framework.md            |
| 03  | faction-fiction       | analysis    | analysis/faction_and_fiction_essay.md             |
| —   | same-thinness         | comparative | comparative/same_thinness_different_purposes.md   |
| 04  | fiction-memory        | systems     | system_thinking/fiction_and_memory.md             |
| 05  | emergence-condition   | systems     | system_thinking/emergence_condition.md            |
| 06  | threshold-trajectory  | systems     | system_thinking/threshold_trajectory.md           |
| 07  | properties-behaviors  | systems     | system_thinking/properties_behaviors.md           |
| 08  | one-agent-loop        | systems     | system_thinking/one_agent_one_loop.md             |
| —   | glossary              | appendix    | foundation/glossary.md                            |

## Arc values

| arc value     | label in index       | section                  |
|---------------|----------------------|--------------------------|
| `null`        | Foundation           | Framework + intro docs   |
| `'analysis'`  | Analysis Arc         | Essays 01–03             |
| `'comparative'` | Comparative        | Standalone comparisons   |
| `'systems'`   | Systems Thinking Arc | Essays 04–08             |
| `'appendix'`  | Appendix             | Glossary and reference   |

Unnumbered documents (`num: '—'`) belong to Foundation, Comparative, or Appendix. Sequential numbers belong to Analysis and Systems arcs only.

## Design notes

- Font: ET-Book via jsDelivr CDN. Do not swap it.
- Color scheme: warm parchment light mode / warm dark mode, both driven by CSS variables in `:root` and `@media (prefers-color-scheme: dark)`. Change colors only there.
- Max content width: 720px (`--max-w`).
- The home/index route is `?` or `?page=home` — both render the editorial index, not an essay.
- Front matter (`---…---`) in `.md` files is stripped automatically before rendering.
