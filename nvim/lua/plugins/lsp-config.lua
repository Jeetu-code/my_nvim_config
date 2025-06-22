return {
-- LSP Installer + Manager
	{
	"Williamboman/mason.nvim",
	build = ":MasonUpdate",
	config = function()
		require("mason").setup()
		end,
	},
{
    "mason-org/mason-lspconfig.nvim",
	config = function ()
        require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "rust_analyzer","ts_ls","pyright","clangd","html","cssls" },
	automatic_enable = false,
			})
	end
},
{
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		 require("lspconfig").lua_ls.setup({capabilities = capabilities})
		 require("lspconfig").pyright.setup({capabilities = capabilities})
		 require("lspconfig").clangd.setup({capabilities = capabilities})
		 require("lspconfig").ts_ls.setup({capabilities = capabilities})
		 require("lspconfig").html.setup({capabilities = capabilities})
		 require("lspconfig").cssls.setup({capabilities = capabilities})
		end,
	dependencies = {
	    "folke/lazydev.nvim",
	    ft = "lua", -- only load on lua files
	    opts = {
	      library = {
		-- See the configuration section for more details
		-- Load luvit types when the `vim.uv` word is found
		{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
	      },
	    },
	  },
	},


	}


