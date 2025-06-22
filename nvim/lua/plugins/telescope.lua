return {
"nvim-telescope/telescope.nvim",
tag = "0.1.6", -- stable version (optional)
dependencies = {"nvim-lua/plenary.nvim"},
config = function ()
require("telescope").setup({})
--Telescope
vim.keymap.set('n',"<leader>ff","<cmd>Telescope find_files<CR>",{desc = "Find Files"})
vim.keymap.set('n',"<leader>fg","<cmd>Telescope live_grep<CR>",{desc = "Live Grep"})
vim.keymap.set('n',"<leader>fb","<cmd>Telescope buffers<CR>",{desc = "Find Buffers"})
vim.keymap.set('n',"<leader>fh","<cmd>Telescope help_tags<CR>",{desc = "Help Tags"})
end,
}

