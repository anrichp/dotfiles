return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    -- Keybindings for vim-fugitive
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
    vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
    vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
    vim.keymap.set("n", "<leader>gl", ":Git pull<CR>", { desc = "Git pull" })
    vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", { desc = "Git diff" })
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
  end,
}
