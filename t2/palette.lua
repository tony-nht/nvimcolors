local lush = require("lush")

local g = vim.g

-- Instead of RGB where you specify red, green and blue components, HSL uses:
--
-- Hue        (0 - 360) (each value is a angle around the color wheel)
-- Saturation (0 - 100) (0 is gray, 100 is colored)
-- Lightness  (0 - 100) (0 is black, 100 is white)
-- Note: Converting between colorspaces can introduce minor color differences
--       due to floating point maths. You may prefer to manually adjust your
--       colors "by eye" afterwards.

-- ###
-- ### HSL operations
-- ###
--
-- Lush.hsl (and hsluv) provides a number of convenience functions for:
--
--   Relative adjustment (rotate(), saturate(), desaturate(), lighten(), darken())
--   Absolute adjustment (prefix above with abs_)
--   Combination         (mix())
--   Overrides           (hue(), saturation(), lightness())
--   Access              (.h, .s, .l)
--   Coercion            (tostring(), "Concatination: " .. color)
--   Helpers             (readable())
--
--   Adjustment functions have shortcut aliases, ro, sa, de, li, da
--                                               abs_sa, abs_de, abs_li, abs_da
--
-- Because HSL colors are represented by degrees around a colorwheel, we can find
-- harmonious colors from our original set by rotating the hue:

local hsl = lush.hsl -- We'll use hsl a lot so its nice to bind it separately
local p_main_fg = hsl(168, 50, 2)
local lush_fg = p_main_fg
-- local p_main_fg = hsl(83, 49, 79) -- you can just type them normally.  @ALT1
local lush_bg = hsl(340, 55, 82)

local lfg = lush_fg
local lbg = lush_bg
local background = lush_bg

local p_variable = p_main_fg
local p_operator = p_main_fg
local p_type = hsl(360, 100, 40)
-- local p_parameter = hsl(211, 100, 87)
local p_parameter = p_main_fg
local p_number = hsl(151, 100, 23)
local p_constant = hsl(229, 100, 53)
local p_string = hsl(244, 100, 38)
local p_keyword = hsl(276, 100, 38)
local p_function = p_main_fg
local p_comment = hsl(265, 100, 37)

local grey_bg_light = "#000000"
local blue = "#1561b8"
local green = "#1C5708"
local light_green = green
local light_red = "#f2d3cd"
local red = "#c4331d"
local grey = "#5e5e5e"
local pitch_black = "#000000"
local border = pitch_black
local highlight = p_keyword
local dark_yellow = "#b37f02"
local yellow = "#f9db70"
local light_yellow = "#f9eab3"
local orange = hsl(30, 80, 50)
local purple = p_keyword -- Would mark folder names in Oil buffer
local white = "#ffffff"
local cyan = "#007872"

g.terminal_color_0 = lush_fg
g.terminal_color_1 = red
g.terminal_color_2 = green
g.terminal_color_3 = dark_yellow
g.terminal_color_4 = blue
g.terminal_color_5 = purple
g.terminal_color_6 = cyan
g.terminal_color_7 = white

g.terminal_color_8 = lush_fg
g.terminal_color_9 = red
g.terminal_color_10 = green
g.terminal_color_11 = dark_yellow
g.terminal_color_12 = blue
g.terminal_color_13 = purple
g.terminal_color_14 = cyan
g.terminal_color_15 = lush_bg

