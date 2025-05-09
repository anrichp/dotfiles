return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [P]ush" })
		vim.keymap.set("n", "<leader>gp", vim.cmd.Git("push"), { desc = "[G]it [P]ush" })
	end,
}
