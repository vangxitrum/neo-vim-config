local others = {
    {
	"tpope/vim-sleuth"
    },
    {
	'folke/todo-comments.nvim',
	event = 'VimEnter',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = { signs = false },
    },
    {
	'm4xshen/autoclose.nvim',
	config = function()
	    require("autoclose").setup()
	end,
    },
    {
	'numToStr/Comment.nvim'
    },
    {
	'christoomey/vim-tmux-navigator'
    },
    {
	"rcarriga/nvim-dap-ui",
	dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    },
    {
	"folke/which-key.nvim",
	config = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	    require("which-key").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	    }
	end
    },
    {
	"github/copilot.vim",
    },
    {
	"OmniSharp/omnisharp-vim",
    },
    {
	"lewis6991/spellsitter.nvim",
	config = function()
	    require('spellsitter').setup{
		highlight = {
		    enabled = true,
		},
		enabled = true,
	    }
	end
    },
    {
	'norcalli/nvim-colorizer.lua',
	config = function()
	    require('colorizer').setup()
	end,
    },
    {
	'windwp/nvim-ts-autotag',
	config = function()
	    require('nvim-ts-autotag').setup({
		opts = {
		    -- Defaults
		    enable_close = true, -- Auto close tags
		    enable_rename = true, -- Auto rename pairs of tags
		    enable_close_on_slash = false -- Auto close on trailing </
		},
		-- Also override individual filetype configs, these take priority.
		-- Empty by default, useful if one of the "opts" global settings
		-- doesn't work well in a specific filetype
		per_filetype = {
		    ["html"] = {
			enable_close = false
		    }
		}
	    })
	end,
    },
    {
	'APZelos/blamer.nvim',
    },
    {
	'tpope/vim-eunuch',
    },
}

return others
