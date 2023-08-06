require("codex.plugins-setup")
require("codex.core.options")
require("codex.core.keymaps")
require("codex.core.colorscheme")
require("codex.core.commands")
require("codex.plugins.comment")
require("codex.plugins.nvim-tree")
require("codex.plugins.lualine")
require("codex.plugins.telescope")
require("codex.plugins.nvim-cmp")
require("codex.plugins.gitsigns")
require("codex.plugins.lsp.mason")
require("codex.plugins.lsp.lspsaga")
require("codex.plugins.lsp.lspconfig")
require("codex.plugins.lsp.null-ls")
require("codex.plugins.autopairs")
require("codex.plugins.treesitter")
require("codex.plugins.discord")
require("codex.plugins.highlight-colors")
require("codex.plugins.bufferline")
require("codex.plugins.todo")

vim.cmd([[
  nnoremap <Tab> :BufferLineCycleNext<CR>
  nnoremap <S-Tab> :BufferLineCyclePrev<CR>
  nnoremap <leader>w :BDelete this<CR>
  ]])

vim.diagnostic.config({
	severity_sort = true,
})

vim.opt.termguicolors = true
vim.opt.scrolloff = 3

vim.cmd([[
  cnoreabbrev W w
]])

vim.g.rustfmt_autosave = 1

vim.cmd([[colorscheme catppuccin-mocha]])
