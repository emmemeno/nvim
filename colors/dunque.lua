local p = {
  red = "#ad846b",
  green = "#899159",
  blue = "#5b798f",
  yellow = "#877845",
  black = "#24211b",
  very_dark_gray = "#383836",
  dark_gray = "#565755",
  light_gray = "#949593",
  white = "#e4e3df"
}

 local hi = function(name, data) vim.api.nvim_set_hl(0, name, data) end

  -- Builtin highlighting groups
  hi('ColorColumn',    { fg=nil,       bg=p.very_dark_gray })
  hi('ComplMatchIns',  { fg=nil,       bg=nil })
  hi('Conceal',        { fg=p.blue,   bg=nil })
  hi('CurSearch',      { fg=p.bg,      bg=p.greeb })
  hi('Cursor',         { fg=p.black,      bg=p.white })
  hi('CursorColumn',   { fg=nil,       bg=p.very_dark_gray})
  hi('CursorIM',       { link='Cursor' })
  hi('CursorLine',     { fg=nil,       bg=p.very_dark_gray })
  hi('CursorLineFold', { fg=p.very_dark_gray, bg=nil })
  hi('CursorLineNr',   { fg=p.accent,  bg=nil,       bold=true })
  hi('CursorLineSign', { fg=p.very_dark_gray, bg=nil })
  hi('DiffAdd',        { fg=p.green,       bg=nil })
  hi('DiffChange',     { fg=p.blue,       bg=nil })
  hi('DiffDelete',     { fg=p.red,       bg=nil })
  hi('DiffText',       { fg=p.light_gray,       bg=nil })
  hi('DiffTextAdd',    { link='DiffAdd' })
  hi('Directory',      { fg=p.blue,   bg=nil })
  hi('EndOfBuffer',    { fg=p.very_dark_gray, bg=nil })
  hi('ErrorMsg',       { fg=p.red,     bg=nil })
  hi('FloatBorder',    { fg=p.dark_gray,  bg=nil })
  hi('FloatTitle',     { fg=p.light_gray,  bg=nil, bold=true })
  hi('FoldColumn',     { fg=p.very_dark_gray, bg=nil })
  hi('Folded',         { fg=p.very_dark_gray, bg=nil })
  hi('IncSearch',      { fg=p.black,      bg=p.green })
  hi('lCursor',        { fg=p.black,      bg=p.light_gray })
  hi('LineNr',         { fg=p.very_dark_gray, bg=nil })
  hi('LineNrAbove',    { link='LineNr' })
  hi('LineNrBelow',    { link='LineNr' })
  hi('MatchParen',     { fg=nil,       bg=p.very_dark_gray, bold=true })
  hi('ModeMsg',        { fg=p.green,   bg=nil })
  hi('MoreMsg',        { fg=p.blue,   bg=nil })
  hi('MsgArea',        { link='Normal' })
  hi('MsgSeparator',   { fg=p.very_dark_gray, bg=nil })
  hi('NonText',        { fg=p.very_dark_gray, bg=nil })
  hi('Normal',         { fg=p.light_gray,      bg=p.black })
  hi('NormalFloat',    { fg=p.light_gray,      bg=nil })
  hi('NormalNC',       { link='Normal' })
  hi('OkMsg',          { fg=p.green,   bg=nil })
  hi('Pmenu',          { fg=p.light_gray,      bg=p.very_dark_gray })
  hi('PmenuExtra',     { link='Pmenu' })
  hi('PmenuExtraSel',  { link='PmenuSel' })
  hi('PmenuKind',      { link='Pmenu' })
  hi('PmenuKindSel',   { link='PmenuSel' })
  hi('PmenuMatch',     { fg=p.light_gray,      bg=p.very_dark_gray,  bold=true })
  hi('PmenuMatchSel',  { fg=nil,       bg=nil,       bold=true,   blend=0, reverse=true })
  hi('PmenuSbar',      { link='Pmenu' })
  hi('PmenuSel',       { fg=nil,       bg=nil,       blend=0,     reverse=true })
  hi('PmenuThumb',     { fg=nil,       bg=p.very_dark_gray })
  hi('Question',       { fg=p.blue,   bg=nil })
  hi('QuickFixLine',   { fg=nil,       bg=nil,       bold=true })
  hi('Search',         { fg=p.black,      bg=p.light_gray })
  hi('SignColumn',     { fg=p.very_dark_gray, bg=nil })
  hi('SpecialKey',     { fg=p.very_dark_gray, bg=nil })
  hi('SpellBad',       { fg=nil,       bg=nil,       sp=p.red,    undercurl=true })
  hi('SpellCap',       { fg=nil,       bg=nil,       sp=p.cyan,   undercurl=true })
  hi('SpellLocal',     { fg=nil,       bg=nil,       sp=p.yellow, undercurl=true })
  hi('SpellRare',      { fg=nil,       bg=nil,       sp=p.blue,   undercurl=true })
  hi('StatusLine',     { fg=p.light_gray_mid,  bg=p.light_gray_bg })
  hi('StatusLineNC',   { fg=p.light_gray_mid,  bg=p.black_edge })
  hi('StderrMsg',      { link='ErrorMsg' })
  hi('StdoutMsg',      { link='MsgArea' })
  hi('Substitute',     { fg=p.black,      bg=p.light_gray })
  hi('TabLine',        { fg=p.light_gray,  bg=p.very_dark_gray })
  hi('TabLineFill',    { link='Tabline' })
  hi('TabLineSel',     { fg=p.light_gray,  bg=p.very_dark_gray })
  hi('TermCursor',     { fg=nil,       bg=nil,       reverse=true })
  hi('TermCursorNC',   { fg=nil,       bg=nil,       reverse=true })
  hi('Title',          { fg=p.blue,  bg=nil })
  hi('VertSplit',      { fg=p.light_gray,  bg=nil })
  hi('Visual',         { fg=nil,       bg=p.very_dark_gray })
  hi('VisualNOS',      { link='Visual' })
  hi('WarningMsg',     { fg=p.blue,  bg=nil })
  hi('Whitespace',     { fg=p.very_dark_gray, bg=nil })
  hi('WildMenu',       { link='PmenuSel' })
  hi('WinBar',         { link='StatusLine' })
  hi('WinBarNC',       { link='StatusLineNC' })
  hi('WinSeparator',   { fg=p.light_gray,  bg=nil })

    -- Standard syntax (affects treesitter)
  hi('Boolean',        { link='Constant' })
  hi('Character',      { link='Constant' })
  hi('Comment',        { fg=p.dark_gray, bg=nil })
  hi('Conditional',    { link='Statement' })
  hi('Constant',       { fg=p.green,  bg=nil })
  hi('Debug',          { link='Special' })
  hi('Define',         { link='PreProc' })
  hi('Delimiter',      { fg=p.light_gray,  bg=nil })
  hi('Error',          { fg=p.red,       bg=nil })
  hi('Exception',      { link='Statement' })
  hi('Float',          { link='Constant' })
  hi('Function',       { fg=p.light_gray,   bg=nil })
  hi('Identifier',     { fg=p.light_gray,  bg=nil })
  hi('Ignore',         { fg=nil,       bg=nil })
  hi('Include',        { link='PreProc' })
  hi('Keyword',        { fg = p.blue, bg = nil })
  hi('Label',          { link='Statement' })
  hi('Macro',          { link='PreProc' })
  hi('Number',         { link='Constant' })
  hi('Operator',       { fg=p.light_gray,      bg=nil })
  hi('PreCondit',      { link='PreProc' })
  hi('PreProc',        { fg=p.blue,    bg=nil })
  hi('Repeat',         { link='Statement' })
  hi('Special',        { fg=p.light_gray,    bg=nil })
  hi('SpecialChar',    { link='Special' })
  hi('SpecialComment', { link='Special' })
  hi('Statement',      { fg=p.light_gray,      bg=nil,         bold=true })
  hi('StorageClass',   { link='Type' })
  hi('String',         { fg=p.green,   bg=nil })
  hi('Structure',      { link='Type' })
  hi('Tag',            { link='Special' })
  hi('Todo',           { fg=p.blue,  bg=nil, bold=true })
  hi('Type',           { fg=p.red,      bg=nil })
  hi('Typedef',        { link='Type' })

    -- Built-in snippets
  hi('SnippetTabstop',       { fg=nil, bg=p.very_dark_gray })
  hi('SnippetTabstopActive', { fg=nil, bg=p.dark_gray })

  -- Other community standard
  hi('Bold',       { fg=nil, bg=nil, bold=true })
  hi('Italic',     { fg=nil, bg=nil, italic=true })
  hi('Underlined', { fg=nil, bg=nil, underline=true })

   -- Tree-sitter
  -- Sources:
  -- - `:h treesitter-highlight-groups`
  -- - https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights
  hi('@text.literal',   { link='Special' })
  hi('@text.reference', { link='Identifier' })
  hi('@text.title',     { link='Title' })
  hi('@text.uri',       { link='Underlined' })
  hi('@text.todo',      { link='Todo' })
  hi('@text.note',      { link='MoreMsg' })
  hi('@text.warning',   { link='WarningMsg' })
  hi('@text.danger',    { link='ErrorMsg' })
  hi('@text.strong',    { fg=nil, bg=nil, bold=true          })
  hi('@text.emphasis',  { fg=nil, bg=nil, italic=true        })
  hi('@text.strike',    { fg=nil, bg=nil, strikethrough=true })
  hi('@text.underline', { link='Underlined' })

  hi('@comment',     { link='Comment' })
  hi('@punctuation', { link='Delimiter' })

  hi('@constant',          { link='Constant' })
  hi('@constant.builtin',  { link='Special' })
  hi('@constant.macro',    { link='Macro' })
  hi('@define',            { link='Define' })
  hi('@macro',             { link='Macro' })
  hi('@string',            { link='String' })
  hi('@string.escape',     { link='SpecialChar' })
  hi('@string.special',    { link='SpecialChar' })
  hi('@character',         { link='Character' })
  hi('@character.special', { link='SpecialChar' })
  hi('@number',            { link='Number' })
  hi('@boolean',           { link='Boolean' })
  hi('@float',             { link='Float' })

  hi('@function',         { link='Function' })
  hi('@function.builtin', { link='Special' })
  hi('@function.call',    { link='Function' })
  hi('@function.macro',   { link='Macro' })
  hi('@parameter',        { fg=p.light_gray, bg=nil })
  hi('@method',           { link='Function' })
  hi('@method.call',      { link='Function' })
  hi('@field',            { link='Identifier' })
  hi('@property',         { link='Identifier' })
  hi('@constructor',      { link='Special' })

  hi('@conditional',    { link='Conditional' })
  hi('@repeat',         { link='Repeat' })
  hi('@label',          { link='Label' })
  hi('@operator',       { link='Operator' })
  hi('@keyword',        { link='Keyword' })
  hi('@keyword.return', { fg=p.orange, bg=nil, bold=true })
  hi('@exception',      { link='Exception' })

  hi('@variable',         { fg=p.light_gray, bg=nil })
  hi('@variable.builtin', { fg=p.light_gray})
  hi('@type',             { link='Type' })
  hi('@type.builtin',     { link='Special' })
  hi('@type.definition',  { link='Typedef' })
  hi('@storageclass',     { link='StorageClass' })
  hi('@structure',        { link='Structure' })
  hi('@namespace',        { link='Identifier' })
  hi('@include',          { link='Include' })
  hi('@preproc',          { link='PreProc' })
  hi('@debug',            { link='Debug' })
  hi('@tag',              { link='Tag' })

  hi('@symbol', { link='Keyword' })
  hi('@none',   {})

  -- Semantic tokens. Source: `:h lsp-semantic-highlight`.
  hi('@lsp.type.class',         { link='@structure' })
  hi('@lsp.type.decorator',     { link='@function' })
  hi('@lsp.type.enum',          { link='@type' })
  hi('@lsp.type.enumMember',    { link='@constant' })
  hi('@lsp.type.function',      { link='@function' })
  hi('@lsp.type.interface',     { link='@type' })
  hi('@lsp.type.macro',         { link='@macro' })
  hi('@lsp.type.method',        { link='@method' })
  hi('@lsp.type.namespace',     { link='@namespace' })
  hi('@lsp.type.parameter',     { link='@parameter' })
  hi('@lsp.type.property',      { link='@property' })
  hi('@lsp.type.struct',        { link='@structure' })
  hi('@lsp.type.type',          { link='@type' })
  hi('@lsp.type.typeParameter', { link='@type.definition' })
  hi('@lsp.type.variable',      { link='@variable' })
  
  -- New tree-sitter groups
  if vim.fn.has('nvim-0.10') == 1 then
    -- Sources:
    -- - `:h treesitter-highlight-groups`
    -- - https://github.com/nvim-treesitter/nvim-treesitter/commit/1ae9b0e4558fe7868f8cda2db65239cfb14836d0
    -- NOTE: commented groups are the same as in Neovim<0.10 defined earlier

    -- @variable
    -- @variable.builtin
    hi('@variable.parameter', { link='@parameter' })
    hi('@variable.member',    { link='@field' })

    -- @constant
    -- @constant.builtin
    -- @constant.macro

    hi('@module',         { link='@namespace' })
    hi('@module.builtin', { link='@variable.builtin' })
    -- @label

    -- @string
    hi('@string.documentation',  { link='@string' })
    hi('@string.regexp',         { link='SpecialChar' })
    -- @string.escape
    -- @string.special
    hi('@string.special.symbol', { link='@constant' })
    hi('@string.special.path',   { link='Directory' })
    hi('@string.special.url',    { link='@markup.link.url' })
    hi('@string.special.vimdoc', { link='@constant' })

    -- @character
    -- @character.special

    -- @boolean
    -- @number
    hi('@number.float', { link='@float' })

    -- @type
    -- @type.builtin
    -- @type.definition
    hi('@type.qualifier', { link='StorageClass' })

    hi('@attribute', { link='Macro' })
    -- @property

    -- @function
    -- @function.builtin
    -- @function.call
    -- @function.macro

    hi('@function.method',      { link='@method' })
    hi('@function.method.call', { link='@method.call' })

    -- @constructor
    -- @operator

    -- @keyword
    hi('@keyword.coroutine', { link='@keyword' })
    hi('@keyword.function',  { link='@keyword' })
    hi('@keyword.operator',  { link='@keyword' })
    hi('@keyword.import',    { link='@keyword' })
    hi('@keyword.storage',   { link='@keyword' })
    hi('@keyword.repeat',    { link='@keyword' })
    -- @keyword.return
    hi('@keyword.debug',     { fg=p.blue, bg=nil, bold=true })
    hi('@keyword.exception', { link='@keyword' })

    hi('@keyword.conditional',         { link='@keyword' })
    hi('@keyword.conditional.ternary', { link='keyword' })

    hi('@keyword.directive',        { fg=p.blue, bg=nil, bold=true })
    hi('@keyword.directive.define', { link='@keyword.directive' })

    hi('@punctuation.delimiter', { link='@punctuation' })
    hi('@punctuation.bracket',   { link='@punctuation' })
    hi('@punctuation.special',   { link='Special' })

    -- @comment
    hi('@comment.documentation', { link='@comment' })

    hi('@comment.error',   { link='@text.danger' })
    hi('@comment.warning', { link='@text.warning' })
    hi('@comment.todo',    { link='@text.todo' })
    hi('@comment.note',    { link='@text.note' })

    hi('@markup.strong',        { link='@text.strong' })
    hi('@markup.italic',        { link='@text.emphasis' })
    hi('@markup.strikethrough', { link='@text.strike' })
    hi('@markup.underline',     { link='@text.underline' })

    hi('@markup.heading',   { link='@text.title' })
    hi('@markup.heading.1', { fg=p.red, bg=nil })
    hi('@markup.heading.2', { fg=p.green, bg=nil })
    hi('@markup.heading.3', { fg=p.blue,  bg=nil })
    hi('@markup.heading.4', { fg=p.yellow,   bg=nil })
    hi('@markup.heading.5', { fg=p.light_gray,  bg=nil })
    hi('@markup.heading.6', { fg=p.light_gray,   bg=nil })

    hi('@markup.heading.4.vimdoc', { link='Title' })

    hi('@markup.quote',       { link='@string.special' })
    hi('@markup.math',        { link='@string.special' })
    hi('@markup.environment', { link='@module' })

    hi('@markup.link',       { link='@text.reference' })
    hi('@markup.link.label', { link='@markup.link' })
    hi('@markup.link.url',   { fg=p.light_gray, bg=nil, underline=true })

    hi('@markup.raw',       { link='@text.literal' })
    hi('@markup.raw.block', { link='@markup.raw' })

    hi('@markup.list',           { link='@punctuation.special' })
    hi('@markup.list.checked',   { link='DiagnosticOk' })
    hi('@markup.list.unchecked', { link='DiagnosticWarn' })

    hi('@diff.plus',  { link='diffAdded' })
    hi('@diff.minus', { link='diffRemoved' })
    hi('@diff.delta', { link='diffChanged' })

    -- @tag
    hi('@tag.attribute', { link='@tag' })
    hi('@tag.delimiter', { link='@punctuation' })
  end

  -- Rust Specific Semantic
  hi('@lsp.typemod.method.declaration.rust', { fg=nil, bg=nil, bold=true})

  -- Built-in diagnostic
  hi('DiagnosticError', { fg=p.red,    bg=nil })
  hi('DiagnosticHint',  { fg=p.blue,   bg=nil })
  hi('DiagnosticInfo',  { fg=p.blue,   bg=nil })
  hi('DiagnosticOk',    { fg=p.green,  bg=nil })
  hi('DiagnosticWarn',  { fg=p.yellow, bg=nil })

  hi('DiagnosticUnderlineError', { fg=nil, bg=nil, sp=p.red,    underline=true })
  hi('DiagnosticUnderlineHint',  { fg=nil, bg=nil, sp=p.blue,   underline=true })
  hi('DiagnosticUnderlineInfo',  { fg=nil, bg=nil, sp=p.blue,   underline=true })
  hi('DiagnosticUnderlineOk',    { fg=nil, bg=nil, sp=p.green,  underline=true })
  hi('DiagnosticUnderlineWarn',  { fg=nil, bg=nil, sp=p.yellow, underline=true })

  hi('DiagnosticFloatingError', { fg=p.red,    bg=p.very_dark_gray })
  hi('DiagnosticFloatingHint',  { fg=p.blue,   bg=p.very_dark_gray })
  hi('DiagnosticFloatingInfo',  { fg=p.blue,   bg=p.very_dark_gray })
  hi('DiagnosticFloatingOk',    { fg=p.green,  bg=p.very_dark_gray })
  hi('DiagnosticFloatingWarn',  { fg=p.yellow, bg=p.very_dark_gray })

  hi('DiagnosticVirtualTextError', { link='DiagnosticError' })
  hi('DiagnosticVirtualTextWarn',  { link='DiagnosticWarn' })
  hi('DiagnosticVirtualTextInfo',  { link='DiagnosticInfo' })
  hi('DiagnosticVirtualTextHint',  { link='DiagnosticHint' })
  hi('DiagnosticVirtualTextOk',    { link='DiagnosticOk' })

  hi('DiagnosticSignError', { link='DiagnosticError' })
  hi('DiagnosticSignWarn',  { link='DiagnosticWarn' })
  hi('DiagnosticSignInfo',  { link='DiagnosticInfo' })
  hi('DiagnosticSignHint',  { link='DiagnosticHint' })
  hi('DiagnosticSignOk',    { link='DiagnosticOk' })

  hi('DiagnosticDeprecated',  { fg=nil, bg=nil, sp=p.red, strikethrough=true })
  hi('DiagnosticUnnecessary', { link='Comment' })

  -- GIT
  -- Patch diff
  hi('diffAdded',   { fg=p.green,  bg=nil })
  hi('diffChanged', { fg=p.blue,   bg=nil })
  hi('diffFile',    { fg=p.yellow, bg=nil })
  hi('diffLine',    { fg=p.blue,   bg=nil })
  hi('diffRemoved', { fg=p.red,    bg=nil })
  hi('Added',       { fg=p.green,  bg=nil })
  hi('Changed',     { fg=p.blue,   bg=nil })
  hi('Removed',     { fg=p.red,    bg=nil })

  -- Git commit
  hi('gitcommitBranch',        { fg=p.red, bg=nil, bold=true })
  hi('gitcommitComment',       { link='Comment' })
  hi('gitcommitDiscarded',     { link='Comment' })
  hi('gitcommitDiscardedFile', { fg=p.light_gray, bg=nil, bold=true })
  hi('gitcommitDiscardedType', { fg=p.light_gray,  bg=nil })
  hi('gitcommitHeader',        { link='Title' })
  hi('gitcommitOverflow',      { fg=p.yellow, bg=nil })
  hi('gitcommitSelected',      { link='Comment' })
  hi('gitcommitSelectedFile',  { fg=p.green,  bg=nil, bold=true })
  hi('gitcommitSelectedType',  { link='gitcommitDiscardedType' })
  hi('gitcommitSummary',       { fg=p.green,  bg=nil })
  hi('gitcommitUnmergedFile',  { link='gitcommitDiscardedFile' })
  hi('gitcommitUnmergedType',  { link='gitcommitDiscardedType' })
  hi('gitcommitUntracked',     { link='Comment' })
  hi('gitcommitUntrackedFile', { fg=p.light_gray,   bg=nil })

  -- PLUGINS
  -- Mini Tab Line
  hi('MiniTabLineHidden', { fg = p.dark_gray, bg = p.black})
  hi('MiniTabLineCurrent', { fg = p.light_gray, bg = nil})
  hi('MiniTabLineModifiedCurrent', { fg = nil, bg = nil, italic = true})
  hi('MiniTabLineModifiedHidden', { fg = p.dark_gray, bg = nil, italic = true})
  -- Mini Status Line

  hi('MiniStatusLineModeNormal', { fg = p.black, bg = p.blue})
  hi('MiniStatusLineModeInsert', { fg = p.black, bg = p.green})
  hi('MiniStatusLineModeVisual', { fg = p.black, bg = p.red})
  hi('MiniStatusLineModeCommand', { fg = p.black, bg = p.yellow})
  hi('MiniStatusLineModeOther', { fg = p.black, bg = p.yellow})
  hi('MiniStatusLineDevInfo', { fg = p.light_gray, bg = p.very_dark_gray})
  hi('MiniStatusLineFileName', { fg = p.light_gray, bg = p.very_dark_gray})
  hi('MiniStatusLineFileInfo', { fg = p.light_gray, bg = p.very_dark_gray})
  hi('MiniStatusLineInactive', { fg = p.light_gray, bg = p.very_dark_gray})

  -- Mini HiPatterns, aka:
  -- todo, fixme, hack, note
  hi('MiniHipatternsFixme', { fg = p.red, bold = true})
  hi('MiniHipatternsTodo', { fg = p.blue, bold = true})
  hi('MiniHipatternsNote', { fg = p.green, bold = true})
  hi('MiniHipatternsHack', { fg = p.yellow, bold = true})

  -- Mini Indent
  hi('MiniIndentscopeSymbol', {fg = p.very_dark_gray})
