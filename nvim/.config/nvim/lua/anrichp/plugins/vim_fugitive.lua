return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [P]ush" })
		vim.keymap.set("n", "<leader>gp", function()
			vim.cmd.Git("push")
		end, { desc = "[G]it [P]ush" })
	end,
}
