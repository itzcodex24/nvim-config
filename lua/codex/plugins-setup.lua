-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end
-- add list of plugins to install
return packer.startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
	use("lewis6991/gitsigns.nvim")

  use("voldikss/vim-floaterm")

	use("leafOfTree/vim-svelte-plugin")

	-- MarkdownPreview
	-- MarkdownPreviewStop
	-- MarkdownPreviewToggle
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })
	use("kazhala/close-buffers.nvim")

	-- SVELTE
	use({
		"evanleck/vim-svelte",
		ft = { "svelte" },
	})

	-- Color Schemes | Themes
	-- use("folke/tokyonight.nvim")
	-- use("ellisonleao/gruvbox.nvim")
	-- use("luisiacc/gruvbox-baby")
	use("rebelot/kanagawa.nvim")

	use({
		"catppuccin/nvim",
		-- name = "catppuccin",
		-- priority = 1000,
		-- opts = {
		-- 	transparent_background = true,
		-- 	integrations = {
		-- 		telescope = true,
		-- 		harpoon = true,
		-- 		mason = true,
		-- 		neotest = true,
		-- 	},
		-- },
		-- config = function(_, opts)
		-- 	require("catppuccin").setup(opts)
		-- 	vim.cmd.colorscheme("catppuccin-mocha")
		-- end,
	})

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)

	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)
	use("numToStr/Comment.nvim")
	use("tpope/vim-commentary")

	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")

	use("nvim-lualine/lualine.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	---- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-calc")
	use("hrsh7th/cmp-emoji")
	use("hrsh7th/cmp-nvim-lua")
	use("f3fora/cmp-spell")

	---- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- Rust
	use("simrat39/rust-tools.nvim")
	use("rust-lang/rust.vim")

	---- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers

	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	}) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	---- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("github/copilot.vim")

	use({
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	})

	---- treesitter configuration
	----

	---- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	---- use("segeljakt/vim-silicon")
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use("brenoprata10/nvim-highlight-colors")

	use("AndrewRadev/tagalong.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
