vim.g.colors_name = "moonveil"

local dark = {
  bg = "#000000",
  bg_alt = "#000000",
  bg_float = "#000000",
  bg_cursor = "#000000",
  bg_select = "#241D33",
  bg_border = "#000000",
  bg_diff = "#000000",
  bg_dim = "#000000",
  fg = "#EEEEEE",
  white = "#FFFFFF",
  purple = "#C9A0DC",
  purple_soft = "#C6A0F6",
  lavender = "#D3D3FF",
  teal = "#98C379",
  green = "#5FB878",
  red = "#F06C6C",
  orange = "#E2A76F",
  pink = "#F280B0",
  cyan = "#8FB9D8",
  gray = "#A5A5A5",
  bracket = "#C8C8C8",
  dim = "#6D6964",
}

local light = {
  bg = "#F2F2F2",
  bg_alt = "#F2F2F2",
  bg_float = "#FFFFFF",
  bg_cursor = "#E4E4E4",
  bg_select = "#E8DDF3",
  bg_border = "#E4E4E4",
  bg_diff = "#F2F2F2",
  bg_dim = "#F2F2F2",
  fg = "#1A1A1A",
  white = "#1A1A1A",
  purple = "#8A4FB0",
  purple_soft = "#A86ED0",
  lavender = "#6B74B8",
  teal = "#5C8A48",
  green = "#3F9860",
  red = "#C23B3B",
  orange = "#B87A2E",
  pink = "#C23B8B",
  cyan = "#3E6BB8",
  gray = "#414141",
  bracket = "#555555",
  dim = "#555555",
}

local p = vim.o.background == "light" and light or dark

