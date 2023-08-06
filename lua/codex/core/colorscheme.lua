-- local status, tokyo = pcall(require, "tokyonight")
-- if not status then
-- 	return "colorscheme not found"
-- end
--
-- tokyo.setup({
-- 	style = "moon",
-- 	light_style = "day",
-- 	transparent = false,
-- 	terminal_colors = true,
-- 	styles = {
-- 		keywords = { bold = true },
-- 		functions = {},
-- 		variables = {},
-- 		sidebars = "dark",
-- 		floats = "dark",
-- 	},
-- })
--

-- local status, colorscheme = pcall(require, "kanagawa")
-- if not status then
-- 	return
-- end
--
-- colorscheme.setup({})

local status, scheme = pcall(require("catppuccin"))
if not status then
	return
end

scheme.setup({
	flavour = "latte", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	transparent_background = true, -- disables setting the background color.
	show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
	term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
	dim_inactive = {
		enabled = true, -- dims the background color of inactive window
		shade = "dark",
		percentage = 0.15, -- percentage of the shade to apply to the inactive window
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	no_underline = false, -- Force no underline
	styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		mini = false,
		lsp_saga = true,
		mason = true,
	},
})
