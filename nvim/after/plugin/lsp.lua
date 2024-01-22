local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    "gopls",
})
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.gofumpt,
            null_ls.builtins.formatting.goimports_reviser,
            null_ls.builtins.formatting.golines,
        },
    })

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
            lsp.default_setup,
            gopls = function ()
                local on_attach = require("lspconfig").on_attach
                local capabilities = require("lspconfig").capabilities
                local util = require("lspconfig/util")
                require("lspconfig").gopls.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    cmd = {"gopls"},
                    filetypes = {"go","gomod","gowork","gotmpl"},
                    root_dir = util.root_pattern("go.work","go.mod",".git"),
                    settings = {
                        gopls = {
                            completeUnimported = true,
                            usePlaceholders = true,
                            analyses = {
                                unsusedparams = true,
                            }
                        }
                    }
               })
            end
        },
    })

end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})