local hl = function(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

local link = function(name, target)
  vim.api.nvim_set_hl(0, name, { link = target })
end

-- ============================================================================
-- Terminal palette
-- ============================================================================
local term_dark = {
  "#000000",
  "#F06C6C",
  "#5FB878",
  "#F280B0",
  "#C792EA",
  "#F280B0",
  "#8FB9D8",
  "#EEEEEE",
  "#6D6964",
  "#FF6C6C",
  "#7AD48A",
  "#F7A8CC",
  "#C6A0F6",
  "#F7A8CC",
  "#A9CBE0",
  "#FFFFFF",
}

local term_light = {
  "#545454",
  "#C23B3B",
  "#3F9860",
  "#B87A2E",
  "#3E6BB8",
  "#8A4FB0",
  "#5C8A48",
  "#1A1A1A",
  "#6E6E6E",
  "#E05A5A",
  "#5BB57A",
  "#D9944A",
  "#5A86D4",
  "#A86ED0",
  "#7AA86A",
  "#000000",
}

local term = vim.o.background == "light" and term_light or term_dark
for i, col in ipairs(term) do
  vim.g["terminal_color_" .. (i - 1)] = col
end

-- ============================================================================
-- Base UI
-- ============================================================================
hl("Normal", { fg = p.fg, bg = p.bg })
hl("NormalNC", { fg = p.fg, bg = p.bg })
hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
hl("FloatBorder", { fg = p.bg_border, bg = p.bg_float })
hl("FloatTitle", { fg = p.purple_soft, bold = true })
hl("Terminal", { fg = p.fg, bg = p.bg })

hl("Cursor", { fg = p.bg, bg = p.fg })
hl("lCursor", { fg = p.bg, bg = p.fg })
hl("CursorLine", { bg = p.bg_cursor })
hl("CursorColumn", { bg = p.bg_cursor })
hl("CursorLineNr", { fg = p.white, bold = true })
hl("LineNr", { fg = p.dim })
hl("ColorColumn", { bg = p.bg_alt })
hl("SignColumn", { fg = p.dim })
hl("Conceal", { fg = p.dim })

hl("Visual", { bg = p.bg_select })
hl("VisualNOS", { bg = p.bg_select, underline = true })

hl("Search", { fg = p.bg, bg = p.purple, bold = true })
hl("IncSearch", { fg = p.bg, bg = p.purple, bold = true })
hl("CurSearch", { fg = p.bg, bg = p.purple, bold = true })
hl("MatchParen", { fg = p.purple_soft, bold = true })
hl("QuickFixLine", { bg = p.bg_select })

hl("FoldColumn", { fg = p.dim })
hl("Folded", { fg = p.dim, bg = p.bg_alt })
hl("NonText", { fg = p.dim })
hl("SpecialKey", { fg = p.dim })
hl("Whitespace", { fg = p.dim })
hl("EndOfBuffer", { fg = p.dim })

hl("StatusLine", { fg = p.fg, bg = p.bg_alt })
hl("StatusLineNC", { fg = p.dim, bg = p.bg_alt })
hl("TabLine", { fg = p.dim, bg = p.bg_alt })
hl("TabLineFill", { bg = p.bg })
hl("TabLineSel", { fg = p.bg, bg = p.purple, bold = true })
hl("WinBar", { fg = p.lavender, bold = true })
hl("WinBarNC", { fg = p.dim })
hl("WinSeparator", { fg = p.bg_border })
hl("VertSplit", { fg = p.bg_border })

hl("Pmenu", { fg = p.fg, bg = p.bg_float })
hl("PmenuSel", { fg = p.bg, bg = p.purple, bold = true })
hl("PmenuSbar", { bg = p.bg_border })
hl("PmenuThumb", { bg = p.dim })
hl("WildMenu", { fg = p.bg, bg = p.purple, bold = true })

hl("Title", { fg = p.purple_soft, bold = true })
hl("Directory", { fg = p.lavender })
hl("MoreMsg", { fg = p.green })
hl("Question", { fg = p.lavender })
hl("ModeMsg", { fg = p.fg })
hl("MsgArea", { fg = p.fg })
hl("MsgSeparator", { fg = p.dim })

hl("Error", { fg = p.red, bold = true })
hl("ErrorMsg", { fg = p.red })
hl("WarningMsg", { fg = p.orange })
hl("Todo", { fg = p.bg, bg = p.pink, bold = true })

-- ============================================================================
-- Spelling
-- ============================================================================
hl("SpellBad", { sp = p.red, undercurl = true })
hl("SpellCap", { sp = p.pink, undercurl = true })
hl("SpellLocal", { sp = p.cyan, undercurl = true })
hl("SpellRare", { sp = p.pink, undercurl = true })

-- ============================================================================
-- Diff
-- ============================================================================
hl("DiffChange", { fg = p.pink })
hl("DiffAdd", { bg = p.bg_diff })
hl("DiffDelete", { fg = p.red, bg = p.bg_dim, strikethrough = true })
hl("DiffText", { fg = p.white, bold = true })

-- ============================================================================
-- LSP
-- ============================================================================
hl("LspReferenceText", { bg = p.bg_select })
hl("LspReferenceRead", { bg = p.bg_select })
hl("LspReferenceWrite", { bg = p.bg_select })
hl("LspSignatureActiveParameter", { fg = p.pink, underline = true })
hl("LspCodeLens", { fg = p.dim, italic = true })
hl("LspInlayHint", { fg = p.dim, italic = true })
hl("LspFloatWinTitle", { fg = p.purple_soft, bold = true })

-- ============================================================================
-- Diagnostics
-- ============================================================================
local diag = {
  Error = { col = p.red, dim = "#A05A5A" },
  Warn = { col = p.orange, dim = "#9A7A52" },
  Info = { col = p.cyan, dim = "#6E8CA0" },
  Hint = { col = p.lavender, dim = "#7E82A0" },
  Ok = { col = p.green, dim = "#5A8C70" },
}
for level, d in pairs(diag) do
  hl("Diagnostic" .. level, { fg = d.col })
  hl("DiagnosticSign" .. level, { fg = d.col })
  hl("DiagnosticVirtualText" .. level, { fg = d.dim })
  hl("DiagnosticUnderline" .. level, { sp = d.col, underline = true })
end
hl("DiagnosticUnnecessary", { fg = p.dim, italic = true })

-- ============================================================================
-- Git signs
-- ============================================================================
hl("SignAdd", { fg = p.green })
hl("SignChange", { fg = p.pink })
hl("SignDelete", { fg = p.red })
hl("GitSignsAdd", { fg = p.green })
hl("GitSignsChange", { fg = p.pink })
hl("GitSignsDelete", { fg = p.red })

-- ============================================================================
-- Core syntax
-- ============================================================================
hl("Comment", { fg = p.gray, italic = true })
hl("String", { fg = p.teal })
hl("Number", { fg = p.pink })
hl("Boolean", { fg = p.pink })
hl("Float", { fg = p.pink, bold = true })
hl("Constant", { fg = p.pink })
hl("Character", { fg = p.teal })
hl("Identifier", { fg = p.fg })
hl("Function", { fg = p.lavender })
hl("Keyword", { fg = p.purple })
hl("Statement", { fg = p.purple })
hl("Conditional", { fg = p.purple })
hl("Repeat", { fg = p.purple })
hl("Label", { fg = p.pink })
hl("Operator", { fg = p.purple_soft })
hl("Exception", { fg = p.purple })
hl("Include", { fg = p.purple_soft })
hl("PreProc", { fg = p.orange })
hl("Define", { fg = p.orange })
hl("Macro", { fg = p.orange })
hl("PreCondit", { fg = p.orange })
hl("Type", { fg = p.purple_soft })
hl("StorageClass", { fg = p.purple_soft })
hl("Structure", { fg = p.purple_soft })
hl("Typedef", { fg = p.purple_soft })
hl("Special", { fg = p.pink })
hl("SpecialChar", { fg = p.pink })
hl("Tag", { fg = p.teal })
hl("Delimiter", { fg = p.gray })
hl("SpecialComment", { fg = p.gray, italic = true })
hl("Debug", { fg = p.pink })
hl("Underlined", { fg = p.cyan, underline = true })
hl("Ignore", { fg = p.dim })

-- ============================================================================
-- Treesitter
-- ============================================================================
hl("@comment", { link = "Comment" })
hl("@comment.error", { fg = p.red })
hl("@comment.warning", { fg = p.orange })
hl("@comment.note", { fg = p.cyan })
hl("@comment.todo", { fg = p.pink, italic = true })

hl("@keyword", { link = "Keyword" })
hl("@keyword.import", { link = "Include" })
hl("@keyword.return", { link = "Keyword" })
hl("@keyword.conditional", { link = "Conditional" })
hl("@keyword.repeat", { link = "Repeat" })
hl("@keyword.exception", { link = "Exception" })
hl("@keyword.function", { fg = p.purple, bold = true })
hl("@keyword.operator", { fg = p.purple_soft })
hl("@keyword.type", { fg = p.purple, bold = true })

hl("@storageclass", { link = "StorageClass" })
hl("@storageclass.lifetime", { link = "StorageClass" })
hl("@label", { fg = p.pink })
hl("@operator", { link = "Operator" })
hl("@exception", { link = "Exception" })
hl("@define", { link = "Define" })
hl("@macro", { link = "Macro" })
hl("@include", { link = "Include" })

hl("@type", { link = "Type" })
hl("@type.builtin", { link = "Type" })
hl("@type.qualifier", { link = "Type" })
hl("@type.definition", { link = "Type" })
hl("@type.modifier", { link = "Type" })
hl("@namespace", { fg = p.cyan })
hl("@module", { fg = p.cyan })
hl("@module.builtin", { fg = p.cyan })

hl("@function", { link = "Function" })
hl("@function.builtin", { link = "Function" })
hl("@function.call", { link = "Function" })
hl("@function.macro", { link = "Macro" })
hl("@function.method", { link = "Function" })
hl("@method", { link = "Function" })
hl("@method.call", { link = "Function" })
hl("@constructor", { fg = p.orange })
hl("@constructor.builtin", { fg = p.orange })

hl("@variable", { link = "Identifier" })
hl("@variable.builtin", { fg = p.pink })
hl("@variable.parameter", { fg = p.fg, italic = true })
hl("@parameter", { fg = p.fg, italic = true })
hl("@field", { fg = p.lavender })
hl("@property", { fg = p.lavender })
hl("@member", { fg = p.lavender })
hl("@member.plain", { fg = p.lavender })
hl("@variable.member", { fg = p.lavender })

hl("@constant", { link = "Constant" })
hl("@constant.builtin", { link = "Constant" })
hl("@constant.macro", { link = "Macro" })
hl("@number", { link = "Number" })
hl("@number.float", { link = "Float" })
hl("@boolean", { link = "Boolean" })
hl("@string", { link = "String" })
hl("@string.escape", { fg = p.pink })
hl("@string.special", { fg = p.pink })
hl("@string.regex", { link = "String" })
hl("@string.documentation", { fg = p.gray, italic = true })
hl("@character", { link = "Character" })
hl("@character.special", { fg = p.pink })

hl("@punctuation.delimiter", { fg = p.gray })
hl("@punctuation.bracket", { fg = p.bracket })
hl("@punctuation.special", { fg = p.pink })
hl("@punctuation.string", { fg = p.gray })

hl("@tag", { link = "Tag" })
hl("@tag.attribute", { fg = p.pink })
hl("@tag.delimiter", { fg = p.gray })
hl("@attribute", { fg = p.orange })
hl("@decorator", { fg = p.orange })
hl("@annotation", { fg = p.orange })
hl("@error", { fg = p.red })

-- ============================================================================
-- Markup / Markdown
-- ============================================================================
hl("@markup.heading.1", { fg = p.purple, bold = true })
hl("@markup.heading.2", { fg = p.purple })
hl("@markup.heading.3", { fg = p.purple_soft, bold = true })
hl("@markup.heading.4", { fg = p.purple_soft })
hl("@markup.heading.5", { fg = p.lavender, bold = true })
hl("@markup.heading.6", { fg = p.lavender })
hl("@markup.strong", { bold = true })
hl("@markup.italic", { italic = true })
hl("@markup.strikethrough", { strikethrough = true })
hl("@markup.underline", { underline = true })
hl("@markup.link.url", { fg = p.cyan, underline = true })
hl("@markup.link.label", { fg = p.lavender })
hl("@markup.link.text", { fg = p.fg })
hl("@markup.raw", { fg = p.lavender, bg = p.bg_float })
hl("@markup.quote", { fg = p.fg, bg = p.bg_alt, italic = true })
hl("@markup.list", { fg = p.gray })
hl("@markup.list.checked", { fg = p.green })
hl("@markup.list.unchecked", { fg = p.gray })
hl("@markup.math", { fg = p.pink })
hl("@markup.environment", { fg = p.purple_soft })

-- ============================================================================
-- Neovim-specific
-- ============================================================================
hl("@boolean.vim", { link = "Boolean" })
hl("@number.vim", { link = "Number" })
hl("@string.vim", { link = "String" })
hl("@keyword.vim", { link = "Keyword" })
hl("@function.vim", { link = "Function" })
hl("@variable.vim", { link = "Identifier" })

-- ============================================================================
-- Snacks dashboard
-- ============================================================================
hl("SnacksDashboardHeader", { fg = p.purple })
hl("DashboardHeader", { fg = p.purple })
hl("SnacksDashboardDesc", { fg = p.lavender })
hl("DashboardDesc", { fg = p.lavender })
hl("SnacksDashboardIcon", { fg = p.purple_soft })
hl("DashboardIcon", { fg = p.purple_soft })
hl("SnacksDashboardKey", { fg = p.purple_soft })
hl("DashboardKey", { fg = p.purple_soft })
hl("SnacksDashboardFile", { fg = p.lavender })
hl("DashboardFile", { fg = p.lavender })
hl("SnacksDashboardFooter", { fg = p.dim })
hl("DashboardFooter", { fg = p.dim })
hl("SnacksDashboardTitle", { fg = p.purple_soft, bold = true })
hl("DashboardTitle", { fg = p.purple_soft, bold = true })

-- ============================================================================
-- Neo-tree
-- ============================================================================
hl("NeoTreeNormal", { fg = p.fg, bg = p.bg_alt })
hl("NeoTreeNormalNC", { fg = p.fg, bg = p.bg_alt })
hl("NeoTreeCursorLine", { bg = p.bg_select })
hl("NeoTreeFileName", { fg = p.teal })
hl("NeoTreeFileNameOpened", { fg = p.green })
hl("NeoTreeFileIcon", { fg = p.teal })
hl("NeoTreeDirectoryName", { fg = p.lavender })
hl("NeoTreeDirectoryIcon", { fg = p.lavender })
hl("NeoTreeRootName", { fg = p.lavender, bold = true })
hl("NeoTreeTitleBar", { fg = p.purple_soft, bold = true })
hl("NeoTreeFloatTitle", { fg = p.purple_soft, bold = true })
hl("NeoTreeFilterTerm", { fg = p.cyan })
hl("NeoTreeDotfile", { fg = p.dim })
hl("NeoTreeDimText", { fg = p.dim })
hl("NeoTreeIndentMarker", { fg = p.bg_border })
hl("NeoTreeSymbolicLinkTarget", { fg = p.cyan, underline = true })
hl("NeoTreeGitAdded", { fg = p.green })
hl("NeoTreeGitModified", { fg = p.pink })
hl("NeoTreeGitDeleted", { fg = p.red })
hl("NeoTreeGitUntracked", { fg = p.lavender })
hl("NeoTreeGitConflict", { fg = p.orange })
hl("NeoTreeMessage", { fg = p.gray })
hl("NeoTreeModified", { fg = p.pink })

-- ============================================================================
-- Snacks picker
-- ============================================================================
hl("SnacksPickerListCursorLine", { fg = p.fg, bg = p.bg_select })
hl("SnacksPickerPreviewCursorLine", { fg = p.fg, bg = p.bg_select })
hl("SnacksPickerInputBorder", { fg = p.purple })
hl("SnacksPickerInputTitle", { fg = p.purple })
hl("SnacksPickerBoxTitle", { fg = p.purple_soft, bold = true })

-- ============================================================================
-- Snacks notifier
-- ============================================================================
hl("SnacksNotifierTrace", { fg = p.fg, bg = p.bg_float })
hl("SnacksNotifierDebug", { fg = p.fg, bg = p.bg_float })
hl("SnacksNotifierInfo", { fg = p.fg, bg = p.bg_float })
hl("SnacksNotifierWarn", { fg = p.fg, bg = p.bg_float })
hl("SnacksNotifierError", { fg = p.fg, bg = p.bg_float })

hl("SnacksNotifierIconTrace", { fg = p.purple })
hl("SnacksNotifierIconDebug", { fg = p.gray })
hl("SnacksNotifierIconInfo", { fg = p.cyan })
hl("SnacksNotifierIconWarn", { fg = p.orange })
hl("SnacksNotifierIconError", { fg = p.red })

hl("SnacksNotifierBorderTrace", { fg = p.purple })
hl("SnacksNotifierBorderDebug", { fg = p.gray })
hl("SnacksNotifierBorderInfo", { fg = p.cyan })
hl("SnacksNotifierBorderWarn", { fg = p.orange })
hl("SnacksNotifierBorderError", { fg = p.red })

hl("SnacksNotifierTitleTrace", { fg = p.purple })
hl("SnacksNotifierTitleDebug", { fg = p.gray })
hl("SnacksNotifierTitleInfo", { fg = p.cyan })
hl("SnacksNotifierTitleWarn", { fg = p.orange })
hl("SnacksNotifierTitleError", { fg = p.red })

-- ============================================================================
-- Noice
-- ============================================================================
hl("NoiceCmdlinePopup", { fg = p.fg, bg = p.bg_float })
hl("NoiceCmdlinePopupBorder", { fg = p.purple })
hl("NoiceCmdlinePopupTitle", { fg = p.purple })
hl("NoiceCmdlineIcon", { fg = p.purple })
hl("NoiceConfirmBorder", { fg = p.purple })

-- ============================================================================
-- Blink.cmp
-- ============================================================================
hl("BlinkCmpMenu", { fg = p.fg, bg = p.bg_float })
hl("BlinkCmpMenuBorder", { fg = p.purple })
hl("BlinkCmpMenuSelection", { fg = p.bg, bg = p.purple, bold = true })
hl("BlinkCmpLabel", { fg = p.fg })
hl("BlinkCmpLabelMatch", { fg = p.purple })
hl("BlinkCmpKindDefault", { fg = p.purple_soft })

-- ============================================================================
-- Misc plugins
-- ============================================================================
hl("SnacksIndent", { fg = p.bg_border })
hl("SnacksIndent1", { fg = p.bg_border })
hl("SnacksIndent2", { fg = p.bg_border })
hl("SnacksIndent3", { fg = p.bg_border })
hl("SnacksIndentScope", { fg = p.purple_soft })
hl("BufferCurrentSign", { fg = p.purple })
hl("BufferCurrentTarget", { fg = p.red })
hl("BufferVisible", { fg = p.dim })
hl("BufferVisibleIndex", { fg = p.dim })
hl("BufferInactiveIndex", { fg = p.dim })
hl("BufferLineSelected", { fg = p.purple_soft })
hl("BufferLineIndicatorSelected", { fg = p.purple })
hl("BufferLineSeparator", { fg = p.bg_alt })
hl("BufferLineSeparatorSelected", { fg = p.bg_alt })

hl("WhichKey", { fg = p.purple_soft })
hl("WhichKeyGroup", { fg = p.purple })
hl("WhichKeyValue", { fg = p.dim })
hl("WhichKeyDesc", { fg = p.fg })
hl("WhichKeySeparator", { fg = p.dim })
hl("WhichKeyNormal", { fg = p.fg, bg = p.bg_float })
hl("WhichKeyBorder", { fg = p.purple_soft })

hl("LazyProgressDone", { fg = p.purple })
hl("LazyProgressTodo", { fg = p.bg_border })
hl("LazyH1", { fg = p.bg, bg = p.purple, bold = true })
hl("LazyH2", { fg = p.purple_soft, bold = true })

hl("MiniIndentscopeSymbol", { fg = p.bg_border })
hl("MiniJump", { fg = p.purple })
hl("MiniStarterCurrent", { fg = p.purple })
hl("MiniStarterFooter", { fg = p.dim })

hl("FlashLabel", { fg = p.bg, bg = p.purple, bold = true })
hl("FlashMatch", { fg = p.bg, bg = p.purple })
hl("FlashPhrase", { fg = p.bg, bg = p.purple })
