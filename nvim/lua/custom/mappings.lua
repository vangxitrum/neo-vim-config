local M = {}

M.dap = {
    plugin = true,
    n = {
        ["<leader>db"] = {
            "<cmd> DapToggleBreakpoint <CR>",
            "Add breakpoint at line"
        },
        ["<leader>dus"] = {
            function ()
                local widgets = require('dap.ui.widgets');
                local sidebar = widgets.sidebar(widgets.scopes);
                sidebar.open();
            end,
            "Open debugging sidebar"
        }
    }
}

M.dap_go = {
    plugin = true,
    n = {
        ["<leader>dgt"] = {
            function()
                require('dap-go').debug_test()
            end,
            "Debug go test"
        },
        ["<leader>dgl"] = {
            function()
                require('dap-go').debug_last()
            end,
            "Debug last go test"
        },
        ["<leader>do"] = {
            function()
                require('dap').step_over()
            end,
            "Step over"
        },
        ["<leader>di"] = {
            function()
                require('dap').step_into()
            end,
            "Step into"
        },
        ["<leader>du"] = {
            function()
                require('dap').step_out()
            end,
            "Step out"
        },
    }
}

M.gopher = {
    plugin = true,
    n = {
        ["<leader>gj"] = {
            "<cmd> GoTagAdd json <CR>",
            "Add json struct tags"
        },
        ["<leader>gs"] = {
            "<cmd> GoTagAdd yaml <CR>",
            "Add yaml struct tags"
        },
        ["<leader>ge"] = {
            "<cmd> GoIfErr <CR>",
            "Add error handling"
        },
        ["<leader>gt"] = {
            "<cmd> GoTestAdd <CR>",
            "Add function test"
        }
    }
}

M.copilot = {
    i = {
        ["<C-l>"] = {
            function()
                vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
            end,
            "Copilot Accept",
            {replace_keycodes = true, nowait=true, silent=true, expr=true, noremap=true}
        }
    }
}

M.harpoon = {
    n = {
        ["<leader>a"] = {
            function ()
                require("harpoon.mark").add_file()
            end,
            "Add file to harpoon"
        },
        ["<C-e>"] = {
            function ()
                require("harpoon.ui").toggle_quick_menu()
            end,
            "Toggle harpoon menu"
        }
    }
}

M.trouble = {
    n = {
        ["<C-\\>"] = {
            "<cmd> TroubleToggle <CR>",
            "Toggle trouble"
        },
        ["<leader>gR"] = {
            "<cmd> TroubleToggle lsp_references <CR>",
            "Toggle references"
        },
    }

}

return M
