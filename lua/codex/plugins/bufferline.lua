local mocha = require("catppuccin.palettes").get_palette("mocha")
local status, bufferline = pcall(require, "bufferline")
if not status then
	return
end

bufferline.setup({
	options = {
		numbers = "ordinal",
		number_style = "superscript",
		separator_style = "thick",
		mappings = true,
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			icon = "▎", -- this should be omitted if indicator style is not 'icon'
			style = "icon",
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
			-- remove extension from markdown files for example
			if buf.name:match("%.md") then
				return vim.fn.fnamemodify(buf.name, ":t:r")
			end
		end,
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is deduplicated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
		-- 	local s = " "
		-- 	for e, n in pairs(diagnostics_dict) do
		-- 		local sym = e == "error" and " " or (e == "warning" and " " or "")
		-- 		s = s .. n .. sym
		-- 	end
		-- 	return s
		-- end,
		custom_filter = function(buf_number)
			-- filter out filetypes you don't want to see
			if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
				return true
			end
			-- filter out by buffer name
			if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
				return true
			end
			-- filter out based on arbitrary rules
			-- e.g. filter out vim wiki buffer from tabline in your work repo
			if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
				return true
			end
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
			},
		},
	},
	highlights = require("catppuccin.groups.integrations.bufferline").get({
		styles = { "italic", "bold" },
		custom = {
			all = {
				fill = { bg = "#000000" },
			},
			mocha = { background = { fg = mocha.text } },
			latte = {
				background = { fg = "#000000" },
			},
		},
	}),
})
