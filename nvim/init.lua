-- ====================================
-- PART 1 : Basic Nvim Settings
-- ====================================

-- set leader key as <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable line numbers
vim.o.number = true

-- Enable mouse support
vim.o.mouse = "a"

-- Hide "--INSERT--" and other modes , we will use lualine to do this
vim.o.showmode = false

-- Clipboard sync with file system (use + register)
vim.o.clipboard = "unnamedplus"

-- Use undo file to save undo history
vim.o.undofile = true

-- Better search: ignore case unless capital used
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn visible (Git/LSP signs)
vim.o.signcolumn = "yes"

-- Faster update and key response times
vim.o.updatetime = 250

-- New Splits open to the right and bottom
vim.o.splitright = true
vim.o.splitbelow = true

-- Show invisible characters
vim.o.list = true
vim.opt.listchars = { tab = ">> ", trail = ".", nbsp = "_" }

-- Live Preview for :%s substitutions
vim.o.inccommand = "split"

-- Hilight current cursor line
vim.o.cursorline = true

-- Always Keep 15 lines above/below cursor
vim.o.scrolloff = 15

-- Ask to save if file is unsaved
vim.o.confirm = true

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
--[[
Use:

vim.o for global options

vim.bo for buffer options

vim.wo for window options

vim.opt for complex options (like tables)

]]

-- ==================================
-- PART 2: Keymaps and Nviavigation
-- ==================================

--syntax of a keymap : vim.keymap.set(mode, key_combo, action, { options })

-- Map <Esc> in normal mode to cleat search highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Search Highlight" })

-- Save & Quit Easily
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "[W]rite/Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "[Q]uit file" })

-- Easy window navigation with ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to up window" })

-- Remap <leader>e to open netrw file explorer
--vim.keymap.set('n','<leader>e','<cmd>vsplit |Explore<CR>',{desc = 'Open file explorer'})

-- Reload config without starting without restarting neovim
vim.keymap.set("n", "<leader>r", "<cmd>source %<CR>", { desc = "[R]eload config" })

-- Opening Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Opening Lazy" })

-- Opening terminal
vim.keymap.set("n", "<leader>tl", "<cmd>vsplit | terminal<CR>", { desc = "Open vertical terminal" })
vim.keymap.set("n", "<leader>tj", "<cmd>split | terminal<CR>", { desc = "Open vertical terminal" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "ON normal mode terminal" })
vim.keymap.set("n","<leader>hr","<cmd>horizontal resize 10<CR>",{desc = "horizontal resize is 10"})
-- my own first key map vim.keymap.set('n','<leader>vs','<cmd>vsplit<CR>',{desc = 'vertical split'})

-- ==================================
-- PART 3: Install Lazy.nvim
-- ==================================
--[[
Lua code			What it does

vim.fn.stdpath("data")		Gets Neovim's data directory path
vim.loop.fs_stat(path)		Checks if a path/file/folder exists
vim.fn.system({...})		Runs a shell command like git clone
vim.opt.rtp:prepend(path)	Adds folder to Neovim's plugin search path
]]

-- ==================================
-- PART 4: plugin setup
-- ==================================
require("config.lazy")
require("lazy").setup("plugins")

-- Auto command
vim.api.nvim_create_autocmd("TermOpen", {
	--  group = vim.api.nvim_create_autogroup("custom-term-open",{Clear = true}),
	callback = function()
		vim.opt.number = false
		vim.o.relativenumber = false
	end,
})

vim.keymap.set("n", "<leader>fe", function()
	local file = vim.fn.expand("%")

	local ft = vim.bo.filetype

	-- Determine run command
	local cmd = ""

	-- for lua
	if ft == "lua" then
	cmd = "lua " .. file
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)

	-- for python
	elseif ft == "python" then
	cmd = "python3 " .. file
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)

	--for javascript
	elseif ft == "javascript" then
	cmd = "node " .. file
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)

	-- for bash 
	elseif ft == "sh" then
	cmd = "bash " .. file
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)

	-- for c++
	elseif ft == "cpp" then
	cmd = "g++ " .. file .. " -o " .. "file.exetuable"
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)
	cmd = "./file.exetuable"
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys(cmd .. " \n", "n", false)

	-- for c
	elseif ft == "c" then
	cmd = "g++ " .. file .. " -o " .. "file.exetuable"
	vim.api.nvim_feedkeys("i" .. cmd .. " \n", "n", false)
	cmd = "./file.exetuable"
	vim.cmd("w")
	vim.cmd("split | terminal")
	vim.api.nvim_feedkeys(cmd .. " \n", "n", false)

	else
		print("No runner defined for filetype: " .. ft)
		return
	end
	end, { desc = "Execute current file" })

