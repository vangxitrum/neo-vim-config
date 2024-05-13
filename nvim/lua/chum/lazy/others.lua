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
	'pocco81/auto-save.nvim',
	config = function()
	    vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
	end,
    }

}

return others
