return { 
   'echasnovski/mini.nvim', version = false,
    config = function()
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        -- MINI.STARTER
        require('mini.starter').setup()
        -- MINI.AI
        require('mini.ai').setup()
        -- MINI.ANIMATE
        require('mini.animate').setup()
        -- MINI.ICONS
        require('mini.icons').setup()
        -- MINI.BASE16
        -- require('mini.base16').setup({
        --     palette = {
        --         base00 = "#181818",
        --         base01 = "#282828",
        --         base02 = "#383838",
        --         base03 = "#585858",
        --         base04 = "#b8b8b8",
        --         base05 = "#d8d8d8",
        --         base06 = "#e8e8e8",
        --         base07 = "#f8f8f8",
        --         base08 = "#ab4642",
        --         base09 = "#dc9656",
        --         base0A = "#f7ca88",
        --         base0B = "#a1b56c",
        --         base0C = "#86c1b9",
        --         base0D = "#7cafc2",
        --         base0E = "#ba8baf",
        --         base0F = "#a16946",
        --     },
        --     use_cterm = true,
        --     plugins = {
        --       default = false,
        --       ['echasnovski/mini.nvim'] = true,
        --     },
        -- })
        -- MINI.COMMENT
        require('mini.comment').setup()
        -- MINI.BRACKETED
        require('mini.bracketed').setup()
        -- MINI.SURROUND
        require('mini.surround').setup()
        -- MINI.FILES
        require('mini.files').setup({
            -- General options
            options = {
                -- Whether to delete permanently or move into module-specific trash
                permanent_delete = true,
                -- Whether to use for editing directories
                use_as_default_explorer = true,
            },
            window = { config = {
                border = 'double',
                title_pos = 'right',
            } }
        })
        -- MINI.STATUSLINE
        require('mini.statusline').setup()
        -- MINI.TABLINE
        require('mini.tabline').setup({
            show_icons = false
        })

        -- MINI.PICK 
        require('mini.pick').setup({
            window = { config = {
                anchor = 'nw', height = height, width = width,
              row = math.floor(0.5 * (vim.o.lines - height)),
              col = math.floor(0.5 * (vim.o.columns - width)),
              border = 'double',
            } }
        })
    end
}
