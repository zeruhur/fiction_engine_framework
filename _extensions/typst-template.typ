// ============================================
// 0. QUARTO COMPATIBILITY DEFINITIONS
// ============================================
#let horizontalrule = {
  v(1em)
  line(start: (25%, 0%), end: (75%, 0%), stroke: 0.5pt + gray)
  v(1em)
}

// ============================================
// 1. CONFIGURATION
// ============================================

// Font definitions
#let font-main = "Lora"
#let font-title = "Montserrat"
#let font-heading = "Montserrat"

// Page dimensions
#let page-dims = (
  width: 6in,
  height: 9in,
  margins: (
    left: 0.75in,
    right: 0.625in,
    top: 1.2in,
    bottom: 1in
  )
)

// Set page properties for the entire document
#set page(
  width: page-dims.width,
  height: page-dims.height,
  margin: page-dims.margins
)

// State to track if we've seen the first heading
#let first-heading-seen = state("first-heading", false)

// Force heading level 1 to always start on right (odd) page
// Except the very first heading, which should appear where body starts
#show heading.where(level: 1): it => {
  context {
    if first-heading-seen.get() {
      // Subsequent headings - do pagebreak to odd
      pagebreak(weak: false, to: "odd")
    } else {
      // First heading - no pagebreak needed, just update state
      first-heading-seen.update(true)
    }
  }
  v(5em)  // Add space at top of page before heading
  set text(font: font-title, size: 16pt, hyphenate: false, weight: "bold")
  it  
  v(2em)  // Add space at top of page before heading
}


#show heading.where(level: 2): set text(font: font-heading, size: 14pt, hyphenate: false, weight: "semibold")
#show heading.where(level: 3): set text(font: font-heading, size: 12pt, hyphenate: false, weight: "semibold")

// Keep list items together with some flexibility
#show list: it => {
  set block(above: 1em, below: 1em)
  it
}

#show list.item: it => {
  block(
    breakable: false,
    above: 0.8em,
    below: 0.8em,
    it
  )
}

// Table styling
#set table(
  stroke: none,
  fill: (col, row) => {
    if row == 0 {
      // Header row: no background
      none
    } else if calc.odd(row) {
      // Odd body rows (1, 3, ...): light grey background
      luma(240)
    }
  }
)
#show table.cell.where(y: 0): set text(weight: "bold")

// Make all tables span the full width of the page
// Note: For Quarto-generated tables, you may also need to set:
// format:
//   typst:
//     tbl-colwidths: auto
// in your _quarto.yml or document front matter
#show figure.where(kind: table): it => {
  block(width: 100%, it)
}
#show table: set align(center)


// Widow and orphan control
#set par(
  first-line-indent: 0pt,
  hanging-indent: 0pt,
  justify: true
)

// Body text
#set text(font: font-main, size: 11pt)

// ============================================
// 2. TITLE PAGE (no page number)
// ============================================
#set page(numbering: none, footer: none)

#align(right)[
//  #image("logo.png", width: 1in)
  #set par(justify: false)
  #v(18em)
  #text(font: font-title, size: 22pt, weight: "black", hyphenate: false)[
    $title$
  ]
  #v(-0.7em)
  #text(font: font-title, size: 12pt, weight: "bold")[
    $subtitle$
  ]
]

#align(center)[  
  #v(15em)
  #text(font: font-main, size: 11pt)[
    Version: $version$
  ]
]

// Ensure blank page after cover (title page on right, blank on left, TOC starts on right)
//#pagebreak()

// ============================================
// 3. TABLE OF CONTENTS (lowercase Roman numerals)
// ============================================
#set page(
  numbering: "i",
  footer: context [
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(4pt)
    #set text(font: font-heading, size: 11pt, weight: "bold")
    #align(if calc.odd(here().page()) { right } else { left })[
      #counter(page).display("i")
    ]
  ]
)

#counter(page).update(1)

$if(toc)$
// Use a show rule for the outline title for more flexibility
#show outline: set text(font: font-main, size: 10.5pt)

// Make level 1 entries in the TOC bold
#show outline.entry.where(level: 1): it => strong(it)
#outline(title: [$toc-title$], depth: $toc-depth$)
$endif$

// Create a blank page after TOC (will be in roman numerals)
//#pagebreak(weak: false, to: "even")
// Add nearly invisible content to force this page to render with roman numerals
#text(size: 0.01pt, fill: white)[.]
// Force another pagebreak to "close" the roman page before format switch
//#pagebreak()

// ============================================
// 4. BODY (Arabic numerals, restart at 1)
// ============================================
// Switch to arabic numerals starting from page 1
#set page(
  numbering: "1",
  footer: context [
    #line(length: 100%, stroke: 0.5pt + gray)
    #v(4pt)
    #set text(font: font-heading, size: 11pt, weight: "bold")
    #align(if calc.odd(here().page()) { right } else { left })[
      #counter(page).display()
    ]
  ]
)

#counter(page).update(0)

$body$
