vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		local opts = { buffer = buf }

		-- Navigation
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Info
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, opts)

		-- Code actions
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		-- Diagnostics
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

		-- Formatting
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, opts)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = buf,
			callback = function()
				vim.lsp.buf.format({ bufnr = buf })
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "term://*",
	callback = function()
		local opts = { buffer = true }
		vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", opts)
		vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", opts)
		vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", opts)
		vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", opts)
	end,
})

vim.api.nvim_create_autocmd("WinClosed", {
	callback = function()
		vim.schedule(function()
			local wins = vim.api.nvim_list_wins()

			if #wins == 1 then
				local buf = vim.api.nvim_win_get_buf(wins[1])
				local name = vim.api.nvim_buf_get_name(buf)

				if name:match("NvimTree_") then
					require("nvim-tree.api").tree.close()
				end
			end
		end)
	end,
})
