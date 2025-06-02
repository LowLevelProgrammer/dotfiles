require "nvchad.mappings"

local function get_executable_target()
  local cmake_file = "CMakeLists.txt"

  -- Attempt to open the CMakeLists.txt file
  local file = io.open(cmake_file, "r")
  if not file then
    print "CMakeLists.txt not found in the current directory."
    return nil
  end

  -- Parse the file to find the executable target
  for line in file:lines() do
    -- Look for a line that defines an executable
    local target = line:match "add_executable%(%s*(%S+)"
    if target then
      file:close()
      return target
    end
  end

  file:close()
  print "Executable target not found in CMakeLists.txt."
  return nil
end

local function cmake_run_target()
  local target = get_executable_target()

  if target then
    -- Construct the CMakeRun command with the target
    vim.cmd("CMakeRun " .. target)
  else
    print "No executable target found."
  end
end

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("n", "C-\"", "", { desc = "CMD enter command mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- CMake
map("n", "<leader>cr", "<cmd>CMakeClean<cr>", { desc = "Cmake clean" })
map("n", "<leader>cg", "<cmd>CMakeGenerate<cr>", { desc = "Cmake generate" })
map("n", "<leader>cb", "<cmd>CMakeBuild<cr>", { desc = "Cmake build" })

map("n", "<leader>ce", function()
  cmake_run_target()
end, { desc = "Run the CMake executable target" })

map("n", "<leader>cq", "<cmd>CMakeClose<cr>", { desc = "Cmake close window" })
map("n", "<leader>cco", "<cmd>CMakeCloseOverlay<cr>", { desc = "Cmake close overlay window" })

-- Tmux
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Tmux navigate left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Tmux navigate right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Tmux navigate down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Tmux navigate up" })

-- DAP
map("n", "<leader>dr", "<cmd>DapContinue<cr>", { desc = "Dap continue or run" })
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Dap toggle breakpoint" })
map("n", "<leader>so", "<cmd>DapStepOver<cr>", { desc = "Dap step over" })
map("n", "<leader>si", "<cmd>DapStepInto<cr>", { desc = "Dap step into" })
map("n", "<leader>su", "<cmd>DapStepOut<cr>", { desc = "Dap step out" })

map("n", "<F10>", "<cmd>DapStepOver<cr>", { desc = "Dap step over" })
map("n", "<F11>", "<cmd>DapStepInto<cr>", { desc = "Dap step into" })
map("n", "<F12>", "<cmd>DapStepOut<cr>", { desc = "Dap step out" })

-- Git
map("n", "<leader>ph", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
map("n", "<leader>rh", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
map("n", "[c", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
map("n", "]c", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
