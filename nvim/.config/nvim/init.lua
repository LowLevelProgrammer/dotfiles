require("config.lazy")
require("options")
require("autocmd")
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "BufferLineFill", {
	-- bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg,
	bg = "#1e1e2e",
})
