-- ┌─────────────────────────┐
-- │ Plugins outside of MINI │
-- └─────────────────────────┘
--
-- This file contains installation and configuration of plugins outside of MINI.
-- They significantly improve user experience in a way not yet possible with MINI.
-- These are mostly plugins that provide programming language specific behavior.
--
-- Use this file to install and configure other such plugins.

-- Make concise helpers for installing/adding plugins in two stages.
-- Add some plugins now if Neovim is started like `nvim -- some-file` because
-- they are needed during startup to work correctly.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

-- Tree-sitter ================================================================

-- Tree-sitter is a tool for fast incremental parsing. It converts text into
-- a hierarchical structure (called tree) that can be used to implement advanced
-- and/or more precise actions: syntax highlighting, textobjects, indent, etc.
--
-- Tree-sitter support is built into Neovim (see `:h treesitter`). However, it
-- requires two extra pieces that don't come with Neovim directly:
-- - Language parsers: programs that convert text into trees. Some are built-in
--   (like for Lua), 'nvim-treesitter' provides many others.
-- - Query files: definitions of how to extract information from trees in
--   a useful manner (see `:h treesitter-query`). 'nvim-treesitter' also provides
--   these, while 'nvim-treesitter-textobjects' provides the ones for Neovim
--   textobjects (see `:h text-objects`, `:h MiniAi.gen_spec.treesitter()`).
--
-- Add these plugins now if file (and not 'mini.starter') is shown after startup.
now_if_args(function()
  add({
    source = 'nvim-treesitter/nvim-treesitter',
    -- Use `main` branch since `master` branch is frozen, yet still default
    checkout = 'main',
    -- Update tree-sitter parser after plugin is updated
    hooks = { post_checkout = function() vim.cmd('TSUpdate') end },
  })
  add({
    source = 'nvim-treesitter/nvim-treesitter-textobjects',
    -- Same logic as for 'nvim-treesitter'
    checkout = 'main',
  })

  -- Ensure installed parsers for listed languages. Add to `languages`
  -- array languages which you want to have installed. To see available languages:
  -- - Execute `:=require('nvim-treesitter').get_available()`
  -- - Visit
  --   https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
  local ensure_languages = {
    -- These are already installed. Used as an example.
    'lua',
    'vimdoc',
    'markdown',
    'rust'
  }
  local isnt_installed = function(lang)
    return #vim.api.nvim_get_runtime_file('parser/' .. lang .. '.*', false) == 0
  end
  local to_install = vim.tbl_filter(isnt_installed, ensure_languages)
  if #to_install > 0 then require('nvim-treesitter').install(to_install) end

  -- Ensure tree-sitter enabled after opening a file for target language
  local filetypes = {}
  for _, lang in ipairs(ensure_languages) do
    for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
      table.insert(filetypes, ft)
    end
  end
  local ts_start = function(ev) vim.treesitter.start(ev.buf) end
  _G.Config.new_autocmd('FileType', filetypes, ts_start, 'Start tree-sitter')
end)

-- Language servers ===========================================================

-- Language Server Protocol (LSP) is a set of conventions that power creation of
-- language specific tools. It requires two parts:
-- - Server - program that performs language specific computations.
-- - Client - program that asks server for computations and shows results.
--
-- Here Neovim itself is a client (see `:h vim.lsp`). Language servers need to
-- be installed separately based on your OS, CLI tools, and preferences.
-- See note about 'mason.nvim' at the bottom of the file.
--
-- Neovim's team collects commonly used configurations for most language servers
-- inside 'neovim/nvim-lspconfig' plugin.
--
-- Add it now if file (and not 'mini.starter') is shown after startup.
now_if_args(function()
  add('neovim/nvim-lspconfig')

  -- Use `:h vim.lsp.enable()` to automatically enable language server based on
  -- the rules provided by 'nvim-lspconfig'.
  -- Use `:h vim.lsp.config()` or 'ftplugin/lsp/' directory to configure servers.
  -- Uncomment and tweak the following `vim.lsp.enable()` call to enable servers.
  vim.lsp.enable({
    'lua_ls',
    'rust_analyzer',
    -- For example, if `lua-language-server` is installed, use `'lua_ls'` entry
  })
end)

-- Formatting =================================================================

-- Programs dedicated to text formatting (a.k.a. formatters) are very useful.
-- Neovim has built-in tools for text formatting (see `:h gq` and `:h 'formatprg'`).
-- They can be used to configure external programs, but it might become tedious.
--
-- The 'stevearc/conform.nvim' plugin is a good and maintained solution for easier
-- formatting setup.
later(function()
  add('stevearc/conform.nvim')

  -- See also:
  -- - `:h Conform`
  -- - `:h conform-options`
  -- - `:h conform-formatters`
  require('conform').setup({
    -- Map of filetype to formatters
    -- Make sure that necessary CLI tool is available
    -- formatters_by_ft = { lua = { 'stylua' } },
  })
end)

-- Neogit =====================================================================

later(function()
  add({
    source = 'NeogitOrg/neogit',
    depends = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }
  })
end)

-- Marks =====================================================================

later(function()
  add('fnune/recall.nvim')
  require('recall').setup({})
end)

-- Snippets ===================================================================

-- Although 'mini.snippets' provides functionality to manage snippet files, it
-- deliberately doesn't come with those.
--
-- The 'rafamadriz/friendly-snippets' is currently the largest collection of
-- snippet files. They are organized in 'snippets/' directory (mostly) per language.
-- 'mini.snippets' is designed to work with it as seamlessly as possible.
-- See `:h MiniSnippets.gen_loader.from_lang()`.
later(function() add('rafamadriz/friendly-snippets') end)

