local M = {}

local function style(base, style_opts)
	return vim.tbl_extend("force", base or {}, style_opts or {})
end

function M.get_groups(c)
	return {
		Normal = { fg = c.fg, bg = "NONE" },
		NormalFloat = { link = "Normal" },
		NonText = { fg = c.fg_muted },

		SpecialKey = { fg = c.green_pastel },
		Directory = { link = "SpecialKey" },

		Title = { fg = c.bg_darkest, bold = true },

		IncSearch = { fg = c.white, bg = c.pastel_purple },
		Search = { fg = c.white, bg = c.pastel_purple },
		CurSearch = { fg = c.white, bg = c.pastel_purple },

		LineNr = { fg = c.fg_line_nr },
		CursorLineNr = { fg = c.fg_line_nr },

		Question = { fg = c.purple, bg = c.pastel_purple },

		StatusLine = { fg = c.white, bg = c.bg_darkest },
		StatusLineNC = { fg = c.fg_muted },

		TabLine = { link = "Normal" },
		TabLineSel = { reverse = true },

		WinSeparator = { fg = c.bg_darkest },

		SignColumn = { link = "LineNr" },
		FoldColumn = { link = "SignColumn" },

		Conceal = { fg = c.fg },
		SpellBad = { fg = c.red, undercurl = true },
		SpellCap = { fg = c.yellow },
		SpellLocal = { fg = c.yellow },
		SpellRare = { fg = c.yellow },

		Pmenu = { fg = c.fg, bg = c.bg_highlight },
		PmenuSel = { fg = c.fg, bg = c.bg_visual },
		PmenuSbar = { bg = c.bg_highlight },
		PmenuThumb = { bg = c.fg_muted },

		WildMenu = { fg = c.fg, bg = c.bg_highlight },
		Visual = { bg = c.bg_highlight },
		VisualNOS = { fg = c.bg_visual },
		Folded = { fg = c.fg_muted },

		Cursor = { reverse = true },
		TermCursor = { link = "Cursor" },
		CursorLine = { bg = c.bg_cursor_line },
		CursorColumn = { bg = c.bg_highlight },

		ColorColumn = { bg = c.bg_highlight },

		MoreMsg = { fg = c.green, bg = c.pastel_green },
		ModeMsg = { bold = true },
		ErrorMsg = { fg = c.red, bg = c.pastel_red },
		WarningMsg = { fg = c.yellow },

		DiffAdd = { fg = c.green, bg = c.pastel_green },
		DiffChange = { fg = c.yellow_dark, bg = c.pastel_yellow },
		DiffDelete = { fg = c.red, bg = c.pastel_red },

		Comment = { fg = c.yellow, italic = true },
		SpecialComment = { fg = c.fg_muted, italic = true },
		Constant = { fg = c.green, bg = c.pastel_green },
		String = { fg = c.green, bg = c.pastel_green },
		Character = { fg = c.green, bg = c.pastel_green },
		Number = { fg = c.green, bg = c.pastel_green },
		Boolean = { fg = c.green, bg = c.pastel_green },
		Float = { fg = c.green, bg = c.pastel_green },
		Identifier = { fg = c.fg },
		Delimiter = { link = "Identifier" },
		Statement = { fg = c.yellow_dark, bg = c.pastel_yellow },
		Conditional = { fg = c.purple, bg = c.pastel_purple },
		Repeat = { fg = c.purple, bg = c.pastel_purple },
		Keyword = { fg = c.purple, bg = c.pastel_purple },
		Operator = { fg = c.purple, bg = c.pastel_purple },
		Exception = { fg = c.purple, bg = c.pastel_purple },
		Label = { fg = c.green, bg = c.pastel_green },
		PreProc = { fg = c.purple, bg = c.pastel_purple },
		Define = { fg = c.purple, bg = c.pastel_purple },
		Include = { fg = c.purple, bg = c.pastel_purple },
		Macro = { fg = c.fg, bold = true },
		Type = { fg = c.green, bg = c.pastel_green },
		Typedef = { fg = c.yellow },
		Structure = { fg = c.purple, bg = c.pastel_purple },
		StorageClass = { fg = c.purple, bg = c.pastel_purple },
		Special = { fg = c.green, bg = c.pastel_green },
		Function = { fg = c.fg, bold = true },
		Underlined = { underline = true },
		Ignore = { fg = c.white },
		Error = { fg = c.red, bg = c.pastel_red },
		Todo = { fg = c.blue, bg = c.pastel_blue, bold = true, italic = true },

		MatchParen = { fg = c.white, bg = c.blue },

		-- Plugins
		-- Lspsaga
		RenameNormal = { link = "Normal" },

		-- Treesitter
		["@punctuation.delimiter"] = { fg = c.fg },
		["@punctuation.bracket"] = { fg = c.fg },
		["@punctuation.special"] = { fg = c.fg },

		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = c.fg, italic = true },
		["@variable.parameter"] = { fg = c.yellow_dark, bg = c.pastel_yellow },
		["@variable.member"] = { link = "Identifier" },

		["@constant"] = { fg = c.green, bg = c.pastel_green },
		["@constant.builtin"] = { fg = c.green, bg = c.pastel_green },
		["@constant.macro"] = { fg = c.green, bg = c.pastel_green },

		["@module"] = { link = "Include" },
		["@module.builtin"] = { link = "Include" },
		["@namespace"] = { fg = c.fg },
		["@label"] = { fg = c.green, bg = c.pastel_green },
		["@symbol"] = { fg = c.fg },

		["@string"] = { fg = c.green, bg = c.pastel_green },
		["@string.documentation"] = { link = "String" },
		["@string.regexp"] = { fg = c.red, bg = c.pastel_red },
		["@string.escape"] = { fg = c.blue, bg = c.pastel_blue },
		["@string.special"] = { link = "Special" },
		["@string.special.symbol"] = { link = "Identifier" },
		["@string.special.path"] = { link = "Underlined" },
		["@string.special.url"] = { link = "Underlined" },

		["@character"] = { fg = c.green, bg = c.pastel_green },
		["@character.special"] = { link = "Special" },

		["@boolean"] = { fg = c.green, bg = c.pastel_green },
		["@number"] = { fg = c.green, bg = c.pastel_green },
		["@number.float"] = { fg = c.green, bg = c.pastel_green },

		["@type"] = { fg = c.green, bg = c.pastel_green },
		["@type.builtin"] = { fg = c.green, bg = c.pastel_green },
		["@type.qualifier"] = { fg = c.purple, bg = c.pastel_purple },
		["@type.definition"] = { link = "Typedef" },

		["@attribute"] = { fg = c.blue, bg = c.pastel_blue },
		["@annotation"] = { fg = c.blue, bg = c.pastel_blue },
		["@property"] = { fg = c.fg },
		["@field"] = { fg = c.fg, bg = c.white },

		["@function"] = { fg = c.fg, bold = true },
		["@function.builtin"] = { fg = c.fg, bold = true },
		["@function.call"] = { link = "Special" },
		["@function.macro"] = { fg = c.fg, bold = true },
		["@function.method"] = { fg = c.fg, bold = true },
		["@function.method.call"] = { link = "@function.call" },
		["@method"] = { fg = c.fg, bold = true },

		["@constructor"] = { fg = c.fg },
		["@operator"] = { fg = c.purple, bg = c.pastel_purple },

		["@keyword"] = { fg = c.purple, bg = c.pastel_purple },
		["@keyword.coroutine"] = { link = "Keyword" },
		["@keyword.function"] = { fg = c.purple, bg = c.pastel_purple },
		["@keyword.operator"] = { fg = c.purple, bg = c.pastel_purple },
		["@keyword.import"] = { link = "Include" },
		["@keyword.storage"] = { link = "Keyword" },
		["@keyword.repeat"] = { fg = c.purple, bg = c.pastel_purple },
		["@keyword.return"] = { link = "Keyword" },
		["@keyword.debug"] = { link = "Debug" },
		["@keyword.exception"] = { fg = c.purple, bg = c.pastel_purple },

		["@keyword.conditional"] = { fg = c.purple, bg = c.pastel_purple },
		["@keyword.conditional.ternary"] = { fg = c.purple, bg = c.pastel_purple },
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

		["@tag"] = { fg = c.purple, bg = c.pastel_purple },
		["@tag.delimiter"] = { fg = c.fg_muted, bg = c.white },
		["@tag.attribute"] = { fg = c.fg_muted, bg = c.white, italic = true },

		["@text"] = { fg = c.yellow_dark, bg = c.pastel_yellow },
		["@text.strong"] = { fg = c.yellow_dark, bg = c.pastel_yellow, bold = true },
		["@text.emphasis"] = { fg = c.yellow_dark, bg = c.pastel_yellow, italic = true },
		["@text.underline"] = { fg = c.yellow_dark, bg = c.pastel_yellow, underline = true },
		["@text.title"] = { fg = c.purple, bg = c.pastel_purple, bold = true },
		["@text.literal"] = { fg = c.yellow_dark, bg = c.pastel_yellow },
		["@text.uri"] = { fg = c.blue, bg = c.pastel_blue, italic = true },
		["@text.reference"] = { fg = c.yellow_dark, bg = c.pastel_yellow, bold = true },

		["@diff.plus"] = { link = "DiffAdd" },
		["@diff.minus"] = { link = "DiffDelete" },
		["@diff.delta"] = { link = "DiffChange" },

		-- LSP Diagnostics
		DiagnosticError = { fg = c.red },
		DiagnosticWarn = { fg = c.yellow },
		DiagnosticInfo = { fg = c.green_pastel },
		DiagnosticHint = { fg = c.green_pastel },
		DiagnosticUnderlineError = { undercurl = true, sp = c.red },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.yellow },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.green_pastel },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.green_pastel },
		-- LSP Semantic Highlighting
		["@lsp.type.class"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.struct"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.enum"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.enumMember"] = { fg = c.purple, bg = c.pastel_purple },
		["@lsp.type.event"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.interface"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.decorator"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.typeParameter"] = { fg = c.green, bg = c.pastel_green },
		["@lsp.type.modifier"] = { fg = c.green, bg = c.pastel_green },

		-- rainbow
		TSRainbowRed = { fg = c.red },
		TSRainbowOrange = { fg = c.yellow_dark },
		TSRainbowYellow = { fg = c.yellow },
		TSRainbowGreen = { fg = c.green },
		TSRainbowCyan = { fg = c.green_pastel },
		TSRainbowBlue = { fg = c.blue },
		TSRainbowViolet = { fg = c.purple },

		-- rainbow-delimiters
		RainbowDelimiterRed = { fg = c.red },
		RainbowDelimiterYellow = { fg = c.yellow },
		RainbowDelimiterBlue = { fg = c.blue },
		RainbowDelimiterOrange = { fg = c.yellow_dark },
		RainbowDelimiterGreen = { fg = c.green },
		RainbowDelimiterViolet = { fg = c.purple },
		RainbowDelimiterCyan = { fg = c.green_pastel },

		-- nvim-notify
		NotifyERRORBorder = { fg = c.bg_darkest },
		NotifyWARNBorder = { fg = c.bg_darkest },
		NotifyINFOBorder = { fg = c.bg_darkest },
		NotifyDEBUGBorder = { fg = c.bg_darkest },
		NotifyTRACEBorder = { fg = c.bg_darkest },
		NotifyERRORTitle = { fg = c.red },
		NotifyWARNTitle = { fg = c.yellow_dark },
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

		CmpItemKindText = { fg = c.bg_darkest },
		CmpItemKindSnippet = { fg = c.fg_muted },
		CmpItemKindConstant = { fg = c.blue },
		CmpItemKindVariable = { fg = c.blue },
		CmpItemKindKeyword = { fg = c.yellow_dark },
		CmpItemKindMethod = { fg = c.purple },
		CmpItemKindFunction = { link = "CmpItemKindMethod" },
		CmpItemKindConstructor = { link = "CmpItemKindMethod" },
		CmpItemKindClass = { fg = c.purple_med },
		CmpItemKindInterface = { link = "CmpItemKindClass" },
		CmpItemKindModule = { link = "CmpItemKindClass" },
		CmpItemKindStruct = { link = "CmpItemKindClass" },

		-- mini.deps
		MiniDepsChangeAdded = { fg = c.green },
		MiniDepsChangeRemoved = { fg = c.yellow_dark },
		MiniDepsHint = { fg = c.fg_muted },
		MiniDepsInfo = { fg = c.bg_darkest },
		MiniDepsTitle = { fg = c.bg_darkest, bold = true },
		MiniDepsTitleError = { fg = c.red, bold = true },
		MiniDepsTitleSame = { fg = c.blue, bold = true },
		MiniDepsTitleUpdate = { fg = c.green, bold = true },

		-- mini.diff
		MiniDiffSignAdd = { bg = c.pastel_green },
		MiniDiffSignChange = { bg = c.pastel_yellow },
		MiniDiffSignDelete = { bg = c.pastel_red },
		MiniDiffOverAdd = { bg = c.pastel_green },
		MiniDiffOverChange = { bg = c.pastel_yellow },
		MiniDiffOverContext = { bg = c.pastel_blue },
		MiniDiffOverDelete = { bg = c.pastel_red },

		-- mini.files
		MiniFilesBorder = { link = "WinSeparator" },
		MiniFilesBorderModified = { link = "DiffChange" },
		MiniFilesDirectory = { link = "SpecialKey" },
		MiniFilesFile = { link = "Identifier" },
		MiniFilesNormal = { link = "Normal" },
		MiniFilesTitle = { link = "Comment" },
		MiniFilesTitleFocused = { link = "PreProc" },

		-- mini.jump2d
		MiniJump2dSpot = { fg = c.red, bold = true },
		MiniJump2dSpotAhead = { fg = c.yellow_dark },

		-- mini.statusline
		MiniStatuslineModeNormal = { bg = c.pastel_purple },
		MiniStatuslineModeInsert = { bg = c.pastel_green },
		MiniStatuslineModeVisual = { bg = c.pastel_blue },
		MiniStatuslineModeReplace = { bg = c.pastel_yellow },
		MiniStatuslineModeCommand = { bg = c.pastel_red },
		MiniStatuslineModeOther = { bg = c.pastel_blue },
		MiniStatuslineInactive = { fg = c.fg_muted },

		-- mini.starter
		MiniStarterHeader = { fg = c.bg_darkest },
		MiniStarterFooter = { fg = c.fg_muted },
		MiniStarterItemPrefix = { fg = c.red },

		-- mini.tabline
		MiniTablineCurrent = { fg = c.white, bg = c.bg_darkest },
		MiniTablineVisible = { link = "MiniTablineCurrent" },
		MiniTablineHidden = { fg = c.bg_darkest, bg = c.white },
		MiniTablineModifiedCurrent = { fg = c.yellow_dark, bg = c.bg_darkest },
		MiniTablineModifiedVisible = { link = "MiniTablineModifiedCurrent" },
		MiniTablineModifiedHidden = { fg = c.yellow_dark, bg = c.white },

		-- barbar
		BufferCurrent = { link = "TabLineSel" },
		BufferCurrentIndex = { link = "TabLineSel" },
		BufferCurrentMod = { fg = c.yellow_dark },
		BufferCurrentSign = { fg = c.white },
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
		NoiceCmdlinePopupTitle = { fg = c.bg_darkest, bold = true },
		NoiceCmdlinePopupBorder = { fg = c.bg_darkest },

		-- Neogit
		NeogitDiffAdd = { bg = c.pastel_green },
		NeogitDiffAddHighlight = { link = "NeogitDiffAdd" },
		NeogitDiffDelete = { bg = c.pastel_red },
		NeogitDiffDeleteHighlight = { link = "NeogitDiffDelete" },
		NeogitHunkHeader = { link = "NeogitHunkHeaderHighlight" },

		-- Diffview
		DiffviewDiffAdd = { bg = c.pastel_green },
		DiffviewDiffDelete = { bg = c.pastel_red },
		DiffviewDiffChange = { bg = c.pastel_yellow },

		-- modicator.nvim
		NormalMode = { link = "Normal" },
		InsertMode = { bold = true },
		VisualMode = { link = "Visual" },
		CommandMode = { link = "NormalMode" },
		ReplaceMode = { fg = c.red },
		SelectMode = { link = "VisualMode" },
		TerminalMode = { link = "NormalMode" },
		TerminalNormalMode = { link = "NormalMode" },

		-- rcarriga/nvim-dap-ui
		DapUIVariable = { link = "Normal" },
		DapUIValue = { link = "Normal" },
		DapUIFrameName = { link = "Normal" },
		DapUIThread = { fg = c.yellow_dark },
		DapUIWatchesValue = { link = "DapUIThread" },
		DapUIBreakpointsInfo = { link = "DapUIThread" },
		DapUIBreakpointsCurrentLine = { fg = c.yellow_dark, bold = true },
		DapUIWatchesError = { link = "DapUIWatchesEmpty" },
		DapUIBreakpointsDisabledLine = { fg = c.fg_muted },
		DapUISource = { fg = c.purple_med },
		DapUIBreakpointsPath = { fg = c.green_pastel },
		DapUIScope = { link = "DapUIBreakpointsPath" },
		DapUILineNumber = { link = "DapUIBreakpointsPath" },
		DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
		DapUIFloatBorder = { link = "DapUIBreakpointsPath" },
		DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
		DapUIDecoration = { link = "DapUIBreakpointsPath" },
		DapUIModifiedValue = { fg = c.green_pastel, bold = true },
	}
end

return M
