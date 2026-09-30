vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.mapleader = " "

vim.keymap.set({ "n" }, "<C-s>", ":w<CR>", { desc = "Save file" })

-- -- Window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Normal mode window movement
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move Left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move Right" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move Up" })

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })

-- Competitive


-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
  },
})

-- Cmake
vim.g.cmake_link_compile_commands = 1

-- Sign/gutter area
vim.opt.signcolumn = "yes:2"

-- // Withou plugin
-- vim.keymap.set("n", "<leader>x", function()
-- 	require("bufferline").cycle(1)
-- 	vim.cmd("bdelete #")
-- end, { desc = "Close current buffer cleanly" })

-- // With plugin
vim.keymap.set("n", "<leader>x", function()
  require("bufdelete").bufdelete(0, true)
end, { desc = "Close buffer" })
