return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- TREE SITTER CONFIG
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
        ensure_installed = {"lua", "rust", "toml"},
        auto_install = true,
        highlight = { 
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        ident = { enable = true },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        }
    })
    end
}
