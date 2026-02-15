return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		keys = {
			{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Explorer Toggle" },
		},

		config = function()
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = false,
					},
				},
				git = {
					enable = true,
					ignore = false, -- must be false to show ignored files
				},

				renderer = {
					highlight_git = true, -- enables git-based highlighting
				},
			})
		end,
	},
}
