return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clangd", "lua_ls", "pyright" },
    },
    dependencies = { { "mason-org/mason.nvim", opts = {} }, "neovim/nvim-lspconfig" },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Example : Lua vim.lsp
      --Lua
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      -- C++
      vim.lsp.config("clangd", {
        cmd = { "clangd", "--background-index" },
        capabilities = capabilities,
      })
      vim.lsp.enable("clangd")

      -- Python
      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })
      vim.lsp.enable("pyright")
    end,
  },
}
