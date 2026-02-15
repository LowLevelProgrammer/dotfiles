return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers", -- show buffers, not tabpages
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				show_buffer_close_icons = true,
				show_close_icon = true,
				close_command = function(bufnr)
					require("mini.bufremove").delete(bufnr, false)
				end,
				right_mouse_command = function(bufnr)
					require("mini.bufremove").delete(bufnr, false)
				end,
				offsets = {
					{
						filetype = "NvimTree",
						highlight = "Directory",
						separator = true,
					},
				},
			},
		})
	end,
}
