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

-- ColorScheme
now(function()
  add('wtfox/jellybeans.nvim')
  local custom_color = {
      accent_1 = "#b39066",
      accent_2 = "#2f77ad",
      accent_3 = "#338844",
      error =    "#aa4455",
      warning =  "#a59a29",
      info =     "#856a29",
      -- white scale, from light to dark
      white =    "#aaaaaa",
      gray_1 =   "#777777",
      gray_2 =   "#555555",

      black_1 =     "#302f2d",
      black_2 =     "#2a2822",
      black_3 =     "#242422",
      black_4 =     "#1f1f1f",
   }

  require('jellybeans').setup({

    on_highlights = function(hl, c)
      -- general
      hl["Visual"] = { bg = custom_color.black_3}
      hl["Pmenu"] = { fg = custom_color.gray_2, bg = custom_color.black_3}
      hl["PmenuSel"] = { fg = custom_color.gray_1, bg = custom_color.black_4}
      hl["CursorLine"] = { bg = custom_color.black_2}
      hl["Search"] = { fg = custom_color.gray_1, bg = custom_color.black_3}
      hl["CurSearch"] = { fg = custom_color.white, bg = custom_color.black_4}
      -- mini tabline
      hl.MiniTabLineHidden = { fg = custom_color.gray_1, bg = custom_color.black_1}
      hl.MiniTabLineCurrent = { fg = custom_color.accent_3, bg = c.background}
      hl.MiniTabLineModifiedCurrent = { fg = custom_color.accent_1, bg = c.background, italic = true}
      hl.MiniTabLineModifiedHidden = { fg = custom_color.gray_1, bg = custom_color.black_1, italic = true}
      -- mini statusline
      hl["MiniStatusLineModeNormal"] = { bg = custom_color.accent_3, fg = custom_color.black_2}
      hl["MiniStatusLineModeInsert"] = { bg = custom_color.accent_2, fg = custom_color.black_2}
      hl["MiniStatusLineModeVisual"] = { bg = custom_color.accent_1, fg = custom_color.black_2}
      hl["MiniStatusLineDevInfo"] = { fg = custom_color.gray_1, bg = custom_color.black_4}
      hl["MiniStatusLineFileName"] = { fg = custom_color.gray_1, bg = custom_color.black_2}
      hl["MiniStatusLineFileInfo"] = { fg = custom_color.gray_1, bg = custom_color.black_2}
      hl["MiniStatusLineInactive"] = { fg = custom_color.gray_2, bg = custom_color.black_2}
      hl["MiniStatusLineModeOther"] = { fg = custom_color.gray_2, bg = custom_color.black_2}
      -- todo, fixme, hack, note
      hl.MiniHipatternsFixme = { fg = custom_color.error, bold = true}
      hl.MiniHipatternsTodo = { fg = c.accent_color_2, bold = true}
      hl.MiniHipatternsNote = { fg = custom_color.warning, bold = true}
      hl.MiniHipatternsHack = { fg = custom_color.info, bold = true}
      -- syntax
      hl["@lsp.mod.documentation.rust"] = { fg = custom_color.gray_1}
      hl["@comment.documentation.rust"] = { fg = custom_color.gray_1}
      hl["DiagnosticUnderlineHint"] = { blend = 100,  underdashed = true}
      hl["DiagnosticUnnecessary"] = { blend = 100,  underdashed = true}
      hl["Title"] = {fg = c.accent_color_2}
      -- mini files
      hl["MiniFilesNormal"] = {fg = custom_color.white, bg = custom_color.black_3}
      -- git diff (colored left numbers)
      hl["MiniDiffSignAdd"] = { fg = custom_color.accent_3}
      hl["MiniDiffSignChange"] = { fg = custom_color.accent_2}
      hl["MiniDiffSignDelete"] = { fg = custom_color.error}
      -- Vimdoc
      hl["@label.vimdoc"] = { fg = custom_color.accent_2, bold = true}
      hl["@markup.link"] = { fg = custom_color.accent_1}
      -- Neogit
      hl["NeogitSectionHeader"] = { fg = custom_color.accent_2}
      hl["NeogitDiffContext"] = { fg = custom_color.gray_1, bg = custom_color.black_1 }
      hl["NeogitDiffAdd"] = { fg = custom_color.accent_2, bg = custom_color.black_1 }
      hl["NeogitDiffDelete"] = { fg = custom_color.error, bg = custom_color.black_1 }
      hl["NeogitDiffHeader"] = { fg = custom_color.accent_2, bg = custom_color.black_1 }
      hl["NeogitDiffContextHighlight"] = {link = 'NeogitDiffContext'}
      hl["NeogitDiffAddHighlight"] = { link = 'NeogitDiffAdd'}
      hl["NeogitDiffDeleteHighlight"] = { link = 'NeogitDiffDelete'}
      hl["NeogitDiffHeaderHighlight"] = { link = 'NeogitDiffHeader'}
    end,
    on_colors = function(c)
      c.background = custom_color.black_1
      c.foreground = custom_color.white
      c.str = vim.o.background == "dark" and custom_color.accent_3
      c.accent_color_1 = vim.o.background == "dark" and  custom_color.accent_1
      c.accent_color_2 = vim.o.background == "dark" and  custom_color.accent_2
    end
  })
  vim.cmd('color jellybeans-mono')
end)
