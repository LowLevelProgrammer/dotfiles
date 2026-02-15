local function cmake_run_project()
	-- Find CMakeLists.txt in current working directory
	local cmake_file = vim.fn.getcwd() .. "/CMakeLists.txt"

	if vim.fn.filereadable(cmake_file) == 0 then
		vim.notify("CMakeLists.txt not found in project root", vim.log.levels.ERROR)
		return
	end

	-- Read file
	local lines = vim.fn.readfile(cmake_file)

	for _, line in ipairs(lines) do
		-- Match: project(MyProject ...)
		local name = line:match("^%s*project%s*%(%s*([%w_-]+)")
		if name then
			vim.cmd("CMakeRun " .. name)
			return
		end
	end

	vim.notify("Could not extract project name from CMakeLists.txt", vim.log.levels.ERROR)
end

return {
	"cdelledonne/vim-cmake",
	keys = {
		{ "<leader>cg", ":CMakeGenerate<CR>", { desc = "Generate cmake files" } },
		{ "<leader>cb", ":CMakeBuild<CR>", { desc = "Build cmake files" } },
		{ "<leader>cc", ":CMakeClean<CR>", { desc = "Build cmake files" } },
		{ "<leader>cr", cmake_run_project, { desc = "Build cmake files" } },
		{ "<leader>cq", ":CMakeClose<CR>", { desc = "Build cmake files" } },
	},
}
