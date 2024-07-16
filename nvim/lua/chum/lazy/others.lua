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
}

return others
