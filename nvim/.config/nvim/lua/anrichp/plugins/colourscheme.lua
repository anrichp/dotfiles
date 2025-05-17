return {
	"catppuccin/nvim",
	priority = 1000,
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