local base = {
	-- This highlight group can be used when one wants to disable a highlight
	-- group using `winhl`
	Disabled = {},
	-- These highlight groups can be used for statuslines, for example when
	-- displaying ALE warnings and errors.
	BlackOnLightYellow = { fg = lfg, bg = light_yellow },
	LightRedBackground = { bg = light_red },
	WhiteOnBlue = { fg = white, bg = blue },
	WhiteOnOrange = { fg = white, bg = orange },
	WhiteOnRed = { fg = white, bg = red },
	WhiteOnYellow = { fg = white, bg = dark_yellow },
	Yellow = { fg = dark_yellow, bold = true },
	Bold = { fg = lfg, bold = true },
	Boolean = { link = "Keyword" },
	Character = { link = "String" },
	ColorColumn = { bg = highlight },
	Conceal = {},
	Constant = { fg = lfg },
	Cursor = { bg = lfg },
	Directory = { fg = purple },
	EndOfBuffer = { fg = background, bg = background },
	Error = { link = "ErrorMsg" },
	ErrorMsg = { fg = red, bold = true },
	FoldColumn = { link = "Comment" },
	Folded = { link = "Comment" },
	Identifier = { fg = lush_fg },
	Function = { fg = lush_fg },
	IncSearch = { link = "Search" },
	CurSearch = { link = "Search" },
	Include = { fg = lfg, bold = true },
	Keyword = { fg = lfg, bold = true },
	Label = { link = "Keyword" },
	LineNr = { fg = grey },
	Macro = { fg = orange },
	MatchParen = { bold = true },
	MoreMsg = { fg = lfg },
	ModeMsg = { fg = lfg, bold = true },
	MsgSeparator = { fg = border },
	NonText = { fg = grey },
	NormalFloat = { fg = lfg },
	FloatTitle = { fg = lfg, bold = true },
	FloatBorder = { fg = border },
	Operator = { fg = lfg },
	Pmenu = { fg = lfg, bg = lbg },
	PmenuSbar = { bg = grey_bg_light },
	PmenuSel = { bg = green, bold = true },
	PmenuThumb = { bg = pitch_black },
	PmenuMatch = { fg = dark_yellow, bold = true },
	PreCondit = { link = "Macro" },
	PreProc = { fg = lfg },
	Question = { fg = lfg },
	QuickFixLine = { bg = highlight, bold = true },
	Regexp = { fg = orange },
	Search = { bg = light_yellow },
	SignColumn = { link = "FoldColumn" },
	Special = { fg = lfg },
	SpecialKey = { link = "Number" },
	SpellBad = { sp = red, underline = true },
	SpellCap = { sp = dark_yellow, underline = true },
	SpellLocal = { sp = blue, underline = true },
	SpellRare = { sp = purple, underline = true },
	Statement = { link = "Keyword" },
	StatusLine = { fg = lfg, bg = lbg },
	StatusLineNC = { fg = lfg, bg = grey_bg_light },
	StatusLineTab = { fg = lfg, bg = lbg, bold = true },
	WinBar = { fg = lbg, bold = true },
	WinBarNc = { fg = lbg, bold = true },
	WinBarFill = { fg = border },
	StorageClass = { link = "Keyword" },
	String = { fg = green },
	SnippetTabstop = {},
	Symbol = { fg = orange },
	TabLine = { fg = lfg, bg = pitch_black },
	TabLineFill = { fg = lfg, bg = pitch_black },
	TabLineSel = { fg = lfg, bg = background, bold = true },
	Title = { fg = lfg, bold = true },
	Todo = { fg = grey, bold = true },
	Type = { link = "Constant" },
	Underlined = { underline = true },
	VertSplit = { fg = border },
	WinSeparator = { fg = border },
	Visual = { bg = pitch_black },
	WarningMsg = { fg = dark_yellow, bold = true },
	Whitespace = { fg = border },
	WildMenu = { link = "PmenuSel" },
	-- ALE
	ALEError = { fg = red, bold = true },
	ALEErrorSign = { fg = red, bold = true },
	ALEWarning = { fg = dark_yellow, bold = true },
	ALEWarningSign = { fg = dark_yellow, bold = true },
	-- ccc.nvim
	CccFloatNormal = { link = "NormalFloat" },
	CccFloatBorder = { link = "FloatBorder" },
	-- CSS
	cssClassName = { link = "Keyword" },
	cssColor = { link = "Number" },
	cssIdentifier = { link = "Keyword" },
	cssImportant = { link = "Keyword" },
	cssProp = { link = "Identifier" },
	cssTagName = { link = "Keyword" },
	cssCustomProp = { fg = purple },
	cssPseudoClass = { fg = orange, bold = true },
	cssPseudoClassId = { link = "cssPseudoClass" },
	["@tag.css"] = { link = "cssIdentifier" },
	["@type.css"] = { link = "cssClassName" },
	["@variable.css"] = { link = "cssCustomProp" },
	["@constant.css"] = { link = "cssTagName" },
	-- Diffs
	DiffAdd = { bg = light_green },
	DiffChange = { bg = highlight },
	DiffDelete = { fg = red },
	DiffText = { bg = light_yellow },
	diffAdded = { link = "DiffAdd" },
	diffChanged = { link = "DiffChange" },
	diffFile = { fg = lfg, bold = true },
	diffLine = { fg = p_string },
	diffRemoved = { link = "DiffDelete" },
	-- Dot/Graphviz
	dotKeyChar = { link = "Operator" },
	-- diffview.nvim
	DiffviewCursorLine = { bold = true, bg = pitch_black },
	DiffviewDiffAddAsDelete = { bg = light_red },
	DiffviewDiffDelete = { fg = pitch_black },
	DiffviewDiffDeleteDim = { fg = pitch_black },
	DiffviewFilePanelFileName = { fg = lfg },
	DiffviewFilePanelPath = { fg = purple },
	DiffviewFilePanelRootPath = { fg = purple },
	DiffviewFilePanelTitle = { fg = lfg, bold = true },
	DiffviewFilePanelInsertions = { fg = green },
	DiffviewFilePanelDeletions = { fg = red },
	DiffviewStatusModified = { fg = dark_yellow, bold = true },
	DiffviewStatusAdded = { fg = green, bold = true },
	DiffviewStatusCopied = { fg = green, bold = true },
	DiffviewStatusDeleted = { fg = red, bold = true },
	-- Eyeliner
	EyelinerPrimary = { fg = red, bold = true },
	EyelinerSecondary = { fg = dark_yellow, bold = true },
	EyelinerDimmed = { link = "Comment" },
	-- Flash
	FlashBackdrop = { link = "None" },
	FlashLabel = { fg = lfg, bold = true, bg = yellow },
	FlashPromptIcon = { bold = true },
	-- Fugitive
	FugitiveblameHash = { fg = purple },
	FugitiveblameTime = { fg = blue },
	gitCommitOverflow = { link = "ErrorMsg" },
	gitCommitSummary = { link = "String" },
	-- gitcommit
	["@string.special.url.gitcommit"] = { fg = lfg },
	["@markup.link.gitcommit"] = { fg = green, bold = true },
	["@comment.warning.gitcommit"] = { fg = red, bold = true },
	-- Gitsigns
	GitSignsAdd = { fg = border },
	GitSignsDelete = { fg = border },
	GitSignsChange = { fg = border },
	GitSignsStagedAdd = { fg = grey },
	GitSignsStagedDelete = { fg = grey },
	GitSignsStagedChange = { fg = grey },
	-- HAML
	hamlClass = { fg = lfg },
	hamlDocType = { link = "Comment" },
	hamlId = { fg = lfg },
	hamlTag = { fg = lfg, bold = true },
	-- hop.nvim
	HopNextKey = { fg = lfg, bold = true, bg = yellow },
	HopNextKey1 = { bg = light_yellow },
	HopNextKey2 = { bg = light_yellow },
	HopUnmatched = {},
	-- HTML
	htmlArg = { link = "Identifier" },
	htmlLink = { link = "Directory" },
	htmlScriptTag = { link = "htmlTag" },
	htmlSpecialTagName = { link = "htmlTag" },
	htmlTag = { fg = lfg, bold = true },
	htmlTagName = { link = "htmlTag" },
	htmlItalic = { italic = true },
	htmlBold = { bold = true },
	-- Inko
	inkoCommentBold = { fg = grey, bold = true },
	inkoCommentInlineUrl = { link = "Number" },
	inkoCommentItalic = { fg = grey, italic = true },
	inkoCommentTitle = { fg = grey, bold = true },
	inkoInstanceVariable = { link = "InstanceVariable" },
	inkoKeywordArgument = { link = "Regexp" },
	["@variable.member.inko"] = { link = "InstanceVariable" },
	["@constant.builtin.inko"] = { link = "Keyword" },
	-- Java
	javaAnnotation = { link = "Directory" },
	javaCommentTitle = { link = "javaComment" },
	javaDocParam = { link = "Todo" },
	javaDocTags = { link = "Todo" },
	javaExternal = { link = "Keyword" },
	javaStorageClass = { link = "Keyword" },
	-- Javascript
	JavaScriptNumber = { link = "Number" },
	javaScriptBraces = { link = "Operator" },
	javaScriptFunction = { link = "Keyword" },
	javaScriptIdentifier = { link = "Keyword" },
	javaScriptMember = { link = "Identifier" },
	-- JSON
	jsonKeyword = { link = "String" },
	-- Lua
	luaFunction = { link = "Keyword" },
	-- LSP
	DiagnosticUnderlineError = { underline = true, sp = red },
	DiagnosticUnderlineWarn = { underline = true, sp = dark_yellow },
	LspDiagnosticsUnderlineError = { link = "DiagnosticUnderlineError" },
	LspDiagnosticsUnderlineWarning = { link = "DiagnosticUnderlineWarn" },
	LspReferenceTarget = {},
	DiagnosticFloatingError = { fg = red, bold = true },
	DiagnosticFloatingHint = { fg = lfg, bold = true },
	DiagnosticFloatingInfo = { fg = blue, bold = true },
	DiagnosticFloatingWarn = { fg = dark_yellow, bold = true },
	DiagnosticError = { fg = red, bold = true },
	DiagnosticHint = { fg = grey, bold = true },
	DiagnosticInfo = { fg = blue, bold = true },
	DiagnosticWarn = { fg = dark_yellow, bold = true },
	DiagnosticDeprecated = {},
	-- Make
	makeTarget = { link = "Function" },
	-- Markdown
	markdownCode = { link = "markdownCodeBlock" },
	markdownCodeBlock = { link = "Comment" },
	markdownListMarker = { link = "Keyword" },
	markdownOrderedListMarker = { link = "Keyword" },
	markdownUrl = { fg = blue },
	-- mini.diff
	MiniDiffSignAdd = { fg = border },
	MiniDiffSignDelete = { fg = border },
	MiniDiffSignChange = { fg = border },
	-- mini.icons
	MiniIconsAzure = { fg = blue },
	MiniIconsBlue = { fg = blue },
	MiniIconsCyan = { fg = cyan },
	MiniIconsGreen = { fg = green },
	MiniIconsGrey = { fg = grey },
	MiniIconsOrange = { fg = orange },
	MiniIconsPurple = { fg = purple },
	MiniIconsRed = { fg = red },
	MiniIconsYellow = { fg = dark_yellow },
	-- mini.jump2d
	MiniJump2dSpot = { fg = red, bold = true },
	MiniJump2dSpotAhead = { fg = red, bold = true },
	-- mini.pick
	MiniPickBorder = { fg = border },
	MiniPickBorderBusy = { link = "MiniPickBorder" },
	MiniPickBorderText = { link = "Comment" },
	MiniPickHeader = { fg = lfg, bold = true },
	MiniPickMatchCurrent = { bg = pitch_black, bold = true },
	MiniPickMatchRanges = { fg = dark_yellow, bold = true },
	MiniPickNormal = { fg = lfg },
	MiniPickPrompt = { fg = lfg },
	MiniPickMatchMarked = { bold = true },
	MiniStatuslineModeNormal = { fg = white, bg = red },
	MiniStatusLineModeInsert = { fg = white, bg = blue },
	MiniStatuslineModeCommand = { fg = white, bg = red },
	MiniStatuslineFilename = { fg = white, bg = green },
	MiniStatuslineFileinfo = { fg = lfg, bg = lbg },
	-- Rust
	rustCommentBlockDoc = { link = "Comment" },
	rustCommentLineDoc = { link = "Comment" },
	rustFuncCall = { link = "Identifier" },
	rustModPath = { link = "Identifier" },
	["@function.macro.rust"] = { link = "Macro" },
	["@attribute.rust"] = { link = "Identifier" },
	-- pounce.nvim
	PounceAccept = { fg = lfg, bg = yellow, bold = true },
	PounceAcceptBest = { link = "PounceAccept" },
	PounceMatch = { bg = light_yellow },
	PounceUnmatched = {},
	PounceGap = { link = "None" },
	-- Python
	pythonOperator = { link = "Keyword" },
	-- SASS
	sassClass = { link = "cssClassName" },
	sassId = { link = "cssIdentifier" },
	-- Shell
	shFunctionKey = { link = "Keyword" },
	-- Snippy
	SnippyPlaceholder = { link = "SnippetTabstop" },
	-- SQL
	sqlKeyword = { link = "Keyword" },
	-- Typescript
	typescriptBraces = { link = "Operator" },
	typescriptEndColons = { link = "Operator" },
	typescriptExceptions = { link = "Keyword" },
	typescriptFuncKeyword = { link = "Keyword" },
	typescriptFunction = { link = "Function" },
	typescriptIdentifier = { link = "Identifier" },
	typescriptLogicSymbols = { link = "Operator" },
	-- Telescope
	TelescopeBorder = { fg = border },
	TelescopeMatching = { fg = p_keyword, bold = true },
	TelescopePromptNormal = { fg = lfg },
	TelescopePromptBorder = { fg = border },
	TelescopePromptPrefix = { fg = lfg, bold = true },
	TelescopeSelection = { bg = p_keyword.li(30), bold = true },
	TelescopeTitle = { fg = lfg, bold = true },
	TelescopeNormal = { fg = lfg },
	-- Treesitter
	-- Treesitter
	["@markup.link"] = { fg = blue },
	["@property.json"] = { bold = true },
	["@text.emphasis"] = { italic = true },
	["@text.reference"] = { fg = p_string },
	["@text.strong"] = { bold = true },
	["@text.uri"] = { fg = blue },
	["@variable"] = { fg = p_variable },
	["@variable.member"] = { fg = p_variable },
	["@property"] = { fg = p_variable },
	["@punctuation"] = { fg = lfg },
	["@variable.builtin"] = { bold = true },
	["@string"] = { fg = p_string, bold = false },
	["@string.escape"] = { fg = p_number.da(20), bold = false },
	["@string.regexp"] = { link = "Regexp" },
	["@constant"] = { fg = p_constant, bold = true },
	["@constant.builtin"] = { fg = p_number, bold = true },
	["@number"] = { fg = p_number, bold = true },
	["@variable.parameter"] = { fg = p_parameter, bold = true },
	["@operator"] = { fg = p_operator },
	["@type"] = { fg = p_type, bold = true },
	["@type.builtin"] = { fg = p_type, bold = true },
	["@keyword"] = { fg = p_keyword, bold = true },
	["@function"] = { fg = p_function, bold = true },
	-- ["@function.call"] = { fg = p_function },
	-- Custom Tree-sitter captures added by this theme.
	["@variable.parameter.reference"] = { fg = orange },
	-- org mode basic
	["@org.headline.level1"] = { fg = p_string },
	["@org.headline.level2"] = { fg = p_constant },
	["@org.headline.level3"] = { fg = p_function },
	["@org.headline.level4"] = { fg = p_parameter },
	["@org.headline.level5"] = { fg = p_number },
	["@org.tag"] = { fg = p_parameter },
	["@org.hyperlink"] = { fg = p_function },
	["@org.hyperlink.url"] = { fg = p_function },
	["@org.hyperlink.desc"] = { fg = p_function },
}

