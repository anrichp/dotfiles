vim.opt.runtimepath:append("/home/anrichp/.local/share/nvim/site")
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.signcolumn = "yes"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>fg', ":Pick grep<CR>")
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.pack.add({
	{ src = "http://github.com/vague2k/vague.nvim" },
	{ src = "http://github.com/stevearc/oil.nvim" },
	{ src = "http://github.com/echasnovski/mini.pick" },
	{ src = "http://github.com/neovim/nvim-lspconfig" },
	{ src = "http://github.com/chomosuke/typst-preview.nvim" },
	{ src = "http://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "http://github.com/codethread/qmk.nvim" },
})

require "mini.pick".setup()
require "oil".setup()
require "typst-preview".setup()
require "nvim-treesitter".setup({
	ensure_installed = { "dart", "angular", "html", "typescript", "css", "scss", "devicetree"},

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
require("qmk").setup({
  name = "ferris_sweep",
  variant = "zmk", 
  comment_preview = { position = "top" },
  layout = {
    "x x x x x _ _ _ x x x x x",
    "x x x x x _ _ _ x x x x x",
    "x x x x x _ _ _ x x x x x",
    "_ _ _ x x _ _ _ x x _ _ _",
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")

vim.lsp.enable({ "lua_ls", "tinymist", "phpactor", "racket_langserver", "rust-analyzer", "dartls", "angularls", "ts_ls",
	"html", "cssls" })
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			}
		}
	}
})
vim.lsp.config("rust-analyzer", {
	filetypes = { "rust" },
	cmd = { "/home/anrichp/.cargo/bin/rust-analyzer" },
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = false,
			}
		}
	}
})
-- 1. Get the current project's node_modules path dynamically
local project_library_path = vim.fn.getcwd() .. "/node_modules"

-- 2. Define the command with the calculated path
local cmd = {
	"ngserver",
	"--stdio",
	"--tsProbeLocations", project_library_path,
	"--ngProbeLocations", project_library_path
}

-- 3. Configure the LSP
vim.lsp.config("angularls", {
	cmd = cmd,
	root_markers = { "angular.json", "nx.json", "project.json" },
	on_attach = function(client, bufnr)
		-- Optional: Disable built-in formatting if you use Prettier
		-- client.server_capabilities.documentFormattingProvider = false
	end,
})

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
