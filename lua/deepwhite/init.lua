local M = {}

local default_config = {
	transparent = false,
}

M.config = vim.deepcopy(default_config)

function M.setup(user_opts)
	user_opts = user_opts or {}
	M.config = vim.tbl_deep_extend("force", M.config, user_opts)
end

function M.load()
	if vim.version().minor < 7 then
		vim.notify_once("deepwhite.nvim: you must use neovim 0.7 or higher")
		return
	end

	vim.cmd([[hi clear]])
	vim.g.colors_name = "deepwhite"
	vim.o.background = "light"
	vim.o.termguicolors = true

	local colors = require("deepwhite.colors").build_colors(M.config)
	local groups = require("deepwhite.scheme").get_groups(colors)

	for name, val in pairs(groups) do
		vim.api.nvim_set_hl(0, name, val)
	end
end

return M
