# Fiction Engine Framework — project notes

## Adding a new essay

All navigation is driven by the `ESSAYS` array in `index.html` (around line 343). To add an essay:

1. Drop the `.md` file in the repo root.
2. Add an entry to `ESSAYS` in the correct position (order determines prev/next links):

```js
{
    id: 'kebab-case-slug',        // becomes ?page=<id> in the URL
    file: 'snake_case_file.md',   // filename relative to repo root
    title: 'Short Title',
    subtitle: 'The longer subtitle as it appears in the essay',
    desc: 'One-sentence description shown on the index page.',
    num: '08',                    // sequential two-digit string; '—' for the foundation doc
    arc: 'systems'                // null = Foundation, 'analysis' = Analysis Arc, 'systems' = Systems Thinking Arc
}
```

3. Update the `num` values of any entries that follow if inserting mid-sequence.

## Current essay order and arcs

| num | id                       | arc      |
|-----|--------------------------|----------|
| —   | framework                | null     |
| 01  | transparency-threshold   | analysis |
| 02  | four-designs             | analysis |
| 03  | faction-fiction          | analysis |
| 04  | fiction-memory           | systems  |
| 05  | emergence-condition      | systems  |
| 06  | threshold-trajectory     | systems  |
| 07  | properties-behaviors     | systems  |

## Adding a new arc

If a new thematic grouping is needed, add a key to `ARC_LABELS` (around line 418):

```js
const ARC_LABELS = {
    analysis: 'Analysis Arc',
    systems:  'Systems Thinking Arc',
    newkey:   'New Arc Label'
};
```

Then use that key as the `arc` value on the relevant essay entries.

## Design notes

- Font: ET-Book via jsDelivr CDN. Do not swap it.
- Color scheme: warm parchment light mode / warm dark mode, both driven by CSS variables in `:root` and `@media (prefers-color-scheme: dark)`. Change colors only there.
- Max content width: 720px (`--max-w`).
- The home/index route is `?` or `?page=home` — both render the editorial index, not an essay.
- Front matter (`---…---`) in `.md` files is stripped automatically before rendering.
