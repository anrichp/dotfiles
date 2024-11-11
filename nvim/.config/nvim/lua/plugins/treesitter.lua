return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "css", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python", "php", "markdown", "rust" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end
  }
}
