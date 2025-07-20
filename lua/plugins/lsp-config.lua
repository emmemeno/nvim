return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                cargo = {
                    allFeatures = true,
                },
            })
            vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.definition, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
            vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>cd', vim.diagnostic.open_float, {})
            vim.keymap.set('n', '<leader>cn', vim.diagnostic.goto_next, {})
            vim.keymap.set('n', '<leader>cp', vim.diagnostic.goto_prev, {})
        end
    },
}
