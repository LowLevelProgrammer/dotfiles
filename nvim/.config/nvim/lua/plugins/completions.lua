return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},

				mapping = {
					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<Tab>"] = function(fallback)
						local cmp = require("cmp")
						local luasnip = require("luasnip")

						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							-- check if next char is a closing pair
							local col = vim.fn.col(".")
							local line = vim.fn.getline(".")
							local next_char = line:sub(col, col)

							if next_char:match("[%)%}%]%\"%']") then
								vim.api.nvim_feedkeys(
									vim.api.nvim_replace_termcodes("<Right>", true, false, true),
									"n",
									true
								)
							else
								fallback()
							end
						end
					end,
					["<C-n>"] = function(fallback)
						local cmp = require("cmp")
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,

					["<C-p>"] = function(fallback)
						local cmp = require("cmp")
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,

					["<S-Tab>"] = cmp.mapping(function(fallback)
						local luasnip = require("luasnip")

						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				},

				--
				sources = cmp.config.sources(
					{
						{ name = "nvim_lsp" },
						{ name = "luasnip" }, -- For luasnip users.
					}
					--     , {
					-- 	-- { name = "buffer" },
					-- }
				),
				enabled = function()
					local context = require("cmp.config.context")
					-- disable in comments
					if context.in_treesitter_capture("comment") == true then
						return false
					end
					if context.in_syntax_group("Comment") then
						return false
					end
					return true
				end,
				completion = {
					autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
				},
			})
		end,
	},
}
