-- Insert a Typst pagebreak(to: "odd") before each H1 heading.
-- Skips the first H1 so the document doesn't open with a blank page.
-- Only active when rendering to Typst.

local first_seen = false

function Header(el)
  if FORMAT ~= "typst" then return el end
  if el.level ~= 1 then return el end
  if not first_seen then
    first_seen = true
    return el
  end
  local pb = pandoc.RawBlock("typst", '#pagebreak(to: "odd")')
  return { pb, el }
end
