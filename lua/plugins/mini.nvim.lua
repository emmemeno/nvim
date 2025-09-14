 return {
   'echasnovski/mini.nvim', version = false,
    config = function()
        local config_path = vim.fn.stdpath('config')
        local height = math.floor(0.618 * vim.o.lines)
        local width = math.floor(0.618 * vim.o.columns)
        -- MINI.STARTER
        require('mini.starter').setup({
            items = {
                item =
                {
                    section = "My Projects",
                    name = "VoidQuest",
                    action = ":edit ~/dev/voidquest/cargo.toml",
                },
                {
                    section = "Navigation & Help",
                    name = "Pick",
                    action = ":Pick files tool='git'",
                },
                {
                    section = "Navigation & Help",
                    name = "Files",
                    action = ":lua MiniFiles.open()",
                },
                {
                    section = "Navigation & Help",
                    name = "Quit",
                    action = ":qa!",
                },

                {
                    section = "Others",
                    name = "Neovim Config",
                    action = ":edit " .. config_path .."/init.lua",
                }
            }
            -- {
            --     name = "Quit",
            --     action =":qa!",
            -- }
        })
        -- MINI.AI
        require('mini.ai').setup()
        -- MINI.ANIMATE
        require('mini.animate').setup()
        -- MINI.ICONS
        require('mini.icons').setup()
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
        -- MINI.PICK 
        require('mini.pick').setup({
            window = { config = {
                anchor = 'nw', height = height, width = width,
              row = math.floor(0.5 * (vim.o.lines - height)),
              col = math.floor(0.5 * (vim.o.columns - width)),
              border = 'double',
            } }
        })

        -- MINI.STATUSLINE
        require('mini.statusline').setup()
        -- MINI.TABLINE
        -- require('mini.tabline').setup({
        --     show_icons = false
        -- })

        -- MINI.MOVE
        require('mini.move').setup()
    end
}
