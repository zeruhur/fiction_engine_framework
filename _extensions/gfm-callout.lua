function BlockQuote(el)
  -- 1. Must have at least one paragraph
  if #el.content == 0 or el.content[1].t ~= "Para" then
    return nil
  end

  local first_para = el.content[1]
  
  -- 2. Convert the first element to text to check for the pattern
  -- We only look at the very start of the paragraph.
  -- This handles "[!NOTE]" whether it is one string or split tokens.
  local stringified_para = pandoc.utils.stringify(first_para)
  
  -- 3. Check for GFM alert pattern: starts with [!WORD]
  -- Pattern: ^%[ ! (%w+) %] matches start, [, !, word, ]
  local type = stringified_para:match("^%[!([%w]+)%]")
  
  if type then
    -- Normalize type to lowercase for Quarto (NOTE -> note)
    type = type:lower()

    -- 4. Remove the marker "[!NOTE]" from the AST
    -- We iterate until we've removed the text corresponding to the marker
    local content_to_remove = 0
    
    -- Simple removal: assuming the first string is the marker
    -- (In most GFM parsers, "[!NOTE]" is the first 'Str')
    if first_para.content[1].t == "Str" and first_para.content[1].text:match("^%[!%w+%]$") then
       first_para.content:remove(1)
    end

    -- Remove optional following space/newline (e.g. "> [!NOTE] Text")
    if #first_para.content > 0 and (first_para.content[1].t == "Space" or first_para.content[1].t == "SoftBreak") then
      first_para.content:remove(1)
    end

    -- 5. Return a Quarto Callout
    return quarto.Callout({
      type = type,
      content = el.content
    })
  end
  
  return nil
end