-- Honorable mentions =========================================================

-- 'mason-org/mason.nvim' (a.k.a. "Mason") is a great tool (package manager) for
-- installing external language servers, formatters, and linters. It provides
-- a unified interface for installing, updating, and deleting such programs.
--
-- The caveat is that these programs will be set up to be mostly used inside Neovim.
-- If you need them to work elsewhere, consider using other package managers.
--
-- You can use it like so:
-- later(function()
--   add('mason-org/mason.nvim')
--   require('mason').setup()
-- end)

-- Beautiful, usable, well maintained color schemes outside of 'mini.nvim' and
-- have full support of its highlight groups. Use if you don't like 'miniwinter'
-- enabled in 'plugin/30_mini.lua' or other suggested 'mini.hues' based ones.
-- now(function()
--   --   -- Install only those that you need
--   add('sainnhe/everforest')
--   vim.g.everforest_enable_italic = true
--   vim.g.everforest_background = 'medium'
--   vim.g.everforest_ui_contrast = 'soft'
--   -- add('Shatur/neovim-ayu')
--   -- add('sainnhe/gruvbox-material')
--   -- vim.g.gruvbox_material_enable_italic = true
--   -- vim.g.gruvbox_material_background = 'soft'
--   -- vim.cmd('color everforest')
-- end)

-- Blink (autocompletion)
-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
local function build_blink(params)
  vim.notify('Building blink.cmp', vim.log.levels.INFO)
  local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = params.path }):wait()
  if obj.code == 0 then
    vim.notify('Building blink.cmp done', vim.log.levels.INFO)
  else
    vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
  end
end

later(function()
  add({
  source = 'Saghen/blink.cmp',
  hooks = {
    post_install = build_blink,
    post_checkout = build_blink,
  },
})
  require('blink.cmp').setup({
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      trigger = {
        show_on_trigger_character = true,
        show_on_blocked_trigger_characters = { ' ', '\n', '\t' }
      },
      ghost_text = {
        -- enabled = true
      },
      documentation = { auto_show = false },
      menu = {
        -- Delay before showing the completion menu while typing
        auto_show_delay_ms = 500,
        -- Disable auto menu
        -- auto_show = false,
      }
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    signature = { enabled = true },
    fuzzy = {
      implementation = 'prefer_rust',
    },
  })
end)

-- ColorScheme
now(function()
  vim.cmd('color dunque')
end)

-- render-markdown
later(function()
  add('https://github.com/MeanderingProgrammer/render-markdown.nvim')
  require('render-markdown').setup({})
end)

-- Bento Buffer Manager

later(function()
  add('serhez/bento.nvim')
  require('bento').setup({
    max_open_buffers = 5,
    ui = {
      mode = "floating",
      floating = {
        position = "top-right",
        offset_y = 10,
        minimal_menu = "dashed"
      }
    }
    -- main_keymap = ";", -- Main toggle/expand key
    -- lock_char = "🔒", -- Character shown before locked buffer names
    -- max_open_buffers = nil, -- Max buffers (nil = unlimited)
    -- buffer_deletion_metric = "frecency_access", -- Metric for buffer deletion (see below)
    -- buffer_notify_on_delete = true, -- Notify when deleting a buffer (false for silent deletion)
    -- ordering_metric = "access", -- Buffer ordering: nil (arbitrary), "access", or "edit"
    -- default_action = "open", -- Action when pressing label directly
    --
    -- ui = {
    --     mode = "floating", -- "floating" | "tabline"
    --     floating = {
    --         position = "middle-right", -- See position options below
    --         offset_x = 0, -- Horizontal offset from position
    --         offset_y = 0, -- Vertical offset from position
    --         dash_char = "─", -- Character for collapsed dashes
    --         label_padding = 1, -- Padding around labels
    --         minimal_menu = nil, -- nil | "dashed" | "filename" | "full"
    --         max_rendered_buffers = nil, -- nil (no limit) or number for pagination
    --     },
    --     tabline = {
    --         left_page_symbol = "❮", -- Symbol shown when previous buffers exist
    --         right_page_symbol = "❯", -- Symbol shown when more buffers exist
    --         separator_symbol = "│", -- Separator between buffer components
    --     },
    -- },
    --
    -- -- Highlight groups
    -- highlights = {
    --     current = "Bold", -- Current buffer filename (in last editor window)
    --     active = "Normal", -- Active buffers visible in other windows
    --     inactive = "Comment", -- Inactive/hidden buffer filenames
    --     modified = "DiagnosticWarn", -- Modified/unsaved buffer filenames and dashes
    --     inactive_dash = "Comment", -- Inactive buffer dashes in collapsed state
    --     previous = "Search", -- Label for previous buffer (main_keymap label)
    --     label_open = "DiagnosticVirtualTextHint", -- Labels in open action mode
    --     label_delete = "DiagnosticVirtualTextError", -- Labels in delete action mode
    --     label_vsplit = "DiagnosticVirtualTextInfo", -- Labels in vertical split mode
    --     label_split = "DiagnosticVirtualTextInfo", -- Labels in horizontal split mode
    --     label_lock = "DiagnosticVirtualTextWarn", -- Labels in lock action mode
    --     label_minimal = "Visual", -- Labels in collapsed "full" mode
    --     window_bg = "BentoNormal", -- Menu window background
    --     page_indicator = "Comment", -- Pagination indicators (● ○ ○ for floating, ❮/❯ for tabline)
    --     separator = "Normal", -- Separator between buffer components in tabline
    -- },
    --
    -- -- Custom actions
    -- actions = {},
})
end)
