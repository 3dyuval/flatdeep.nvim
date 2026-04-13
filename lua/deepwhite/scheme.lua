local M = {}

local function style(base, style_opts)
	return vim.tbl_extend("force", base or {}, style_opts or {})
end

function M.get_groups(c)
	return {
		Normal = { fg = c.base1, bg = "NONE" },
		NormalFloat = { link = "Normal" },
		NonText = { fg = c.base3 },

		SpecialKey = { fg = c.cyan },
		Directory = { link = "SpecialKey" },

		Title = { fg = c.base0, bold = true },

		IncSearch = { fg = c.base7, bg = c.pink },
		Search = { fg = c.base7, bg = c.pink },
		CurSearch = { fg = c.base7, bg = c.pink },

		LineNr = { fg = c.base2 },
		CursorLineNr = { fg = c.base2 },

		Question = { fg = c.purple, bg = c.light_purple },

		StatusLine = { fg = c.base7, bg = c.base0 },
		StatusLineNC = { fg = c.base2 },

		TabLine = { link = "Normal" },
		TabLineSel = { reverse = true },

		WinSeparator = { fg = c.base0 },

		SignColumn = { link = "LineNr" },
		FoldColumn = { link = "SignColumn" },

		Conceal = { fg = c.base5 },
		SpellBad = { fg = c.red, undercurl = true },
		SpellCap = { fg = c.yellow },
		SpellLocal = { fg = c.yellow },
		SpellRare = { fg = c.yellow },

		Pmenu = { fg = c.base1, bg = c.base4 },
		PmenuSel = { fg = c.base1, bg = c.base5 },
		PmenuSbar = { bg = c.base4 },
		PmenuThumb = { bg = c.base3 },

		WildMenu = { fg = c.base1, bg = c.base4 },
		Visual = { bg = c.base4 },
		VisualNOS = { fg = c.base4 },
		Folded = { fg = c.base2 },

		Cursor = { reverse = true },
		TermCursor = { link = "Cursor" },
		CursorLine = { bg = "NONE" },
		CursorColumn = { bg = c.base4 },

		ColorColumn = { bg = c.base4 },

		MoreMsg = { fg = c.green, bg = c.light_green },
		ModeMsg = { bold = true },
		ErrorMsg = { fg = c.red, bg = c.light_red },
		WarningMsg = { fg = c.yellow },

		DiffAdd = { fg = c.green, bg = c.light_green },
		DiffChange = { fg = c.orange, bg = c.light_orange },
		DiffDelete = { fg = c.red, bg = c.light_red },

		Comment = { fg = c.yellow, italic = true },
		SpecialComment = { fg = c.base2, italic = true },
		Constant = { fg = c.green, bg = c.light_green },
		String = { fg = c.green, bg = c.light_green },
		Character = { fg = c.green, bg = c.light_green },
		Number = { fg = c.green, bg = c.light_green },
		Boolean = { fg = c.green, bg = c.light_green },
		Float = { fg = c.green, bg = c.light_green },
		Identifier = { fg = c.base1 },
		Delimiter = { link = "Identifier" },
		Statement = { fg = c.orange, bg = c.light_orange },
		Conditional = { fg = c.purple, bg = c.light_purple },
		Repeat = { fg = c.purple, bg = c.light_purple },
		Keyword = { fg = c.purple, bg = c.light_purple },
		Operator = { fg = c.purple, bg = c.light_purple },
		Exception = { fg = c.purple, bg = c.light_purple },
		Label = { fg = c.green, bg = c.light_green },
		PreProc = { fg = c.purple, bg = c.light_purple },
		Define = { fg = c.purple, bg = c.light_purple },
		Include = { fg = c.purple, bg = c.light_purple },
		Macro = { fg = c.base1, bold = true },
		Type = { fg = c.green, bg = c.light_green },
		Typedef = { fg = c.yellow },
		Structure = { fg = c.purple, bg = c.light_purple },
		StorageClass = { fg = c.purple, bg = c.light_purple },
		Special = { fg = c.green, bg = c.light_green },
		Function = { fg = c.base1, bold = true },
		Underlined = { underline = true },
		Ignore = { fg = c.base7 },
		Error = { fg = c.red, bg = c.light_red },
		Todo = { fg = c.blue, bg = c.light_blue, bold = true, italic = true },

		MatchParen = { fg = c.base7, bg = c.blue },

		-- Plugins
		-- Lspsaga
		RenameNormal = { link = "Normal" },

		-- Treesitter
		["@punctuation.delimiter"] = { fg = c.base1 },
		["@punctuation.bracket"] = { fg = c.base1 },
		["@punctuation.special"] = { fg = c.base1 },

		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = c.base1, italic = true },
		["@variable.parameter"] = { fg = c.orange, bg = c.light_orange },
		["@variable.member"] = { link = "Identifier" },

		["@constant"] = { fg = c.green, bg = c.light_green },
		["@constant.builtin"] = { fg = c.green, bg = c.light_green },
		["@constant.macro"] = { fg = c.green, bg = c.light_green },

		["@module"] = { link = "Include" },
		["@module.builtin"] = { link = "Include" },
		["@namespace"] = { fg = c.base1 },
		["@label"] = { fg = c.green, bg = c.light_green },
		["@symbol"] = { fg = c.base1 },

		["@string"] = { fg = c.green, bg = c.light_green },
		["@string.documentation"] = { link = "String" },
		["@string.regexp"] = { fg = c.red, bg = c.light_red },
		["@string.escape"] = { fg = c.blue, bg = c.light_blue },
		["@string.special"] = { link = "Special" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.path"] = { link = "Underlined" },
		["@string.special.url"] = { link = "Underlined" },

		["@character"] = { fg = c.green, bg = c.light_green },
		["@character.special"] = { link = "Special" },

		["@boolean"] = { fg = c.green, bg = c.light_green },
		["@number"] = { fg = c.green, bg = c.light_green },
		["@number.float"] = { fg = c.green, bg = c.light_green },

		["@type"] = { fg = c.green, bg = c.light_green },
		["@type.builtin"] = { fg = c.green, bg = c.light_green },
		["@type.qualifier"] = { fg = c.purple, bg = c.light_purple },
		["@type.definition"] = { link = "Typedef" },

		["@attribute"] = { fg = c.blue, bg = c.light_blue },
		["@annotation"] = { fg = c.blue, bg = c.light_blue },
		["@property"] = { fg = c.base1 },
		["@field"] = { fg = c.base1, bg = c.base7 },

		["@function"] = { fg = c.base1, bold = true },
		["@function.builtin"] = { fg = c.base1, bold = true },
		["@function.call"] = { link = "Special" },
		["@function.macro"] = { fg = c.base1, bold = true },
		["@function.method"] = { fg = c.base1, bold = true },
		["@function.method.call"] = { link = "@function.call" },
		["@method"] = { fg = c.base1, bold = true },

		["@constructor"] = { fg = c.base1 },
		["@operator"] = { fg = c.purple, bg = c.light_purple },

		["@keyword"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.function"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.operator"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.import"] = { link = "Include" },
		["@keyword.storage"] = { link = "Keyword" },
		["@keyword.repeat"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.return"] = { link = "Keyword" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { fg = c.purple, bg = c.light_purple },

		["@keyword.conditional"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.conditional.ternary"] = { fg = c.purple, bg = c.light_purple },
		["@keyword.directive"] = { link = "PreProc" },
		["@keyword.directive.define"] = { link = "PreProc" },

		["@comment"] = { fg = c.yellow, italic = true },
		["@comment.documentation"] = { link = "Comment" },

		["@comment.warning"] = { link = "WarningMsg" },
		["@comment.error"] = { link = "Error" },
		["@comment.todo"] = { link = "Todo" },
		["@comment.note"] = { link = "SpecialComment" },

		["@markup.strong"] = { bold = true },
		["@markup.emphasis"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strike"] = { strikethrough = true },

		["@markup.heading"] = { link = "Title" },
		["@markup.heading.gitcommit"] = { link = "@spell" },

		["@markup.quote"] = { link = "Comment" },
		["@markup.math"] = { link = "Special" },
		["@markup.environment"] = { link = "Macro" },

		["@markup.link"] = { link = "Underlined" },
		["@markup.link.label"] = { link = "Special" },
		["@markup.link.url"] = { link = "Keyword" },

		["@markup.raw"] = { link = "SpecialComment" },
		["@markup.raw.block"] = {},

		["@markup.list"] = { link = "Identifier" },
		["@markup.list.checked"] = { link = "Comment" },
		["@markup.list.unchecked"] = { link = "Identifier" },

		["@tag"] = { fg = c.purple, bg = c.light_purple },
		["@tag.delimiter"] = { fg = c.base2, bg = c.base7 },
		["@tag.attribute"] = { fg = c.base2, bg = c.base7, italic = true },

		["@text"] = { fg = c.orange, bg = c.light_orange },
		["@text.strong"] = { fg = c.orange, bg = c.light_orange, bold = true },
		["@text.emphasis"] = { fg = c.orange, bg = c.light_orange, italic = true },
		["@text.underline"] = { fg = c.orange, bg = c.light_orange, underline = true },
		["@text.title"] = { fg = c.purple, bg = c.light_purple, bold = true },
		["@text.literal"] = { fg = c.orange, bg = c.light_orange },
		["@text.uri"] = { fg = c.blue, bg = c.light_blue, italic = true },
		["@text.reference"] = { fg = c.orange, bg = c.light_orange, bold = true },

		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },

		-- LSP Diagnostics
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.cyan },
		DiagnosticHint = { fg = c.cyan },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.cyan },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.cyan },
		-- LSP Semantic Highlighting
		["@lsp.type.class"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.struct"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.enum"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.enumMember"] = { fg = c.purple, bg = c.light_purple },
		["@lsp.type.event"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.interface"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.decorator"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.typeParameter"] = { fg = c.green, bg = c.light_green },
		["@lsp.type.modifier"] = { fg = c.green, bg = c.light_green },

		-- rainbow
		TSRainbowRed = { fg = c.red },
		TSRainbowOrange = { fg = c.orange },
		TSRainbowYellow = { fg = c.yellow },
		TSRainbowGreen = { fg = c.green },
		TSRainbowCyan = { fg = c.cyan },
		TSRainbowBlue = { fg = c.blue },
		TSRainbowViolet = { fg = c.purple },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = c.red },
		RainbowDelimiterYellow = { fg = c.yellow },
		RainbowDelimiterBlue = { fg = c.blue },
		RainbowDelimiterOrange = { fg = c.orange },
		RainbowDelimiterGreen = { fg = c.green },
		RainbowDelimiterViolet = { fg = c.purple },
		RainbowDelimiterCyan = { fg = c.cyan },

		-- nvim-notify
		NotifyERRORBorder = { fg = c.base0 },
		NotifyWARNBorder = { fg = c.base0 },
		NotifyINFOBorder = { fg = c.base0 },
		NotifyDEBUGBorder = { fg = c.base0 },
		NotifyTRACEBorder = { fg = c.base0 },
		NotifyERRORTitle = { fg = c.red },
		NotifyWARNTitle = { fg = c.orange },
		NotifyINFOTitle = { fg = c.green },
		NotifyDEBUGTitle = { fg = c.blue },
		NotifyTRACETitle = { fg = c.purple },
		NotifyERRORIcon = { link = "NotifyERRORTitle" },
		NotifyWARNIcon = { link = "NotifyWARNTitle" },
		NotifyINFOIcon = { link = "NotifyINFOTitle" },
		NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
		NotifyTRACEIcon = { link = "NotifyTRACETitle" },

		-- nvim-cmp
		CmpItemAbbr = { link = "Comment" },
		CmpItemAbbrDeprecated = { link = "Visual" },
		CmpItemAbbrMatch = { link = "Identifier" },
		CmpItemAbbrMatchFuzzy = { link = "CmpItemAbbrMatch" },

		CmpItemKindText = { fg = c.base0 },
		CmpItemKindSnippet = { fg = c.base2 },
		CmpItemKindConstant = { fg = c.blue },
		CmpItemKindVariable = { fg = c.blue },
		CmpItemKindKeyword = { fg = c.orange },
		CmpItemKindMethod = { fg = c.purple },
		CmpItemKindFunction = { link = "CmpItemKindMethod" },
		CmpItemKindConstructor = { link = "CmpItemKindMethod" },
		CmpItemKindClass = { fg = c.pink },
		CmpItemKindInterface = { link = "CmpItemKindClass" },
		CmpItemKindModule = { link = "CmpItemKindClass" },
		CmpItemKindStruct = { link = "CmpItemKindClass" },

		-- mini.deps
		MiniDepsChangeAdded = { fg = c.green },
		MiniDepsChangeRemoved = { fg = c.orange },
		MiniDepsHint = { fg = c.base3 },
		MiniDepsInfo = { fg = c.base0 },
		MiniDepsTitle = { fg = c.base0, bold = true },
		MiniDepsTitleError = { fg = c.red, bold = true },
		MiniDepsTitleSame = { fg = c.blue, bold = true },
		MiniDepsTitleUpdate = { fg = c.green, bold = true },

		-- mini.diff
		MiniDiffSignAdd = { bg = c.light_green },
		MiniDiffSignChange = { bg = c.light_orange },
		MiniDiffSignDelete = { bg = c.light_red },
		MiniDiffOverAdd = { bg = c.light_green },
		MiniDiffOverChange = { bg = c.light_orange },
		MiniDiffOverContext = { bg = c.light_cyan },
		MiniDiffOverDelete = { bg = c.light_red },

		-- mini.files
		MiniFilesBorder = { link = "WinSeparator" }, -- border of regular windows.
		MiniFilesBorderModified = { link = "DiffChange" }, -- border of windows showing modified buffer.
		MiniFilesDirectory = { link = "SpecialKey" }, -- text and icon representing directory.
		MiniFilesFile = { link = "Identifier" }, -- text representing file.
		MiniFilesNormal = { link = "Normal" }, -- basic foreground/background highlighting.
		MiniFilesTitle = { link = "Comment" }, -- title of regular windows.
		MiniFilesTitleFocused = { link = "PreProc" }, -- title of focused window.

		-- mini.jump2d
		MiniJump2dSpot = { fg = c.red, bold = true },
		MiniJump2dSpotAhead = { fg = c.orange },

		-- mini.statusline
		MiniStatuslineModeNormal = { bg = c.light_purple },
		MiniStatuslineModeInsert = { bg = c.light_green },
		MiniStatuslineModeVisual = { bg = c.light_cyan },
		MiniStatuslineModeReplace = { bg = c.light_orange },
		MiniStatuslineModeCommand = { bg = c.light_red },
		MiniStatuslineModeOther = { bg = c.light_blue },
		MiniStatuslineInactive = { fg = c.base3 },

		-- mini.starter
		MiniStarterHeader = { fg = c.base0 },
		MiniStarterFooter = { fg = c.base3 },
		MiniStarterItemPrefix = { fg = c.red },

		-- mini.tabline
		MiniTablineCurrent = { fg = c.base7, bg = c.base0 },
		MiniTablineVisible = { link = "MiniTablineCurrent" },
		MiniTablineHidden = { fg = c.base0, bg = c.base7 },
		MiniTablineModifiedCurrent = { fg = c.orange, bg = c.base0 },
		MiniTablineModifiedVisible = { link = "MiniTablineModifiedCurrent" },
		MiniTablineModifiedHidden = { fg = c.orange, bg = c.base7 },

		-- barbar
		BufferCurrent = { link = "TabLineSel" },
		BufferCurrentIndex = { link = "TabLineSel" },
		BufferCurrentMod = { fg = c.orange },
		BufferCurrentSign = { fg = c.base7 },
		BufferCurrentTarget = { fg = c.red },
		BufferInactive = { link = "TabLine" },
		BufferInactiveIndex = { link = "TabLine" },
		BufferInactiveMod = { link = "BufferCurrentMod" },
		BufferInactiveSign = { link = "BufferCurrentSign" },
		BufferInactiveTarget = { link = "BufferCurrentTarget" },
		BufferVisible = { link = "BufferInactive" },
		BufferVisibleIndex = { link = "BufferInactiveIndex" },
		BufferVisibleMod = { link = "BufferInactiveMod" },
		BufferVisibleSign = { link = "BufferInactiveSign" },
		BufferVisibleTarget = { link = "BufferInactiveTarget" },
		BufferTabpages = { link = "TabLine" },
		BufferTabpageFill = { link = "TabLine" },
		BufferOffset = { link = "TabLineSel" },
		BufferScrollArrow = { link = "TabLineSel" },

		-- noice.nvim
		NoiceCmdlinePopupTitle = { fg = c.base0, bold = true },
		NoiceCmdlinePopupBorder = { fg = c.base0 },

		-- Neogit
		NeogitDiffAdd = { bg = c.light_green },
		NeogitDiffAddHighlight = { link = "NeogitDiffAdd" },
		NeogitDiffDelete = { bg = c.light_red },
		NeogitDiffDeleteHighlight = { link = "NeogitDiffDelete" },
		NeogitHunkHeader = { link = "NeogitHunkHeaderHighlight" },

		-- Diffview
		DiffviewDiffAdd = { bg = c.light_green },
		DiffviewDiffDelete = { bg = c.light_red },
		DiffviewDiffChange = { bg = c.light_orange },

		-- modicator.nvim
		NormalMode = { link = "Normal" },
		InsertMode = { bold = True },
		VisualMode = { link = "Visual" },
		CommandMode = { link = "NormalMode" },
		ReplaceMode = { fg = c.red },
		SelectMode = { link = "VisualMode" },
		TerminalMode = { link = "NormalMode" },
		TerminalNormalMode = { link = "NormalMode" },

		-- rcarriga/nvim-dap-ui
		DapUIVariable = { link = 'Normal' },
		DapUIValue = { link = 'Normal' },
		DapUIFrameName = { link = 'Normal' },
		DapUIThread = { fg = c.orange },
		DapUIWatchesValue = { link = 'DapUIThread' },
		DapUIBreakpointsInfo = { link = 'DapUIThread' },
		DapUIBreakpointsCurrentLine = { fg = c.orange, bold = True },
		DapUIWatchesError = { link = 'DapUIWatchesEmpty' },
		DapUIBreakpointsDisabledLine = { fg = c.muted },
		DapUISource = { fg = c.iris },
		DapUIBreakpointsPath = { fg = c.cyan },
		DapUIScope = { link = 'DapUIBreakpointsPath' },
		DapUILineNumber = { link = 'DapUIBreakpointsPath' },
		DapUIBreakpointsLine = { link = 'DapUIBreakpointsPath' },
		DapUIFloatBorder = { link = 'DapUIBreakpointsPath' },
		DapUIStoppedThread = { link = 'DapUIBreakpointsPath' },
		DapUIDecoration = { link = 'DapUIBreakpointsPath' },
		DapUIModifiedValue = { fg = c.cyan, bold = True },
	}
end

return M