---@diagnostic disable: undefined-global
local theme = lush(function()
	return {
		-- Vim internals
		Normal({ bg = lush_bg, fg = lush_fg }),
		CursorLine({ bg = Normal.bg.da(18) }), -- lighten() can also be called via li()
		Visual({ fg = Normal.bg, bg = Normal.fg }), -- Try pressing v and selecting some text
		Comment({ fg = p_comment }),
		Keyword({ fg = p_keyword }),
		Number = { fg = p_function },
		String({ fg = p_string }),
		Function({ fg = p_function }),
		-- CursorColumn({ CursorLine }),
		OkMsg({ fg = hsl(159, 100, 30) }),
		WarningMsg({ fg = hsl(28, 64, 37) }),
		ErrorMsg({ fg = hsl(0, 100, 50) }),
		LineNr({ Comment, gui = "italic" }),
		LineNrBelow({ LineNr }),
		LineNrAbove({ LineNr }),
		-- CursorLineNr({ LineNr, fg = CursorLine.bg.mix(Normal.fg, 64) }),
		search_base({ bg = hsl(52, 52, 52), fg = hsl(52, 10, 10) }),
		Search({ search_base }),
		IncSearch({ bg = search_base.bg.ro(-20), fg = search_base.fg.da(90) }),
	}
end)

local norm_lush_theme = {}

for k, v in pairs(theme) do
	-- print("K:", k)
	-- print("V:", v)
	local t = {}
	for kk, vv in pairs(v) do
		-- print("KKKK:", kk)
		-- print("VVVV:", vv)
		t[tostring(kk)] = tostring(vv)
	end
	norm_lush_theme[tostring(k)] = t
end

-- print("111111111")
-- print(vim.inspect(base))
-- print(vim.inspect(theme))
-- print(vim.inspect(norm_lush_theme))
for k, v in pairs(norm_lush_theme) do
	base[k] = v
end

return base
