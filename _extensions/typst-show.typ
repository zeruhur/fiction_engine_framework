// Minimal document wrapper — all page layout, fonts, title page, and TOC
// are defined in typst-template.typ via include-in-header.
// If your local _brand.yml defines a richer worldbuilders function,
// commit that file and restore the original show partial.
$if(columns)$
#show: columns.with($columns$)
$endif$
