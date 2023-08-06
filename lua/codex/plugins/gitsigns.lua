local status, git = pcall(require, "gitsigns")
if not status then
	return
end

git.setup({
	current_line_blame = true,
})
