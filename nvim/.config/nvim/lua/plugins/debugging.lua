return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			ensure_installed = { "codelldb" },
			automatic_installation = true,
		})

		dapui.setup({
			expand_lines = false,
			layouts = {
				{
					position = "left",
					size = 40,
					elements = {
						{ id = "scopes", size = 0.30 },
						{ id = "stacks", size = 0.25 },
						{ id = "breakpoints", size = 0.25 },
						{ id = "watches", size = 0.20 },
					},
				},
				{
					position = "bottom",
					size = 10,
					elements = {
						{ id = "repl", size = 0.5 },
						{ id = "console", size = 0.5 },
					},
				},
			},
		})

		-- open/close UI automatically
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- C++ config
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		-- Explicit codelldb adapter definition
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
				args = { "--port", "${port}" },
			},
		}

		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<F12>", dap.step_out)

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
		vim.keymap.set("n", "<leader>dr", dap.continue)
		vim.keymap.set("n", "<leader>dp", dap.repl.open)
		vim.keymap.set("n", "<leader>du", dapui.toggle)

		dap.configurations.c = dap.configurations.cpp
	end,
}
