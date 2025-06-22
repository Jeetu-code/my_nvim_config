return {
"nvim-tree/nvim-tree.lua",
version = "*",
lazy = false,
dependencies = {"nvim-tree/nvim-web-devicons"}, -- optional icons
config = function()
require("nvim-tree").setup({
sort = {
sorter = "case_sensitive",
},
view = {
         width = 30,
        },
                   renderer = {
                     group_empty = true,
                   },
                   filters = {
                     dotfiles = true,
                   },
                 })
		end,
		keys = {
			{"<leader>e","<cmd>NvimTreeToggle<CR>",desc = "Toggle File Explorer"},
		}}
