return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function lsp_name()
			local clients = vim.lsp.get_clients({ bufnr = 0 })

			if next(clients) == nil then
				return ""
			end

			local names = {}
			for _, client in pairs(clients) do
				table.insert(names, client.name)
			end

			return "  " .. table.concat(names, ", ")
		end

		require("lualine").setup({
			sections = {
				lualine_x = {
					lsp_name, -- 👈 added
					"encoding",
					"fileformat",
					"filetype",
				},
			},
		})
	end,
}
