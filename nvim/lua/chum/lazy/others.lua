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
}

return others
