local M = {}

local default_config = {
	variant = "default",
	transparent = false,
	low_blue_light = false,
}

M.config = vim.deepcopy(default_config)

function M.setup(user_opts)
	user_opts = user_opts or {}
	M.config = vim.tbl_deep_extend("force", M.config, user_opts)
	
	-- Set the variant if specified
	if user_opts.variant then
		require("flatdeep.colors").set_variant(user_opts.variant)
	end
end

function M.load()
	if vim.version().minor < 7 then
		vim.notify_once("flatdeep.nvim: you must use neovim 0.7 or higher")
		return
	end

	vim.cmd([[hi clear]])
	vim.g.colors_name = "flatdeep"
	vim.o.background = "light"
	vim.o.termguicolors = true

	local colors = require("flatdeep.colors").build_colors(M.config)
	local groups = require("flatdeep.scheme").get_groups(colors)

	for name, val in pairs(groups) do
		vim.api.nvim_set_hl(0, name, val)
	end
end

return M
