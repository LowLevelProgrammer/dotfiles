return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false, -- required (plugin does not support lazy-loading)
		build = ":TSUpdate", -- auto update parsers on install/update

		config = function()
			-- Install parsers
			require("nvim-treesitter").install({
				"c",
				"cpp",
				"lua",
				"python",
				"bash",
				"json",
				"markdown",
			})

			-- Enable treesitter highlighting for all filetypes
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "c", "cpp", "lua", "python", "bash", "json", "markdown" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
