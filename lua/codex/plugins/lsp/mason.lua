-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end
--
-- local mason_null_status, mason_null_ls = pcall(require, 'mason_null_ls')
-- if not mason_null_status then return end

mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"rust_analyzer",
		"quick_lint_js",
		"vtsls",
		"tsserver",
		"html",
		"svelte",
		"cssls",
		"tailwindcss",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})
--
-- mason_null_ls.setup({
-- 	-- list of formatters & linters for mason to install
-- 	ensure_installed = {
-- 		"prettier", -- ts/js formatter
-- 		-- "stylua", -- lua formatter
-- 		"eslint_d", -- ts/js linter
-- 	},
-- 	-- auto-install configured formatters & linters (with null-ls)
-- 	automatic_installation = true,
-- })
