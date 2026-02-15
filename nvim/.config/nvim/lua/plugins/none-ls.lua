return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.completion.spell,
				-- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
				-- Cpp
				-- null_ls.builtins.diagnostics.clang_tidy,
			},

			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({ bufnr = bufnr })
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})
	end,
}
