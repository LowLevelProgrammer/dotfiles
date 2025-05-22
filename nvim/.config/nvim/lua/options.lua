require "nvchad.options"

-- add yours here!

local o = vim.o
o.relativenumber = true
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.g.cmake_link_compile_commands = 1

local nvim_tree = require "nvim-tree"

-- Get the current setup
local config = nvim_tree.config or {}

-- Modify only the `git_ignored` filter
config.filters = vim.tbl_deep_extend("force", config.filters or {}, {
  git_ignored = false, -- Show Git-ignored files by default
})

-- Apply the updated config without overriding everything
nvim_tree.setup(config)
